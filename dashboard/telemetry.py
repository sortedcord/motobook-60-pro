"""Read the collector's append-only logs without exposing raw system activity."""
from __future__ import annotations

import bisect
import datetime as dt
import json
import math
from pathlib import Path
import re
import threading


def number(value):
    try:
        value = float(value)
        return value if math.isfinite(value) else None
    except (TypeError, ValueError):
        return None


def scaled(source, key, divisor=1_000_000):
    value = number(source.get(key))
    return value / divisor if value is not None else None


def ratio(value, total):
    return value / total * 100 if value is not None and total and total > 0 else None


def cpu_counters(record):
    try:
        line = record['cpu_stat'].splitlines()[0].split()
        if line[0] != 'cpu':
            return None
        values = [int(n) for n in line[1:9]]  # guest counters are already in user/nice.
        return sum(values), values[3] + (values[4] if len(values) > 4 else 0)
    except (KeyError, AttributeError, IndexError, ValueError):
        return None


def temperature(value):
    value = number(value)
    # Ignore firmware sentinel values, including invalid NVMe limits.
    return value if value is not None and -273.15 <= value <= 1000 else None


def thermal_metrics(record, timestamp):
    temperatures = []
    for index, raw in enumerate(record.get('temperatures_hwmon') or []):
        name = raw.get('name') or 'hwmon'
        path = Path(raw.get('path', ''))
        label = raw.get('label') or f'{path.parent.name} {path.stem}'.strip() or f'Temperature {index + 1}'
        current = temperature(scaled(raw, 'value', 1000))
        maximum = temperature(scaled(raw, 'max', 1000))
        critical = temperature(scaled(raw, 'crit', 1000))
        fault = raw.get('fault') == '1'
        if fault:
            current = None
        status = ('unavailable' if current is None else
                  'critical' if raw.get('crit_alarm') == '1' or (critical is not None and current >= critical) else
                  'warning' if raw.get('alarm') == '1' or (maximum is not None and current >= maximum) else 'normal')
        temperatures.append({'id': raw.get('path') or f'hwmon-{index}', 'name': name,
                             'label': label, 'source': 'hwmon', 'temp_c': current,
                             'max_c': maximum, 'crit_c': critical, 'status': status})
    for index, raw in enumerate(record.get('thermal_zones') or []):
        temperatures.append({'id': raw.get('path') or f'zone-{index}', 'name': 'Thermal zone',
                             'label': raw.get('type') or f'Zone {index + 1}', 'source': 'thermal_zone',
                             'temp_c': temperature(scaled(raw, 'value', 1000)),
                             'max_c': None, 'crit_c': None,
                             'status': 'normal' if temperature(scaled(raw, 'value', 1000)) is not None else 'unavailable'})
    cpu_temperatures = [t['temp_c'] for t in temperatures if t['temp_c'] is not None and
                        re.search(r'package|tctl|tdie|cpu|^Core ', t['label'], re.I)]
    fans = []
    for index, raw in enumerate(record.get('fans_hwmon') or []):
        rpm = number(raw.get('value'))
        if rpm is not None and (rpm < 0 or raw.get('fault') == '1'):
            rpm = None
        fans.append({'id': raw.get('path') or f'fan-{index}', 'name': raw.get('name') or 'hwmon',
                     'label': raw.get('label') or Path(raw.get('path', '')).stem or f'Fan {index + 1}',
                     'source': 'hwmon', 'rpm': rpm,
                     'status': 'unavailable' if rpm is None else 'warning' if raw.get('alarm') == '1' else 'ok'})
    firmware = record.get('fan_firmware') or {}
    firmware_status = firmware.get('status', 'unavailable')
    rpm = None
    if firmware_status == 'ok':
        try:
            observed = dt.datetime.fromisoformat(firmware['observed_at']) if 'observed_at' in firmware else timestamp
            if not 0 <= (observed - timestamp).total_seconds() <= 30:
                raise ValueError('Invalid fan observation time')
            age = (observed - dt.datetime.fromisoformat(firmware['timestamp'])).total_seconds()
            candidate = number(firmware.get('rpm'))
            if not 0 <= age <= 30:
                firmware_status = 'stale'
            elif candidate is None or isinstance(firmware.get('rpm'), bool) or not 0 <= candidate <= 20000:
                firmware_status = 'error'
            else:
                rpm = candidate
        except (KeyError, TypeError, ValueError):
            firmware_status = 'error'
    if firmware:
        fans.append({'id': 'motobook-firmware', 'name': 'Motobook', 'label': 'CPU fan',
                     'source': 'firmware', 'rpm': rpm, 'status': firmware_status})
    speeds = [f['rpm'] for f in fans if f['rpm'] is not None]
    hottest = max((t for t in temperatures if t['temp_c'] is not None),
                  key=lambda t: t['temp_c'], default=None)
    return {'temperatures': temperatures, 'fans': fans,
            'cpu_temp_c': max(cpu_temperatures, default=None),
            'hottest_temp_c': hottest['temp_c'] if hottest else None,
            'hottest_sensor': f"{hottest['name']} · {hottest['label']}" if hottest else None,
            'fan_rpm': max(speeds, default=None),
            'fan_status': 'ok' if speeds else firmware_status}


