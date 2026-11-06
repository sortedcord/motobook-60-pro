#!/usr/bin/env python3
"""Track only whether keyboard/touchpad events occurred; never store event codes."""
import datetime as dt
import json
import os
from pathlib import Path
import selectors
import struct
import time

ROOT = Path(__file__).resolve().parent
STATE = ROOT / 'data' / 'input_activity.json'
EVENT = struct.Struct('@llHHi')


def classify(name):
    name = name.lower()
    if 'touchpad' in name or 'trackpad' in name:
        return 'touchpad'
    if 'keyboard' in name or 'kbd' in name:
        return 'keyboard'
    return None


def read_events(selector, devices, key, errors):
    """Remove disconnected devices so epoll cannot spin on their error state."""
    try:
        raw = os.read(key.fd, EVENT.size * 256)
        if raw:
            return raw
    except BlockingIOError:
        return b''
    except OSError as exc:
        errors[key.data[0]] = f'{type(exc).__name__}: {exc}'
    selector.unregister(key.fd)
    os.close(key.fd)
    devices.pop(key.data[2], None)
    return b''


def main():
    STATE.parent.mkdir(parents=True, exist_ok=True)
    selector = selectors.DefaultSelector()
    devices = {}
    last = {'keyboard': None, 'touchpad': None}
    errors = {'keyboard': None, 'touchpad': None}
    last_scan = 0.0
    last_write = 0.0

    while True:
        now = time.monotonic()
        if now - last_scan >= 2:
            last_scan = now
            for event in sorted(Path('/sys/class/input').glob('event*')):
                node = Path('/dev/input') / event.name
                name_path = event / 'device/name'
                try:
                    name = name_path.read_text().strip()
                except OSError:
                    continue
                kind = classify(name)
                if not kind or str(node) in devices or not node.exists():
                    continue
                try:
                    fd = os.open(node, os.O_RDONLY | os.O_NONBLOCK | os.O_CLOEXEC)
                    selector.register(fd, selectors.EVENT_READ, (kind, name, str(node)))
                    devices[str(node)] = fd
                    errors[kind] = None
                except OSError as exc:
                    errors[kind] = f'{type(exc).__name__}: {exc}'

        for key, _ in selector.select(timeout=0.25):
            kind, _name, _node = key.data
            raw = read_events(selector, devices, key, errors)
            usable = len(raw) - len(raw) % EVENT.size
            for offset in range(0, usable, EVENT.size):
                _sec, _usec, event_type, code, value = EVENT.unpack_from(raw, offset)
                # Keep only an activity timestamp. Never persist key/button codes or values.
                if (kind == 'keyboard' and event_type == 1 and code != 0 and value == 1) or \
                   (kind == 'touchpad' and event_type in (1, 3) and (event_type == 3 or value == 1)):
                    last[kind] = dt.datetime.now().astimezone().isoformat()

        if time.monotonic() - last_write >= 1:
            last_write = time.monotonic()
            state = {
                'updated_at': dt.datetime.now().astimezone().isoformat(),
                'devices': [{'type': kind, 'node': node, 'connected': Path(node).exists(), 'readable': True}
                            for node, fd in devices.items()
                            for kind, _name, _path in [selector.get_key(fd).data]],
                'last_activity': last,
                'errors': errors,
            }
            temp = STATE.with_suffix('.tmp')
            temp.write_text(json.dumps(state, separators=(',', ':')))
            temp.replace(STATE)


if __name__ == '__main__':
    main()
