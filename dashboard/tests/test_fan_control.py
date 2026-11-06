import importlib.machinery
import importlib.util
from pathlib import Path
import struct
import sys
import unittest
from unittest.mock import mock_open, patch

loader = importlib.machinery.SourceFileLoader('fan_control', str(Path(__file__).resolve().parents[2] / 'motobook-fan-control'))
spec = importlib.util.spec_from_loader(loader.name, loader)
control = importlib.util.module_from_spec(spec)
loader.exec_module(control)
REFERENCE = '{' + ', '.join(hex(v) for v in struct.pack('<IIII', 1, 1, 5400, 1500)) + '}'


class FanControlTests(unittest.TestCase):
    def test_only_max_and_auto_payloads(self):
        for mode, rpm in [('max', 5400), ('auto', 0), ('manual', 3500)]:
            with self.subTest(mode=mode), patch.object(sys, 'argv', ['control', mode] + ([str(rpm)] if mode == 'manual' else [])), \
                    patch.object(control.os, 'geteuid', return_value=0), \
                    patch.object(Path, 'read_text', side_effect=['MOTOROLA', '83NY', 'SFCN07WW']), \
                    patch.object(control.subprocess, 'run'), patch.object(control.fcntl, 'flock'), \
                    patch('builtins.open', mock_open()), \
                    patch.object(control, 'query', side_effect=[REFERENCE, '0x0']) as query, \
                    patch.object(control, 'publish_state'), patch('builtins.print'):
                control.main()
                self.assertEqual(query.call_args_list[-1].args[0],
                                 r'\_SB.GZFD.WMAE 0 18 b' + struct.pack('<II', 0x04030001, rpm).hex())

    def test_unexpected_reference_prevents_write(self):
        with patch.object(sys, 'argv', ['control', 'max']), patch.object(control.os, 'geteuid', return_value=0), \
                patch.object(Path, 'read_text', side_effect=['MOTOROLA', '83NY', 'SFCN07WW']), \
                patch.object(control.subprocess, 'run'), patch.object(control.fcntl, 'flock'), \
                patch('builtins.open', mock_open()), patch.object(control, 'query', return_value='{0x00}') as query:
            with self.assertRaises(RuntimeError): control.main()
            query.assert_called_once_with(r'\_SB.GZFD.WQC3 0')