def rapl_metrics(record, timestamp):
    result = {'cpu_package_w': None, 'platform_psys_w': None, 'power_window_seconds': None}
    sample = record.get('rapl_power') or {}
    if sample.get('status') != 'ok':
        return result
    try:
        observed = dt.datetime.fromisoformat(sample.get('observed_at', timestamp.isoformat()))
        age = (observed - dt.datetime.fromisoformat(sample['timestamp'])).total_seconds()
        window = number(sample.get('window_seconds'))
        if not 0 <= (observed - timestamp).total_seconds() <= 30 or not 0 <= age <= 30 or window is None or not 0 < window <= 60:
            return result
        result['power_window_seconds'] = window
        for key in ('cpu_package_w', 'platform_psys_w'):
            value = number(sample.get(key))
            if value is not None and value >= 0 and not isinstance(sample.get(key), bool):
                result[key] = value
    except (KeyError, ValueError, TypeError):
        pass
    return result


def normalize(record, previous=None):
    timestamp = dt.datetime.fromisoformat(record['timestamp'])
    if timestamp.tzinfo is None:
        timestamp = timestamp.astimezone()
    supplies = record.get('power_supplies') or []
    batteries = [b for b in supplies if b.get('type') == 'Battery'
                 and b.get('present', '1') != '0' and b.get('scope') != 'Device']
    battery = batteries[0] if batteries else {}
    voltage = scaled(battery, 'voltage_now')
    nominal_voltage = scaled(battery, 'voltage_min_design') or voltage

    def energy(energy_key, charge_key):
        value = scaled(battery, energy_key)
        if value is None:
            charge = scaled(battery, charge_key)
            value = charge * nominal_voltage if charge is not None and nominal_voltage else None
        return value

    remaining = energy('energy_now', 'charge_now')
    full = energy('energy_full', 'charge_full')
    design = energy('energy_full_design', 'charge_full_design')
    capacity = number(battery.get('capacity'))
    if capacity is None:
        capacity = ratio(remaining, full)
    power = scaled(battery, 'power_now')
    current = scaled(battery, 'current_now')
    if power is None and current is not None and voltage is not None:
        power = abs(current * voltage)
    if power is not None:
        power = abs(power)
    if current is None and power is not None and voltage:
        current = power / voltage
    state = battery.get('status', 'Unavailable')
    runtime = None
    if power and power > 0.1:
        if state == 'Discharging' and remaining is not None:
            runtime = remaining / power * 3600
        elif state == 'Charging' and remaining is not None and full is not None:
            runtime = max(0, full - remaining) / power * 3600

    counters = cpu_counters(record)
    cpu = None
    if counters and previous:
        total, idle = counters[0] - previous[0], counters[1] - previous[1]
        if total > 0 and 0 <= idle <= total:
            cpu = (total - idle) / total * 100
    thermals = thermal_metrics(record, timestamp)
    memory = dict(re.findall(r'^(\w+):\s+(\d+)', record.get('meminfo') or '', re.M))
    total_mem, available_mem = number(memory.get('MemTotal')), number(memory.get('MemAvailable'))
    memory_pct = ratio(total_mem - available_mem, total_mem) if total_mem is not None and available_mem is not None else None
    brightness_devices = (record.get('display') or {}).get('brightness_devices') or []
    display = brightness_devices[0] if brightness_devices else {}
    brightness = ratio(number(display.get('actual_brightness', display.get('brightness'))),
                       number(display.get('max_brightness')))
    adapters = [s for s in supplies if s.get('type') != 'Battery' and 'online' in s]
    ac_online = any(s.get('online') == '1' for s in adapters) if adapters else None
    return {
        'timestamp': timestamp.isoformat(), 'time': timestamp.timestamp() * 1000,
        'interval_seconds': number(record.get('interval_seconds')) or 10,
        'capacity_pct': capacity, 'power_w': power, 'state': state,
        'energy_wh': remaining, 'full_wh': full, 'design_wh': design,
        'health_pct': ratio(full, design), 'voltage_v': voltage,
        'current_a': abs(current) if current is not None else None,
        'cycle_count': number(battery.get('cycle_count')), 'runtime_seconds': runtime,
        'ac_online': ac_online, 'battery_name': Path(battery.get('path', 'Unknown')).name,
        'battery_count': len(batteries), 'model': battery.get('model_name'),
        'manufacturer': battery.get('manufacturer'), 'technology': battery.get('technology'),
        'cpu_pct': cpu, **thermals, **rapl_metrics(record, timestamp), 'memory_pct': memory_pct,
        'brightness_pct': brightness,
        'screen_on_estimate': (None if not display or display.get('bl_power') not in ('0', '1', '2', '3', '4') or brightness is None
                               else display.get('bl_power') == '0' and brightness > 0),
    }, counters


