import datetime as dt
import json
import os
from pathlib import Path
import subprocess
import time

workers=[]
readings=[]
limit=95
start=time.monotonic()
root=Path('/sys/class/powercap/intel-rapl:0')
# Read RAPL with the existing privileged sampler; the stress workers remain unprivileged.
def temperature():
    for p in Path('/sys/class/hwmon').glob('hwmon*'):
        try:
            if (p/'name').read_text().strip()=='coretemp':
                return max(float(f.read_text())/1000 for f in p.glob('temp*_input'))
        except OSError: pass
    raise RuntimeError('CPU temperature unavailable')
try:
    if temperature()>=limit:raise RuntimeError('CPU already at temperature cutoff')
    for _ in range(len(os.sched_getaffinity(0))):
        workers.append(subprocess.Popen(['/tmp/power-a2z-cpu-stress'],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL))
    print(f'STRESS RUNNING: {len(workers)} workers for 60 seconds.',flush=True)
    deadline=start+60
    while time.monotonic()<deadline:
        temp=temperature()
        power=json.loads(Path('/run/power-a2z/power.json').read_text())
        fan=json.loads(Path('/run/power-a2z/fan.json').read_text())
        row={'seconds':round(time.monotonic()-start,1),'cpu_c':temp,
             'cpu_package_w':power.get('cpu_package_w'),'platform_psys_w':power.get('platform_psys_w'),
             'power_timestamp':power.get('timestamp'),'fan_rpm':fan.get('rpm')}
        readings.append(row)
        print(json.dumps(row),flush=True)
        if temp>=limit:
            print('Temperature cutoff reached; stopping early.',flush=True)
            break
        time.sleep(min(2,max(0,deadline-time.monotonic())))
finally:
    for p in workers:
        if p.poll() is None:p.terminate()
    for p in workers:
        try:p.wait(timeout=2)
        except subprocess.TimeoutExpired:p.kill();p.wait()
    Path('/tmp/power-a2z-cpu-stress-results.json').write_text(json.dumps(readings,indent=2))
    print('STRESS STOPPED. All test workers exited.',flush=True)
