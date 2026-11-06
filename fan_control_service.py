#!/usr/bin/env python3
"""Restricted local fan-control broker, activated by its systemd Unix socket."""
import json
import datetime as dt
import os
from pathlib import Path
import socket
import struct
import subprocess

HELPER = '/usr/local/lib/power-a2z/motobook-fan-control'
STATE = Path('/run/power-a2z/fan-control.json')


def validate(request):
    if not isinstance(request, dict):
        raise ValueError('Expected an object')
    action = request.get('action')
    if action == 'status' and set(request) == {'action'}:
        return None
    if action != 'set' or request.get('mode') not in ('auto', 'manual'):
        raise ValueError('Choose auto or manual mode')
    mode = request['mode']
    if mode == 'auto' and set(request) == {'action', 'mode'}:
        return ['auto']
    rpm = request.get('rpm')
    if (mode != 'manual' or set(request) != {'action', 'mode', 'rpm'} or type(rpm) is not int
            or not 1500 <= rpm <= 5400 or rpm % 100):
        raise ValueError('Manual RPM must be 1500–5400 in steps of 100')
    return ['manual', str(rpm)]


def handle(request):
    args = validate(request)
    if args is not None:
        result = subprocess.run([HELPER, *args], capture_output=True, text=True, timeout=8)
        if result.returncode:
            raise RuntimeError(result.stderr.strip() or 'Firmware request failed')
    try:
        state = json.loads(STATE.read_text())
    except (OSError, ValueError):
        state = {'mode': 'unknown', 'rpm': None}
    measured = None
    try:
        reading = json.loads(Path('/run/power-a2z/fan.json').read_text())
        age = (dt.datetime.now(dt.timezone.utc) - dt.datetime.fromisoformat(reading['timestamp'])).total_seconds()
        if reading.get('status') == 'ok' and 0 <= age <= 30:
            measured = reading.get('rpm')
    except (OSError, ValueError, KeyError, TypeError):
        pass
    return {'state': state, 'measured_rpm': measured, 'min_rpm': 1500, 'max_rpm': 5400, 'step_rpm': 100}


def main():
    allowed_uid = int(os.environ['FAN_CONTROL_UID'])
    listener = socket.socket(fileno=3)
    while True:
        connection, _ = listener.accept()
        with connection:
            connection.settimeout(10)
            try:
                _, uid, _ = struct.unpack('3i', connection.getsockopt(socket.SOL_SOCKET, socket.SO_PEERCRED, 12))
                if uid != allowed_uid:
                    raise ValueError('Unauthorized local user')
                with connection.makefile('rb') as stream:
                    line = stream.readline(1025)
                if len(line) > 1024 or not line.endswith(b'\n'):
                    raise ValueError('Invalid request size')
                response = handle(json.loads(line))
            except (OSError, ValueError, TypeError, RuntimeError, subprocess.SubprocessError) as error:
                response = {'error': str(error)}
            try:
                connection.sendall(json.dumps(response, allow_nan=False).encode() + b'\n')
            except OSError:
                pass


if __name__ == '__main__':
    main()
