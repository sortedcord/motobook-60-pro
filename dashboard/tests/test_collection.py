import contextlib
import datetime as dt
import importlib.machinery
import importlib.util
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import mock_open, patch

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
import collect

loader = importlib.machinery.SourceFileLoader('fan_helper', str(ROOT / 'motobook-fan-speed'))
spec = importlib.util.spec_from_loader(loader.name, loader)
fan_helper = importlib.util.module_from_spec(spec)
loader.exec_module(fan_helper)


class CollectionTests(unittest.TestCase):
    def test_firmware_getter_decodes_rpm_and_uses_only_the_get_request(self):
        with patch.object(fan_helper.os, 'geteuid', return_value=0), \
                patch.object(fan_helper.subprocess, 'run') as command, \
                patch.object(fan_helper.fcntl, 'flock'), \
                patch('builtins.open', mock_open()), \
                patch.object(Path, 'read_text', side_effect=['MOTOROLA', '83NY', '{0x39, 0x08, 0x00, 0x00}\x00']), \
                patch.object(Path, 'write_text') as query:
            self.assertEqual(fan_helper.read_rpm(), 2105)
            query.assert_called_once_with(r'\_SB.GZFD.WMAE 0 17 b01000304')
            command.assert_called_once_with(['/usr/bin/modprobe', 'acpi_call'], check=True, timeout=4)

    def test_firmware_getter_rejects_other_models_and_bad_responses(self):
        with patch.object(fan_helper.os, 'geteuid', return_value=0), \
                patch.object(fan_helper.subprocess, 'run') as command, \
                patch.object(Path, 'read_text', side_effect=['OTHER', '83NY']):
            with self.assertRaises(RuntimeError):
                fan_helper.read_rpm()
            command.assert_not_called()
        for response in ['Error: AE_NOT_FOUND', '{0x01}', '{0xff, 0xff, 0xff, 0xff}']:
            with self.subTest(response=response), patch.object(fan_helper.os, 'geteuid', return_value=0), \
                    patch.object(fan_helper.subprocess, 'run'), patch.object(fan_helper.fcntl, 'flock'), \
                    patch('builtins.open', mock_open()), \
                    patch.object(Path, 'read_text', side_effect=['MOTOROLA', '83NY', response]), \
                    patch.object(Path, 'write_text'):
                with self.assertRaises(RuntimeError):
                    fan_helper.read_rpm()

    def test_hwmon_and_zones_with_metadata(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            device = root / 'hwmon' / 'hwmon0'
            device.mkdir(parents=True)
            for key, value in {'name': 'coretemp', 'temp1_input': '45000', 'temp1_label': 'Package id 0',
                               'temp1_max': '100000', 'temp1_crit_alarm': '0',
                               'fan1_input': '0', 'fan1_label': 'CPU fan', 'fan1_fault': '0'}.items():
                (device / key).write_text(value)
            zone = root / 'thermal' / 'thermal_zone0'
            zone.mkdir(parents=True)
            (zone / 'type').write_text('acpitz')
            (zone / 'temp').write_text('27800')
            sample = collect.collect_thermals(dt.datetime.now(dt.timezone.utc), root / 'hwmon', root / 'thermal', root / 'missing')
            self.assertEqual(sample['fans_hwmon'][0]['value'], '0')
            self.assertEqual(sample['fans_hwmon'][0]['label'], 'CPU fan')
            self.assertEqual(sample['temperatures_hwmon'][0]['name'], 'coretemp')
            self.assertEqual(sample['temperatures_hwmon'][0]['max'], '100000')
            self.assertEqual(sample['thermal_zones'][0]['type'], 'acpitz')
            self.assertEqual(sample['fan_firmware']['status'], 'unavailable')

    def test_cache_freshness_failures_and_validation(self):
        now = dt.datetime.now(dt.timezone.utc)
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory) / 'fan.json'
            self.assertIsNone(collect.firmware_fan(now, cache)['rpm'])
            for age, rpm, status, expected in [(0, 0, 'ok', 'ok'), (30, 2105, 'ok', 'ok'),
                    (31, 2105, 'ok', 'stale'), (-1, 2105, 'ok', 'stale'),
                    (0, 2105, 'error', 'error'), (0, -1, 'ok', 'unavailable'),
                    (0, 'NaN', 'ok', 'unavailable'), (0, True, 'ok', 'unavailable')]:
                with self.subTest(age=age, rpm=rpm, status=status):
                    cache.write_text(json.dumps({'timestamp': (now - dt.timedelta(seconds=age)).isoformat(),
                                                 'rpm': rpm, 'status': status}))
                    result = collect.firmware_fan(now, cache)
                    self.assertEqual(result['status'], expected)
                    self.assertEqual(result['rpm'], rpm if expected == 'ok' else None)
            for content in ['invalid', 'null', '[]', '{}', '{"timestamp": "bad"}']:
                cache.write_text(content)
                self.assertIsNone(collect.firmware_fan(now, cache)['rpm'])

    def test_helper_publishes_success_and_clears_previous_value_on_error(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory) / 'fan.json'
            with patch.object(sys, 'argv', ['motobook-fan-speed', '--output', str(cache)]), contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
                with patch.object(fan_helper, 'read_rpm', return_value=2105):
                    self.assertEqual(fan_helper.main(), 0)
                    self.assertEqual(json.loads(cache.read_text())['rpm'], 2105)
                    self.assertEqual(cache.stat().st_mode & 0o777, 0o644)
                with patch.object(fan_helper, 'read_rpm', side_effect=RuntimeError('query failed')):
                    self.assertEqual(fan_helper.main(), 1)
                    sample = json.loads(cache.read_text())
                    self.assertIsNone(sample['rpm'])
                    self.assertEqual(sample['status'], 'error')
            self.assertEqual(list(Path(directory).iterdir()), [cache])


if __name__ == '__main__':
    unittest.main()
