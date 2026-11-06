#!/usr/bin/env python3
"""Collect a local system power and activity snapshot."""
import datetime as dt
import json
import math
import os
from pathlib import Path
import re
import subprocess
import time
import tempfile

ROOT = Path(__file__).resolve().parent
DATA = ROOT / 'data'
FAN_CACHE = Path('/run/power-a2z/fan.json')


def run(args, timeout=4):
    try:
        p = subprocess.run(args, capture_output=True, text=True, timeout=timeout)
        return {'returncode': p.returncode, 'stdout': p.stdout.strip(), 'stderr': p.stderr.strip()}
    except Exception as e:
        return {'error': str(e)}


def read(path):
    try:
        return Path(path).read_text().strip()
    except Exception:
        return None


def tree_values(path):
    root = Path(path)
    result = {}
    if root.exists():
        for f in root.iterdir():
            if f.is_file():
                v = read(f)
                if v is not None:
                    result[f.name] = v
    return result


def hardware_tree(root, glob):
    out = []
    for p in sorted(Path(root).glob(glob)):
        if p.is_file():
            val = read(p)
            if val is not None:
                out.append({'path': str(p), 'value': val})
        elif p.is_dir():
            vals = tree_values(p)
            if vals:
                out.append({'path': str(p), **vals})
    return out


def hwmon_readings(root, pattern):
    readings = hardware_tree(root, pattern)
    for sensor in readings:
        path = Path(sensor['path'])
        sensor['name'] = read(path.parent / 'name') or path.parent.name
        for suffix in ('label', 'min', 'max', 'crit', 'alarm', 'crit_alarm', 'fault'):
            value = read(str(path).removesuffix('_input') + '_' + suffix)
            if value is not None:
                sensor[suffix] = value
    return readings


def firmware_fan(now=None, cache=FAN_CACHE):
    """Consume only recent successful readings from the privileged sampler."""
    result = {'status': 'unavailable', 'rpm': None}
    try:
        sample = json.loads(Path(cache).read_text())
        # The sampler may publish while other snapshot fields are being read.
        # Compare with the cache read time, rather than the snapshot start time.
        now = now or dt.datetime.now(dt.timezone.utc)
        timestamp = dt.datetime.fromisoformat(sample['timestamp'])
        age = (now - timestamp).total_seconds()
        result['timestamp'] = timestamp.isoformat()
        result['observed_at'] = now.isoformat()
        if not 0 <= age <= 30:
            result['status'] = 'stale'
        elif sample.get('status') != 'ok':
            result['status'] = 'error'
        else:
            rpm = float(sample['rpm'])
            if isinstance(sample['rpm'], bool) or not math.isfinite(rpm) or not 0 <= rpm <= 20000:
                raise ValueError('Invalid fan speed')
            result.update(status='ok', rpm=rpm, name='Motobook CPU fan')
    except (OSError, ValueError, TypeError, KeyError):
        pass
    return result


def collect_thermals(now=None, hwmon='/sys/class/hwmon', thermal='/sys/class/thermal', cache=FAN_CACHE):
    zones = []
    for path in sorted(Path(thermal).glob('thermal_zone*')):
        zones.append({'path': str(path), 'type': read(path / 'type'), 'value': read(path / 'temp')})
    return {'temperatures_hwmon': hwmon_readings(hwmon, 'hwmon*/temp*_input'),
            'thermal_zones': zones, 'fans_hwmon': hwmon_readings(hwmon, 'hwmon*/fan*_input'),
            'fan_firmware': firmware_fan(now, cache)}


def sampled_power(cache=Path('/run/power-a2z/power.json'), now=None):
    try:
        sample = json.loads(Path(cache).read_text())
        observed = now or dt.datetime.now(dt.timezone.utc)
        timestamp = dt.datetime.fromisoformat(sample['timestamp'])
        if not 0 <= (observed - timestamp).total_seconds() <= 30:
            return {'status': 'stale'}
        sample['observed_at'] = observed.isoformat()
        return sample
    except (OSError, ValueError, TypeError, KeyError):
        return {'status': 'unavailable'}


def input_devices():
    try:
        activity = json.loads((ROOT / 'data' / 'input_activity.json').read_text())
    except Exception:
        activity = {}
    last = activity.get('last_activity', {})
    known = {d.get('node'): d for d in activity.get('devices', [])}
    devices = []
    for p in sorted(Path('/sys/class/input').glob('event*')):
        name = read(p / 'device/name') or ''
        low = name.lower()
        kind = 'keyboard' if 'keyboard' in low or 'kbd' in low else ('touchpad' if 'touchpad' in low or 'trackpad' in low else None)
        if not kind:
            continue
        node = Path('/dev/input') / p.name
        can_read = os.access(node, os.R_OK)
        activity_time = last.get(kind)
        recent = None
        if activity_time:
            try:
                age = (dt.datetime.now().astimezone() - dt.datetime.fromisoformat(activity_time)).total_seconds()
                recent = 0 <= age <= 10
            except ValueError:
                pass
        devices.append({'type': kind, 'name': name, 'node': str(node), 'connected': node.exists(),
                        'readable': can_read or str(node) in known,
                        'activity_recently': recent,
                        'last_activity': activity_time,
                        'activity_status': 'tracked' if str(node) in known else ('waiting_for_input_group_session' if can_read else 'unknown_no_input_device_permission')})
    return devices