def summarize(samples):
    """Integrate adjacent samples, excluding suspend/collection gaps."""
    observed = energy = weighted_power = duration_power = 0.0
    for a, b in zip(samples, samples[1:]):
        seconds = (b['time'] - a['time']) / 1000
        if not 0 < seconds <= max(60, 3 * a['interval_seconds']):
            continue
        observed += seconds
        if a['power_w'] is not None and b['power_w'] is not None and a['state'] == b['state']:
            watts = (a['power_w'] + b['power_w']) / 2
            weighted_power += watts * seconds
            duration_power += seconds
            if a['state'] == 'Discharging':
                energy += watts * seconds / 3600
    powers = [s['power_w'] for s in samples if s['power_w'] is not None]
    return {
        'count': len(samples), 'observed_seconds': observed,
        'energy_used_wh': energy if duration_power else None,
        'average_power_w': weighted_power / duration_power if duration_power else (powers[-1] if powers else None),
        'peak_power_w': max(powers, default=None),
    }


def battery_sessions(samples):
    """Build sessions from the complete timeline; gaps make boundaries uncertain."""
    sessions = []
    current = None
    previous = None

    def finish(end, reason, complete):
        nonlocal current
        if current is None:
            return
        current['end'] = end['timestamp']
        current['end_time'] = end['time']
        current['end_pct'] = end['capacity_pct']
        current['duration_seconds'] = (end['time'] - current['start_time']) / 1000
        current['complete'] = complete and not current['partial_start'] and not current['has_gaps']
        current['end_reason'] = reason
        if not current['_power_seconds']:
            current['energy_wh'] = None
        current['average_power_w'] = (current.pop('_power_sum') / current['_power_seconds']
                                      if current['_power_seconds'] else None)
        current.pop('_power_seconds')
        if not current.pop('_screen_known'):
            current['screen_on_seconds'] = None
        sessions.append(current)
        current = None

    for sample in samples:
        kind = sample['state'] if sample['state'] in ('Charging', 'Discharging') else None
        if kind == 'Discharging' and sample['ac_online'] is True:
            kind = None
        gap = previous is not None and (sample['time'] - previous['time']) / 1000 > max(60, 3 * previous['interval_seconds'])
        changed = previous is not None and (sample['state'] != previous['state'] or
                  (sample['ac_online'] is not None and previous['ac_online'] is not None and sample['ac_online'] != previous['ac_online']))
        if current and (changed or kind != current['type']):
            finish(previous if gap else sample, 'gap' if gap else 'state change', not gap)
        elif current and gap:
            current['has_gaps'] = True
        if kind and current is None:
            # The AC connection can precede the firmware's charging status by a sample.
            start = (previous if kind == 'Charging' and previous and not gap and
                     previous['state'] == 'Discharging' and previous['ac_online'] is True and
                     sample['ac_online'] is True else sample)
            current = {'type': kind, 'start': start['timestamp'], 'start_time': start['time'],
                       'start_pct': start['capacity_pct'], 'partial_start': previous is None or gap or previous['state'] == 'Unavailable',
                       'has_gaps': False,
                       'screen_on_seconds': 0.0, '_screen_known': False, '_power_sum': 0.0,
                       '_power_seconds': 0.0, 'peak_power_w': None, 'energy_wh': 0.0,
                       'observed_seconds': 0.0}
        if current:
            power = sample['power_w']
            if power is not None:
                current['peak_power_w'] = max(current['peak_power_w'] or 0, power)
            if previous and not gap and not changed and previous['state'] == kind:
                seconds = (sample['time'] - previous['time']) / 1000
                if seconds > 0:
                    current['observed_seconds'] += seconds
                    if previous.get('screen_on_estimate') is not None:
                        current['_screen_known'] = True
                        if previous['screen_on_estimate']:
                            current['screen_on_seconds'] += seconds
                    if previous['power_w'] is not None and power is not None:
                        watts = (previous['power_w'] + power) / 2
                        current['_power_sum'] += watts * seconds
                        current['_power_seconds'] += seconds
                        current['energy_wh'] += watts * seconds / 3600
        previous = sample
    if current:
        finish(previous, 'ongoing', False)
    return list(reversed(sessions))


