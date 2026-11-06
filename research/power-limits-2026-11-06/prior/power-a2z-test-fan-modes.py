import datetime as dt
import json
from pathlib import Path
import re
import signal
import subprocess
import time

ROOT = Path('/home/sortedcord/Projects/system/power_a2z')
FAN = Path('/sys/bus/platform/devices/VPC2004:00/fan_mode')
PROFILE = Path('/sys/firmware/acpi/platform_profile')
original_fan = FAN.read_text().strip()
original_profile = PROFILE.read_text().strip()
results = []
def control(mode):
    subprocess.run([str(ROOT / 'motobook-fan-control'), mode], check=True, capture_output=True, text=True, timeout=10)
def measure():
    text = subprocess.check_output([str(ROOT / 'motobook-fan-speed')], text=True, timeout=8)
    rpm = int(re.search(r'CPU fan: ([\d,]+)', text)[1].replace(',', ''))
    temps = []
    for device in Path('/sys/class/hwmon').glob('hwmon*'):
        if (device / 'name').read_text().strip() == 'coretemp':
            temps.extend(float(p.read_text()) / 1000 for p in device.glob('temp*_input'))
    return {'rpm': rpm, 'cpu_c': max(temps) if temps else None,
            'fan_mode': FAN.read_text().strip(), 'profile': PROFILE.read_text().strip()}
def stage(label, seconds, fan=None, profile=None):
    if fan is not None:
        FAN.write_text(fan + '\n')
    if profile is not None:
        PROFILE.write_text(profile + '\n')
    result = {'label': label, 'samples': []}
    results.append(result)
    for i in range(seconds // 5):
        time.sleep(5)
        sample = measure()
        sample['seconds'] = (i + 1) * 5
        result['samples'].append(sample)
        print(json.dumps({'stage': label, **sample}), flush=True)
        if sample['cpu_c'] is not None and sample['cpu_c'] >= 90:
            raise RuntimeError('Temperature reached 90 C; ending test and restoring maximum cooling')
def interrupted(*args):
    raise KeyboardInterrupt
signal.signal(signal.SIGTERM, interrupted)
try:
    control('auto')
    stage('Automatic baseline', 25)
    stage('Fan mode 1: standard', 25, fan='1')
    stage('Fan mode 4: efficient', 25, fan='4')
    stage('Fan mode 0: silent', 20, fan='0')
    stage('Fan mode 2: dust cleaning', 15, fan='2')
    FAN.write_text(original_fan + '\n')
    stage('Profile low-power', 25, profile='low-power')
    stage('Profile balanced', 25, profile='balanced')
    stage('Profile performance', 25, profile='performance')
finally:
    try:
        PROFILE.write_text(original_profile + '\n')
        FAN.write_text(original_fan + '\n')
    finally:
        control('max')
        Path('/tmp/power-a2z-fan-mode-results.json').write_text(json.dumps(results, indent=2))
        print('Original fan mode and profile restored; maximum RPM target reapplied.', flush=True)
        stage('Restored maximum target', 20)
        Path('/tmp/power-a2z-fan-mode-results.json').write_text(json.dumps(results, indent=2))
