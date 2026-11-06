#!/usr/bin/env python3
"""Dependency-free local dashboard: python3 dashboard/server.py."""
import argparse
import csv
import io
import json
import ipaddress
import secrets
import socket
from http import HTTPStatus
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import parse_qs, urlsplit

from telemetry import TelemetryStore

STATIC = Path(__file__).resolve().parent / 'static'
ASSETS = {
    '/': ('index.html', 'text/html; charset=utf-8'),
    '/index.html': ('index.html', 'text/html; charset=utf-8'),
    '/app.js': ('app.js', 'text/javascript; charset=utf-8'),
    '/styles.css': ('styles.css', 'text/css; charset=utf-8'),
}
EXPORT_FIELDS = ['timestamp', 'battery_name', 'state', 'ac_online', 'capacity_pct',
                 'power_w', 'energy_wh', 'full_wh', 'design_wh', 'health_pct',
                 'voltage_v', 'current_a', 'cycle_count', 'runtime_seconds',
                 'cpu_pct', 'cpu_temp_c', 'hottest_temp_c', 'hottest_sensor',
                 'fan_rpm', 'fan_status', 'memory_pct', 'brightness_pct',
                 'cpu_package_w', 'platform_psys_w', 'power_window_seconds']


def fan_request(request):
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as connection:
        connection.settimeout(12)
        connection.connect('/run/power-a2z-fan-control.sock')
        connection.sendall(json.dumps(request).encode() + b'\n')
        with connection.makefile('rb') as stream:
            line = stream.readline(8193)
        if len(line) > 8192:
            raise OSError('Invalid fan-control response')
        result = json.loads(line)
        if 'error' in result:
            raise OSError(result['error'])
        return result


def make_handler(store, fan_client=None):
    fan_client = fan_client or fan_request
    csrf_token = secrets.token_urlsafe(32)
    class Handler(BaseHTTPRequestHandler):
        def send(self, data, content_type, status=HTTPStatus.OK, attachment=None):
            self.send_response(status)
            self.send_header('Content-Type', content_type)
            self.send_header('Content-Length', str(len(data)))
            self.send_header('Cache-Control', 'no-store')
            self.send_header('X-Content-Type-Options', 'nosniff')
            self.send_header('Content-Security-Policy', "default-src 'self'; script-src 'self'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; connect-src 'self'; frame-ancestors 'none'")
            if attachment:
                self.send_header('Content-Disposition', f'attachment; filename="{attachment}"')
            self.end_headers()
            self.wfile.write(data)


        def local_fan_request(self):
            host = self.headers.get('Host', '')
            try:
                hostname = urlsplit('http://' + host).hostname
                return (ipaddress.ip_address(self.client_address[0]).is_loopback and
                        hostname in ('127.0.0.1', 'localhost', '::1', 'powera2z.system'))
            except ValueError:
                return False

        def do_POST(self):
            if urlsplit(self.path).path != '/api/fan-control':
                self.send(b'Not found', 'text/plain', HTTPStatus.NOT_FOUND)
                return
            host = self.headers.get('Host', '')
            if (not self.local_fan_request() or self.headers.get('Origin') not in ('http://' + host, 'https://' + host)
                    or not secrets.compare_digest(self.headers.get('X-CSRF-Token', ''), csrf_token)):
                self.send(b'{"error":"Invalid request origin or token; reload the dashboard"}', 'application/json', HTTPStatus.FORBIDDEN)
                return
            try:
                size = int(self.headers.get('Content-Length', '0'))
                if not 0 < size <= 1024 or self.headers.get_content_type() != 'application/json':
                    raise ValueError('Expected a small JSON request')
                request = json.loads(self.rfile.read(size))
                if not isinstance(request, dict):
                    raise ValueError('Expected an object')
                mode = request.get('mode')
                if mode == 'auto' and set(request) == {'mode'}:
                    command = {'action': 'set', 'mode': 'auto'}
                elif (mode == 'manual' and set(request) == {'mode', 'rpm'} and type(request['rpm']) is int
                      and 1500 <= request['rpm'] <= 5400 and request['rpm'] % 100 == 0):
                    command = {'action': 'set', **request}
                else:
                    raise ValueError('Choose auto or manual with 1500–5400 RPM in steps of 100')
                result = fan_client(command)
                self.send(json.dumps(result).encode(), 'application/json')
            except (ValueError, TypeError) as error:
                self.send(json.dumps({'error': str(error)}).encode(), 'application/json', HTTPStatus.BAD_REQUEST)
            except OSError as error:
                self.send(json.dumps({'error': str(error)}).encode(), 'application/json', HTTPStatus.SERVICE_UNAVAILABLE)

        def do_GET(self):
            url = urlsplit(self.path)
            if url.path == '/api/fan-control':
                if not self.local_fan_request():
                    self.send(b'{"error":"Local access only"}', 'application/json', HTTPStatus.FORBIDDEN)
                    return
                try:
                    result = fan_client({'action': 'status'})
                    result['csrf_token'] = csrf_token
                    self.send(json.dumps(result).encode(), 'application/json')
                except (OSError, ValueError) as error:
                    self.send(json.dumps({'error': str(error)}).encode(), 'application/json', HTTPStatus.SERVICE_UNAVAILABLE)
            elif url.path in ASSETS:
                filename, content_type = ASSETS[url.path]
                self.send((STATIC / filename).read_bytes(), content_type)
            elif url.path in ('/api/telemetry', '/api/export.csv'):
                params = parse_qs(url.query)
                try:
                    result = store.query(params.get('range', ['6h'])[0], params.get('date', ['latest'])[0])
                    if url.path == '/api/export.csv':
                        output = io.StringIO(newline='')
                        writer = csv.DictWriter(output, fieldnames=EXPORT_FIELDS, extrasaction='ignore')
                        writer.writeheader()
                        for sample in result['samples']:
                            # Avoid spreadsheet formulas in any collector-provided text.
                            row = {k: ("'" + v if isinstance(v, str) and v.startswith(('=', '+', '-', '@', '\t', '\r')) else v)
                                   for k, v in sample.items()}
                            writer.writerow(row)
                        self.send(output.getvalue().encode(), 'text/csv; charset=utf-8', attachment='power-a2z.csv')
                    else:
                        self.send(json.dumps(result, allow_nan=False, separators=(',', ':')).encode(), 'application/json')
                except ValueError as error:
                    self.send(json.dumps({'error': str(error)}).encode(), 'application/json', HTTPStatus.BAD_REQUEST)
            else:
                self.send(b'Not found', 'text/plain', HTTPStatus.NOT_FOUND)

        def log_message(self, format, *args):
            # Routine automatic polls do not need a log every ten seconds.
            if len(args) > 1 and str(args[1]) != '200':
                super().log_message(format, *args)

    return Handler


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--host', default='127.0.0.1')
    parser.add_argument('--port', type=int, default=8765)
    parser.add_argument('--data-dir', type=Path, default=STATIC.parent.parent / 'data')
    args = parser.parse_args()
    store = TelemetryStore(args.data_dir)
    server = ThreadingHTTPServer((args.host, args.port), make_handler(store))
    print(f'Power a2z dashboard: http://{args.host}:{server.server_port}', flush=True)
    print(f'Reading logs from {args.data_dir.resolve()}', flush=True)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()


if __name__ == '__main__':
    main()
