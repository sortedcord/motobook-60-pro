#!/usr/bin/env python3
"""Publish read-only RAPL CPU-package and PSYS power readings for the user collector."""
import datetime as dt
import json
import math
from pathlib import Path
import re
import tempfile
import os
import time

CACHE = Path('/run/power-a2z')


def zones(root='/sys/class/powercap'):
    result = {}
    for path in sorted(Path(root).glob('intel-rapl:*')):
        if not re.fullmatch(r'intel-rapl:\d+', path.name):
            continue  # Exclude child domains and duplicate MMIO counters.
        try:
            name = (path / 'name').read_text().strip()
            if name != 'psys' and not re.fullmatch(r'package-\d+', name):
                continue
            energy = int((path / 'energy_uj').read_text())
            limit = int((path / 'max_energy_range_uj').read_text())
            if 0 <= energy <= limit and limit > 0:
                result[path.name] = {'name': name, 'energy_uj': energy, 'range_uj': limit}
        except (OSError, ValueError):
            continue
    return result


def derive(current, previous):
    """Reject reboot, suspend and long gaps; handle an observed counter rollover."""
    watts = {}
    try:
        elapsed = current['monotonic'] - previous['monotonic']
        boot_elapsed = current['boottime'] - previous['boottime']
        if (current['boot_id'] != previous['boot_id'] or not 0 < elapsed <= 60
                or abs(boot_elapsed - elapsed) > 1):
            return watts
        for key, zone in current['zones'].items():
            old = previous['zones'].get(key)
            if not old or old['name'] != zone['name'] or old['range_uj'] != zone['range_uj']:
                continue
            delta = zone['energy_uj'] - old['energy_uj']
            if delta < 0:
                if old['energy_uj'] < zone['range_uj'] * .9 or zone['energy_uj'] > zone['range_uj'] * .1:
                    continue
                delta += zone['range_uj']
            value = delta / 1_000_000 / elapsed
            if math.isfinite(value) and value >= 0:
                watts[key] = value
    except (KeyError, TypeError, ValueError):
        return {}
    return watts


def publish(path, data):
    temporary = None
    try:
        with tempfile.NamedTemporaryFile(mode='w', dir=path.parent, delete=False) as stream:
            temporary = Path(stream.name)
            json.dump(data, stream, allow_nan=False)
            stream.write('\n')
            os.fchmod(stream.fileno(), 0o644)
        os.replace(temporary, path)
    finally:
        if temporary:
            temporary.unlink(missing_ok=True)


def main():
    CACHE.mkdir(parents=True, exist_ok=True)
    previous_path = CACHE / 'rapl-state.json'
    try:
        previous = json.loads(previous_path.read_text())
    except (OSError, ValueError):
        previous = {}
    current = {'zones': zones(), 'boot_id': Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
               'monotonic': time.monotonic(), 'boottime': time.clock_gettime(time.CLOCK_BOOTTIME)}
    watts = derive(current, previous)
    def total(prefix):
        keys = [k for k, z in current['zones'].items() if z['name'].startswith(prefix)]
        return sum(watts[k] for k in keys) if keys and all(k in watts for k in keys) else None
    sample = {'timestamp': dt.datetime.now(dt.timezone.utc).isoformat(),
              'cpu_package_w': total('package-'), 'platform_psys_w': total('psys'),
              'window_seconds': current['monotonic'] - previous['monotonic'] if watts else None,
              'source': 'intel-rapl', 'status': 'ok' if watts else 'warming_up' if current['zones'] else 'unavailable'}
    publish(previous_path, current)
    publish(CACHE / 'power.json', sample)


if __name__ == '__main__':
    main()
