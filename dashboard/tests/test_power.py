import datetime as dt
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from power_sampler import derive, zones
from collect import sampled_power
from telemetry import normalize


class PowerTests(unittest.TestCase):
    def state(self, energy, tick=10):
        return {'boot_id': 'boot', 'monotonic': tick, 'boottime': tick,
                'zones': {'intel-rapl:0': {'name': 'package-0', 'energy_uj': energy, 'range_uj': 1000000000}}}

    def test_energy_delta_and_real_zero(self):
        self.assertEqual(derive(self.state(110000000, 20), self.state(10000000)), {'intel-rapl:0': 10})
        self.assertEqual(derive(self.state(10000000, 20), self.state(10000000)), {'intel-rapl:0': 0})
        self.assertEqual(derive(self.state(10000000), {}), {})

    def test_rollover_and_reset(self):
        self.assertEqual(derive(self.state(10000000, 20), self.state(990000000)), {'intel-rapl:0': 2})
        self.assertEqual(derive(self.state(10000000, 20), self.state(500000000)), {})

    def test_suspend_reboot_long_gap_and_replacement(self):
        previous = self.state(10000000)
        for key, value in [('boot_id', 'new'), ('boottime', 100), ('monotonic', 100)]:
            current = self.state(20000000, 20)
            current[key] = value
            self.assertEqual(derive(current, previous), {})
        current = self.state(20000000, 20)
        current['zones']['intel-rapl:0']['name'] = 'psys'
        self.assertEqual(derive(current, previous), {})

    def test_discovery_excludes_children_and_duplicate_mmio(self):
        with tempfile.TemporaryDirectory() as directory:
            for key, name in [('intel-rapl:0', 'package-0'), ('intel-rapl:1', 'psys'),
                              ('intel-rapl:0:0', 'core'), ('intel-rapl-mmio:0', 'package-0')]:
                p = Path(directory) / key
                p.mkdir()
                for file, value in [('name', name), ('energy_uj', '100'), ('max_energy_range_uj', '1000')]:
                    (p / file).write_text(value)
            self.assertEqual(set(zones(directory)), {'intel-rapl:0', 'intel-rapl:1'})

    def test_cache_and_dashboard_missing_stale_and_invalid(self):
        now = dt.datetime.now(dt.timezone.utc)
        sample = {'timestamp': now.isoformat(), 'window_seconds': 10, 'status': 'ok',
                  'cpu_package_w': 0, 'platform_psys_w': 25.5}
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory) / 'power.json'
            self.assertEqual(sampled_power(cache, now)['status'], 'unavailable')
            cache.write_text(json.dumps(sample))
            normalized, _ = normalize({'timestamp': now.isoformat(), 'rapl_power': sampled_power(cache, now)})
            self.assertEqual(normalized['cpu_package_w'], 0)
            self.assertEqual(normalized['platform_psys_w'], 25.5)
            self.assertEqual(sampled_power(cache, now + dt.timedelta(seconds=31))['status'], 'stale')
        for changes in [{'cpu_package_w': 'NaN'}, {'cpu_package_w': -1}, {'cpu_package_w': True},
                        {'status': 'warming_up'}, {'window_seconds': 100},
                        {'timestamp': (now - dt.timedelta(seconds=31)).isoformat()}]:
            bad = {**sample, **changes}
            normalized, _ = normalize({'timestamp': now.isoformat(), 'rapl_power': bad})
            self.assertIsNone(normalized['cpu_package_w'])
        normalized, _ = normalize({'timestamp': now.isoformat()})
        self.assertIsNone(normalized['platform_psys_w'])
