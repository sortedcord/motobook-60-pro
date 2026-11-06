import errno
import os
from pathlib import Path
import selectors
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))
from input_activity import read_events


class InputActivityTests(unittest.TestCase):
    def setUp(self):
        self.selector = selectors.DefaultSelector()
        self.reader, self.writer = os.pipe2(os.O_NONBLOCK | os.O_CLOEXEC)
        self.devices = {'/dev/input/test': self.reader}
        self.errors = {}
        self.key = self.selector.register(self.reader, selectors.EVENT_READ,
                                          ('keyboard', 'Test keyboard', '/dev/input/test'))

    def tearDown(self):
        self.selector.close()
        for fd in (self.reader, self.writer):
            try:
                os.close(fd)
            except OSError:
                pass

    def test_eof_unregisters_device_and_stops_repeated_wakeups(self):
        os.close(self.writer)
        self.writer = -1
        self.assertTrue(self.selector.select(0))
        self.assertEqual(read_events(self.selector, self.devices, self.key, self.errors), b'')
        self.assertEqual(self.devices, {})
        self.assertEqual(self.selector.select(0), [])
        with self.assertRaises(OSError):
            os.fstat(self.reader)

    def test_disconnected_device_error_removes_registration(self):
        with patch('input_activity.os.read', side_effect=OSError(errno.ENODEV, 'Device removed')):
            self.assertEqual(read_events(self.selector, self.devices, self.key, self.errors), b'')
        self.assertEqual(self.devices, {})
        self.assertEqual(len(self.selector.get_map()), 0)
        self.assertIn('Device removed', self.errors['keyboard'])

    def test_temporary_empty_read_keeps_device_registered(self):
        self.assertEqual(read_events(self.selector, self.devices, self.key, self.errors), b'')
        self.assertEqual(len(self.selector.get_map()), 1)
        self.assertIn('/dev/input/test', self.devices)
