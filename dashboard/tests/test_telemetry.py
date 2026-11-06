import csv
import datetime as dt
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from telemetry import TelemetryStore, battery_sessions, normalize, summarize
from server import make_handler


def record(seconds=0, **battery_changes):
    battery = {'path': '/sys/class/power_supply/BAT0', 'type': 'Battery',
               'status': 'Discharging', 'capacity': '80', 'power_now': '10000000',
               'energy_now': '40000000', 'energy_full': '50000000',
               'energy_full_design': '60000000', 'voltage_now': '12000000'}
    battery.update(battery_changes)
    return {'timestamp': (dt.datetime(2026, 11, 5, tzinfo=dt.timezone.utc) + dt.timedelta(seconds=seconds)).isoformat(),
            'interval_seconds': 10, 'power_supplies': [battery],
            'cpu_stat': f'cpu {100 + seconds} 0 0 {800 + seconds} 0 0 0 0 999 999',
            'temperatures_hwmon': [{'label': 'Package id 0', 'value': '45000'}]}


class NormalizationTests(unittest.TestCase):
    def test_all_thermal_sensors_limits_faults_and_fans(self):
        raw = record()
        raw['temperatures_hwmon'] += [
            {'name': 'nvme', 'label': 'Composite', 'value': '85000', 'max': '80000', 'crit': '90000'},
            {'name': 'nvme', 'label': 'Sensor 1', 'value': '42000', 'max': '65261850'},
            {'name': 'broken', 'label': 'CPU', 'value': '200000', 'fault': '1'},
            {'label': 'SSD', 'value': '90000', 'crit': '90000'},
        ]
        raw['thermal_zones'] = [{'type': 'acpitz', 'value': '27800'}, {'type': 'missing', 'value': None}]
        raw['fans_hwmon'] = [{'label': 'Chassis', 'value': '2200'}, {'value': '-1'}, {'value': '3000', 'fault': '1'}]
        sample, _ = normalize(raw)
        self.assertEqual(sample['cpu_temp_c'], 45)
        self.assertEqual(sample['hottest_temp_c'], 90)
        self.assertEqual(sample['fan_rpm'], 2200)
        self.assertEqual(sample['temperatures'][1]['status'], 'warning')
        self.assertIsNone(sample['temperatures'][2]['max_c'])
        self.assertIsNone(sample['temperatures'][3]['temp_c'])
        self.assertEqual(sample['temperatures'][4]['status'], 'critical')
        self.assertEqual(sample['temperatures'][5]['temp_c'], 27.8)
        self.assertEqual(sample['temperatures'][6]['status'], 'unavailable')
        self.assertIsNone(sample['fans'][1]['rpm'])
        self.assertIsNone(sample['fans'][2]['rpm'])

    def test_firmware_fan_zero_stale_failed_and_invalid(self):
        raw = record()
        raw['fan_firmware'] = {'timestamp': raw['timestamp'], 'status': 'ok', 'rpm': 0}
        sample, _ = normalize(raw)
        self.assertEqual(sample['fan_rpm'], 0)
        self.assertEqual(sample['fan_status'], 'ok')
        raw['fan_firmware']['timestamp'] = record(-31)['timestamp']
        sample, _ = normalize(raw)
        self.assertIsNone(sample['fan_rpm'])
        self.assertEqual(sample['fan_status'], 'stale')
        for status, rpm in [('error', 2000), ('unavailable', None), ('ok', 'NaN'), ('ok', -1), ('ok', True)]:
            with self.subTest(status=status, rpm=rpm):
                raw['fan_firmware'] = {'timestamp': raw['timestamp'], 'status': status, 'rpm': rpm}
                self.assertIsNone(normalize(raw)[0]['fan_rpm'])

    def test_firmware_sample_published_during_snapshot_collection(self):
        raw = record()
        published = (dt.datetime.fromisoformat(raw['timestamp']) + dt.timedelta(milliseconds=30)).isoformat()
        observed = (dt.datetime.fromisoformat(raw['timestamp']) + dt.timedelta(milliseconds=50)).isoformat()
        raw['fan_firmware'] = {'timestamp': published, 'observed_at': observed, 'status': 'ok', 'rpm': 2103}
        sample, _ = normalize(raw)
        self.assertEqual(sample['fan_rpm'], 2103)
        self.assertEqual(sample['fan_status'], 'ok')
        raw['fan_firmware']['observed_at'] = raw['timestamp']
        self.assertEqual(normalize(raw)[0]['fan_status'], 'stale')
        raw['fan_firmware']['observed_at'] = record(31)['timestamp']
        self.assertEqual(normalize(raw)[0]['fan_status'], 'error')

    def test_units_and_cpu_deltas(self):
        first, counters = normalize(record())
        second, _ = normalize(record(10), counters)
        self.assertEqual(first['power_w'], 10)
        self.assertEqual(first['energy_wh'], 40)
        self.assertEqual(first['voltage_v'], 12)
        self.assertAlmostEqual(first['health_pct'], 50 / 60 * 100)
        self.assertEqual(first['runtime_seconds'], 4 * 3600)
        self.assertEqual(second['cpu_pct'], 50)
        self.assertEqual(second['cpu_temp_c'], 45)

    def test_charge_based_battery_and_charging_estimate(self):
        raw = record(status='Charging')
        battery = raw['power_supplies'][0]
        for key in ('energy_now', 'energy_full', 'energy_full_design', 'power_now', 'capacity'):
            del battery[key]
        battery.update(charge_now='2000000', charge_full='4000000',
                       charge_full_design='5000000', voltage_min_design='10000000', current_now='1000000')
        sample, _ = normalize(raw)
        self.assertEqual(sample['energy_wh'], 20)
        self.assertEqual(sample['capacity_pct'], 50)
        self.assertEqual(sample['power_w'], 12)
        self.assertEqual(sample['runtime_seconds'], 20 / 12 * 3600)

    def test_missing_battery_sensors_and_nonfinite_values(self):
        sample, _ = normalize({'timestamp': record()['timestamp'], 'temperatures_hwmon': [{'label': 'SSD', 'value': '80000'}]})
        self.assertIsNone(sample['capacity_pct'])
        self.assertIsNone(sample['cpu_temp_c'])
        self.assertIsNone(sample['runtime_seconds'])
        sample, _ = normalize(record(power_now='NaN', capacity='Infinity', status='Full'))
        self.assertIsNone(sample['power_w'])
        self.assertEqual(sample['capacity_pct'], 80)  # Derived from energy.
        self.assertIsNone(sample['runtime_seconds'])

    def test_peripheral_battery_is_not_system_battery(self):
        raw = record()
        raw['power_supplies'].insert(0, {'type': 'Battery', 'scope': 'Device', 'capacity': '5'})
        sample, _ = normalize(raw)
        self.assertEqual(sample['battery_count'], 1)
        self.assertEqual(sample['capacity_pct'], 80)

    def test_gap_and_state_transitions_are_excluded_from_energy(self):
        samples = [normalize(record(s, status='Charging' if s >= 1010 else 'Discharging'))[0]
                   for s in (0, 10, 1000, 1010, 1020)]
        summary = summarize(samples)
        self.assertAlmostEqual(summary['energy_used_wh'], 10 * 10 / 3600)
        self.assertEqual(summary['observed_seconds'], 30)
        self.assertEqual(summary['average_power_w'], 10)


