import io
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
sys.path.insert(0, str(Path(__file__).resolve().parents[2]))
from server import make_handler
from telemetry import TelemetryStore
from fan_control_service import validate, handle


class BrokerTests(unittest.TestCase):
    def test_range_type_and_extra_argument_rejection(self):
        self.assertEqual(validate({'action': 'set', 'mode': 'manual', 'rpm': 3500}), ['manual', '3500'])
        self.assertEqual(validate({'action': 'set', 'mode': 'auto'}), ['auto'])
        for rpm in [0, 1400, 5500, 3501, 3500.0, True, '3500', '3500;id', None]:
            with self.subTest(rpm=rpm), self.assertRaises(ValueError):
                validate({'action': 'set', 'mode': 'manual', 'rpm': rpm})
        with self.assertRaises(ValueError):
            validate({'action': 'set', 'mode': 'auto', 'rpm': 3500})

    def test_invalid_request_never_executes_helper(self):
        with patch('fan_control_service.subprocess.run') as run:
            with self.assertRaises(ValueError):
                handle({'action': 'set', 'mode': 'manual', 'rpm': 0})
            run.assert_not_called()


class FanAPITests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.calls = []
        def client(command):
            self.calls.append(command)
            return {'state': {'mode': 'manual', 'rpm': 3500}, 'measured_rpm': 3494}
        self.handler = make_handler(TelemetryStore(self.temp.name), fan_client=client)

    def tearDown(self):
        self.temp.cleanup()

    def request(self, method='GET', body=None, headers=None, address='127.0.0.1'):
        headers = {'Host': 'powera2z.system', **(headers or {})}
        content = b'' if body is None else json.dumps(body).encode()
        if method == 'POST':
            headers['Content-Length'] = str(len(content))
            headers.setdefault('Content-Type', 'application/json')
        request = f'{method} /api/fan-control HTTP/1.0\r\n' + ''.join(f'{k}: {v}\r\n' for k, v in headers.items()) + '\r\n'
        class Connection:
            def __init__(self):
                self.input = io.BytesIO(request.encode() + content)
                self.output = io.BytesIO()
            def makefile(self, *args): return self.input
            def sendall(self, data): self.output.write(data)
        connection = Connection()
        self.handler(connection, (address, 1234), None)
        head, _, payload = connection.output.getvalue().partition(b'\r\n\r\n')
        return int(head.split(b' ')[1]), json.loads(payload)

    def auth(self):
        _, data = self.request()
        return {'Origin': 'http://powera2z.system', 'X-CSRF-Token': data['csrf_token']}

    def test_status_token_and_valid_manual_auto(self):
        headers = self.auth()
        for body in [{'mode': 'manual', 'rpm': 3500}, {'mode': 'auto'}]:
            status, _ = self.request('POST', body, headers)
            self.assertEqual(status, 200)
            self.assertEqual(self.calls[-1], {'action': 'set', **body})

    def test_cross_origin_missing_token_rebinding_and_remote_rejected(self):
        headers = self.auth()
        self.calls.clear()
        for override in [{'Origin': 'http://evil.example'}, {'X-CSRF-Token': ''}, {'Host': 'evil.example'}]:
            self.assertEqual(self.request('POST', {'mode': 'auto'}, {**headers, **override})[0], 403)
        self.assertEqual(self.request(address='192.168.1.2')[0], 403)
        self.assertEqual(self.calls, [])

    def test_invalid_values_cannot_reach_broker(self):
        headers = self.auth()
        self.calls.clear()
        for body in [{'mode': 'manual', 'rpm': 0}, {'mode': 'manual', 'rpm': True},
                     {'mode': 'auto', 'rpm': 0}, [], {'mode': 'manual', 'rpm': '3500;id'}]:
            self.assertEqual(self.request('POST', body, headers)[0], 400)
        self.assertEqual(self.calls, [])