class TelemetryStore:
    """Cache compact samples and consume only newly appended complete lines."""
    def __init__(self, directory):
        self.directory = Path(directory)
        self.files = {}
        self.lock = threading.Lock()

    def _refresh(self):
        paths = sorted(self.directory.glob('????-??-??.jsonl'))
        present = set(paths)
        for path in list(self.files):
            if path not in present:
                del self.files[path]
        for path in paths:
            try:
                stat = path.stat()
                state = self.files.get(path)
                # Rebuild for rotation, truncation, or same-size replacement.
                identity = (stat.st_dev, stat.st_ino)
                if (not state or state['identity'] != identity or stat.st_size < state['offset']
                        or (stat.st_size == state['offset'] and stat.st_mtime_ns != state['mtime'])):
                    state = {'identity': identity, 'offset': 0, 'mtime': 0,
                             'samples': [], 'counters': None, 'skipped': 0}
                    self.files[path] = state
                if stat.st_size == state['offset']:
                    continue
                with path.open('rb') as stream:
                    stream.seek(state['offset'])
                    while True:
                        start = stream.tell()
                        line = stream.readline()
                        if not line or not line.endswith(b'\n'):
                            # A collector may still be writing its final record.
                            state['offset'] = start
                            break
                        state['offset'] = stream.tell()
                        try:
                            raw = json.loads(line)
                            sample, counters = normalize(raw, state['counters'])
                            state['samples'].append(sample)
                            state['counters'] = counters
                        except (ValueError, TypeError, KeyError, AttributeError, OverflowError):
                            state['skipped'] += 1
                state['mtime'] = stat.st_mtime_ns
            except (FileNotFoundError, PermissionError, OSError):
                continue

    def query(self, range_name='6h', day='latest'):
        if range_name not in ('1h', '6h', '24h', 'all'):
            raise ValueError('Range must be 1h, 6h, 24h, or all.')
        if day != 'latest' and not re.fullmatch(r'\d{4}-\d{2}-\d{2}', day):
            raise ValueError('Date must be latest or YYYY-MM-DD.')
        with self.lock:
            self._refresh()
            dates = [p.stem for p, state in sorted(self.files.items()) if state['samples']]
            timeline = sorted((s for state in self.files.values() for s in state['samples']), key=lambda s: s['time'])
            all_sessions = battery_sessions(timeline)
            samples = sorted((s for p, state in self.files.items()
                              if day == 'latest' or p.stem == day for s in state['samples']),
                             key=lambda s: s['time'])
            latest = samples[-1] if samples else None
            if latest and range_name != 'all':
                cutoff = latest['time'] - int(range_name[:-1]) * 3_600_000
                start = bisect.bisect_left(samples, cutoff, key=lambda s: s['time'])
                samples = samples[start:]
            events = []
            previous = None
            for sample in samples:
                if previous and (sample['state'] != previous['state'] or sample['ac_online'] != previous['ac_online']):
                    events.append({'timestamp': sample['timestamp'], 'time': sample['time'],
                                   'state': sample['state'], 'ac_online': sample['ac_online'],
                                   'capacity_pct': sample['capacity_pct'], 'power_w': sample['power_w']})
                previous = sample
            return {
                'samples': samples, 'latest': latest, 'dates': dates,
                'sessions': [s for s in all_sessions if samples and s['end_time'] >= samples[0]['time'] and s['start_time'] <= samples[-1]['time']],
                'summary': summarize(samples), 'events': list(reversed(events))[:80],
                'range': range_name, 'day': day,
                'generated_at': dt.datetime.now(dt.timezone.utc).isoformat(),
                'skipped_records': sum(s['skipped'] for s in self.files.values()),
            }
