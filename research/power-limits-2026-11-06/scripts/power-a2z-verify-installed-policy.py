import json,subprocess,time
from pathlib import Path
OUT=Path('/home/sortedcord/Projects/system/power_a2z/research/power-limits-2026-11-06')
peak=Path('/sys/class/powercap/intel-rapl:0/constraint_2_power_limit_uw')
def cmd(*args):subprocess.run(args,check=True,stdout=subprocess.DEVNULL)
def get():return int(peak.read_text())
checks={};original=subprocess.check_output(['powerprofilesctl','get'],text=True).strip()
try:
 cmd('powerprofilesctl','set','balanced');time.sleep(3);checks['balanced_pl4_w']=get()/1e6;assert get()<=61000000
 cmd('powerprofilesctl','set','performance');time.sleep(3);checks['performance_pl4_w']=get()/1e6;assert get()==100000000
 cmd('systemctl','stop','power-a2z-performance');checks['service_stop_pl4_w']=get()/1e6;assert get()<=61000000
 cmd('systemctl','start','power-a2z-performance');time.sleep(3);assert get()==100000000
 previous_fan=json.loads(Path('/run/power-a2z/fan-control.json').read_text())['mode']
 before_boost={str(f):int(f.read_text()) for z in ('intel-rapl:0','intel-rapl-mmio:0','intel-rapl:1') for f in (Path('/sys/class/powercap')/z).glob('constraint_*_power_limit_uw')}
 # Exercise the installed boost helper and its interruption/rollback path with real load.
 booster=subprocess.Popen(['/usr/local/sbin/motobook-power-control','boost','--seconds','15'],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
 try:
  for line in booster.stdout:
   print(line.strip(),flush=True)
   if 'Boost ready' in line:
    time.sleep(1)
    break
  assert booster.poll() is None,'Booster exited unexpectedly before test completion'
 finally:
  if booster.poll() is None:booster.terminate()
  remainder=booster.communicate(timeout=15)[0];print(remainder,flush=True)
 checks['boost_exit_code']=booster.returncode;assert booster.returncode==0
 time.sleep(3)
 checks['after_boost_pl4_w']=get()/1e6;assert get()==100000000
 checks['fan_after_boost']=json.loads(Path('/run/power-a2z/fan-control.json').read_text())['mode'];assert checks['fan_after_boost']==previous_fan
 checks['thermald_active']=subprocess.check_output(['systemctl','is-active','thermald'],text=True).strip();assert checks['thermald_active']=='active'
 checks['limits_before_boost']=before_boost
 checks['limits_after_boost']={name:int(Path(name).read_text()) for name in before_boost}
 for name,value in checks['limits_after_boost'].items():
  if name.endswith('intel-rapl-mmio:0/constraint_0_power_limit_uw'):
   assert 0 < value <= 55000000,'MMIO PL1 retained an experimental budget'
  else:assert value==before_boost[name],(name,value,before_boost[name])
 checks['mmio_pl1_dynamic']=True
 checks['nonexperimental_limits_verified']=True
 checks['status']='passed; MMIO PL1 remains managed by adaptive thermald'
finally:
 cmd('powerprofilesctl','set',original)
 (OUT/'installed-policy-checks.json').write_text(json.dumps(checks,indent=2))
 print(json.dumps(checks,indent=2),flush=True)
