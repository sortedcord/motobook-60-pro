import subprocess
from pathlib import Path
ROOT='/home/sortedcord/Projects/system/power_a2z'
def run(*cmd):return subprocess.run(cmd,check=True)
def probe(name,secs=12):run('/usr/bin/python','/tmp/power-a2z-probe.py',name,'--seconds',str(secs))
try:
 run(ROOT+'/motobook-fan-control','max')
 probe('max-fan-original-policy',10)
 run('systemctl','stop','thermald')
 probe('thermald-stopped',15)
 run('systemd-run','--unit=power-a2z-thermald-test','--service-type=simple','/usr/bin/thermald','--no-daemon','--dbus-enable')
 probe('thermald-nonadaptive',15)
finally:
 subprocess.run(['systemctl','stop','power-a2z-thermald-test'])
 subprocess.run(['systemctl','start','thermald'])
 subprocess.run([ROOT+'/motobook-fan-control','auto'])
 print('Original thermal daemon and automatic fan restored.',flush=True)