class SessionTests(unittest.TestCase):
    def sample(self, seconds, state, capacity, on=True):
        raw = record(seconds, status=state, capacity=str(capacity))
        raw['display'] = {'brightness_devices': [{'actual_brightness': '50', 'max_brightness': '100', 'bl_power': '0' if on else '4'}]}
        return normalize(raw)[0]

    def test_discharge_charge_and_full_boundaries(self):
        samples = [self.sample(0, 'Full', 95), self.sample(10, 'Discharging', 95),
                   self.sample(20, 'Discharging', 18), self.sample(30, 'Charging', 18),
                   self.sample(40, 'Charging', 100), self.sample(50, 'Full', 100)]
        charging, discharging = battery_sessions(samples)
        self.assertEqual((discharging['start_pct'], discharging['end_pct']), (95, 18))
        self.assertEqual((charging['start_pct'], charging['end_pct']), (18, 100))
        self.assertEqual(discharging['screen_on_seconds'], 10)
        self.assertEqual(charging['average_power_w'], 10)
        self.assertTrue(charging['complete'])
        self.assertTrue(discharging['complete'])

    def test_gaps_and_missing_screen_are_not_inferred(self):
        samples = [self.sample(0, 'Discharging', 95), self.sample(10, 'Discharging', 94),
                   self.sample(1000, 'Discharging', 80)]
        samples[0]['screen_on_estimate'] = None
        [ongoing] = battery_sessions(samples)
        self.assertIsNone(ongoing['screen_on_seconds'])
        self.assertTrue(ongoing['has_gaps'])
        self.assertEqual(ongoing['end_reason'], 'ongoing')
        self.assertEqual(ongoing['observed_seconds'], 10)
        self.assertAlmostEqual(ongoing['energy_wh'], 10 * 10 / 3600)

    def test_plug_in_ends_discharge_even_if_status_is_delayed(self):
        samples = [self.sample(0, 'Full', 100), self.sample(10, 'Discharging', 100),
                   self.sample(1000, 'Discharging', 16), self.sample(1010, 'Discharging', 16),
                   self.sample(1020, 'Charging', 17), self.sample(1030, 'Full', 100)]
        for sample in samples[:3]: sample['ac_online'] = False
        for sample in samples[3:]: sample['ac_online'] = True
        charging, discharge = battery_sessions(samples)
        self.assertEqual(discharge['start_pct'], 100)
        self.assertEqual(discharge['end_pct'], 16)
        self.assertEqual(discharge['end_time'], samples[3]['time'])
        self.assertTrue(discharge['has_gaps'])
        self.assertEqual(charging['start_time'], samples[3]['time'])
        self.assertEqual(charging['start_pct'], 16)


class StoreTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.path = Path(self.temp.name) / '2026-11-05.jsonl'
        self.store = TelemetryStore(self.temp.name)

    def tearDown(self):
        self.temp.cleanup()

    def append(self, raw):
        with self.path.open('a') as stream:
            stream.write(json.dumps(raw) + '\n')

    def test_partial_record_append_bad_line_and_rotation(self):
        self.append(record())
        pending = json.dumps(record(10))
        with self.path.open('a') as stream:
            stream.write('not json\n' + pending[:20])
        result = self.store.query()
        self.assertEqual(result['summary']['count'], 1)
        self.assertEqual(result['skipped_records'], 1)
        with self.path.open('a') as stream:
            stream.write(pending[20:] + '\n')
        result = self.store.query()
        self.assertEqual(result['summary']['count'], 2)
        self.assertEqual(result['latest']['cpu_pct'], 50)
        self.path.write_text(json.dumps(record(20)) + '\n')
        self.assertEqual(self.store.query()['summary']['count'], 1)
        self.path.unlink()
        self.assertIsNone(self.store.query()['latest'])

    def test_ranges_dates_and_events(self):
        for s in (0, 10, 7200):
            self.append(record(s, status='Charging' if s else 'Discharging'))
        self.assertEqual(self.store.query('1h')['summary']['count'], 1)
        self.assertEqual(self.store.query('all')['summary']['count'], 3)
        self.assertEqual(len(self.store.query('all')['events']), 1)
        self.assertEqual(self.store.query(day='2026-11-04')['samples'], [])
        with self.assertRaises(ValueError):
            self.store.query('invalid')
        with self.assertRaises(ValueError):
            self.store.query(day='../data')

    def test_http_api_export_and_raw_files_not_served(self):
        raw = record(model_name='=example')
        raw['fans_hwmon'] = [{'label': 'CPU fan', 'value': '2105'}]
        raw['rapl_power'] = {'status': 'ok', 'timestamp': raw['timestamp'], 'window_seconds': 10,
                             'cpu_package_w': 12.5, 'platform_psys_w': 22.5}
        self.append(raw)
        # Exercise the real HTTP parser/handler using byte streams. No listening
        # socket is required, so this also runs in restricted build environments.
        class Connection:
            def __init__(self, path):
                self.input = io.BytesIO(f'GET {path} HTTP/1.0\r\nHost: localhost\r\n\r\n'.encode())
                self.output = io.BytesIO()

            def makefile(self, *args):
                return self.input

            def sendall(self, data):
                self.output.write(data)

        def request(path):
            connection = Connection(path)
            make_handler(self.store)(connection, ('127.0.0.1', 12345), None)
            headers, _, body = connection.output.getvalue().partition(b'\r\n\r\n')
            status = int(headers.split(b' ', 2)[1])
            return status, headers, body

        status, headers, body = request('/')
        self.assertEqual(status, 200)
        self.assertIn(b'Energy overview', body)
        self.assertIn(b'Content-Security-Policy:', headers)
        for asset in ('/app.js', '/styles.css'):
            self.assertEqual(request(asset)[0], 200)
        status, _, body = request('/api/telemetry?range=all')
        self.assertEqual(status, 200)
        self.assertEqual(json.loads(body)['latest']['power_w'], 10)
        self.assertEqual(json.loads(body)['latest']['fan_rpm'], 2105)
        self.assertEqual(json.loads(body)['latest']['cpu_package_w'], 12.5)
        self.assertEqual(json.loads(body)['latest']['platform_psys_w'], 22.5)
        self.assertEqual(json.loads(body)['latest']['temperatures'][0]['temp_c'], 45)
        self.assertNotIn(b'processes', body)
        self.assertNotIn(b'serial_number', body)
        status, headers, body = request('/api/export.csv')
        self.assertEqual(status, 200)
        self.assertIn(b'attachment;', headers)
        rows = list(csv.DictReader(io.StringIO(body.decode())))
        self.assertEqual(rows[0]['power_w'], '10.0')
        self.assertEqual(rows[0]['fan_rpm'], '2105.0')
        self.assertEqual(rows[0]['hottest_temp_c'], '45.0')
        self.assertEqual(rows[0]['cpu_package_w'], '12.5')
        self.assertEqual(rows[0]['platform_psys_w'], '22.5')
        for path, expected in [('/data/2026-11-05.jsonl', 404), ('/../telemetry.py', 404), ('/api/telemetry?range=bad', 400)]:
            self.assertEqual(request(path)[0], expected)


if __name__ == '__main__':
    unittest.main()