def main():
    now = dt.datetime.now().astimezone()
    stamp = now.strftime('%Y%m%dT%H%M%S%z')
    DATA.mkdir(parents=True, exist_ok=True)
    snap = {'timestamp': now.isoformat(), 'interval_seconds': 10}

    snap['power_supplies'] = hardware_tree('/sys/class/power_supply', '*')
    snap.update(collect_thermals())
    snap['rapl_power'] = sampled_power()
    snap['sensors'] = run(['sensors', '-j'])

    # CPU aggregate and per-core counters (Linux jiffies; deltas can be derived between samples).
    snap['cpu_stat'] = read('/proc/stat')
    snap['loadavg'] = read('/proc/loadavg')
    snap['meminfo'] = read('/proc/meminfo')
    snap['processes'] = run(['ps', '-eo', 'pid,ppid,comm,%cpu,%mem,rss,vsz,stat,etime', '--sort=-%mem'], timeout=8)

    snap['gpu'] = {
        'sysfs': hardware_tree('/sys/class/drm', 'card*/device/gpu_busy_percent'),
        'hwmon': hardware_tree('/sys/class/hwmon', 'hwmon*/power*'),
        'nvidia_smi': run(['nvidia-smi', '--query-gpu=name,utilization.gpu,power.draw,temperature.gpu,memory.used,memory.total', '--format=csv,noheader'], timeout=3),
        'rocm_smi': run(['rocm-smi', '--showuse', '--showpower', '--showtemp', '--json'], timeout=3),
    }
    snap['display'] = {
        'focused_output': run(['niri', 'msg', 'focused-output']),
        'outputs': run(['niri', 'msg', 'outputs']),
        'brightness_devices': hardware_tree('/sys/class/backlight', '*'),
        'brightnessctl': run(['brightnessctl', '-m']),
    }
    snap['active_window'] = run(['niri', 'msg', 'focused-window', '-j'])
    snap['audio'] = {
        'sinks': run(['pactl', '-f', 'json', 'list', 'sinks']),
        'sources': run(['pactl', '-f', 'json', 'list', 'sources']),
        'players': run(['playerctl', '-a', 'metadata', '--format', '{{playerName}}\t{{status}}\t{{volume}}\t{{artist}}\t{{title}}\t{{album}}']),
        'player_status': run(['playerctl', '-a', 'status']),
        'wpctl': run(['wpctl', 'get-volume', '@DEFAULT_AUDIO_SINK@']),
    }
    snap['peripherals'] = {
        'usb_devices': hardware_tree('/sys/bus/usb/devices', '*'),
        'pci_devices': run(['sh', '-c', 'for d in /sys/bus/pci/devices/*; do [ -e "$d" ] || continue; printf "%s " "${d##*/}"; cat "$d/vendor" "$d/device" 2>/dev/null | tr "\\n" " "; echo; done']),
        'bluetooth': run(['bluetoothctl', 'devices', 'Connected']),
        'input_devices': read('/proc/bus/input/devices'),
        'keyboard_touchpad': input_devices(),
    }

    focused = snap['display']['focused_output'].get('stdout', '')
    match = re.search(r'^Output .*\(([^()]*)\)', focused, re.MULTILINE)
    output_name = match.group(1) if match else None
    grim = ROOT / 'bin' / 'grim'
    image_stats = {'output': output_name}
    if output_name and grim.exists():
        # Keep only derived screen-content features; discard the temporary capture.
        with tempfile.TemporaryDirectory(prefix='power-a2z-') as temp_dir:
            shot = Path(temp_dir) / 'frame.png'
            captured = run([str(grim), '-o', output_name, str(shot)], timeout=12)
            if shot.exists():
                analysis = run(['ffmpeg', '-hide_banner', '-loglevel', 'info', '-i', str(shot), '-vf', 'signalstats,metadata=print', '-frames:v', '1', '-f', 'null', '-'], timeout=12)
                stats = {}
                for key, value in re.findall(r'lavfi\.signalstats\.([A-Z]+)=([0-9.]+)', analysis.get('stderr', '')):
                    stats[key.lower()] = float(value)
                dimensions = re.search(r'Video:.*?, (\d+x\d+)', analysis.get('stderr', ''))
                image_stats.update({'width_height': dimensions.group(1) if dimensions else None,
                                    'yuv_signalstats': stats, 'capture_ok': captured.get('returncode') == 0,
                                    'analysis_ok': analysis.get('returncode') == 0})
            else:
                image_stats.update({'capture_ok': False, 'capture_error': captured})
    else:
        image_stats['error'] = 'focused output or bundled grim unavailable'
    snap['oled_screen_content'] = image_stats
    out = DATA / f'{now:%Y-%m-%d}.jsonl'
    with out.open('a') as f:
        f.write(json.dumps(snap, separators=(',', ':')) + '\n')


if __name__ == '__main__':
    main()
