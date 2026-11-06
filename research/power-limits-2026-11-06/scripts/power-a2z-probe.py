import argparse, datetime, json, os, signal, subprocess, time
from pathlib import Path
OUT=Path('/home/sortedcord/Projects/system/power_a2z/research/power-limits-2026-11-06')
p=argparse.ArgumentParser();p.add_argument('stage');p.add_argument('--seconds',type=int,default=15);p.add_argument('--fma',action='store_true');p.add_argument('--cutoff',type=int,default=92);a=p.parse_args()
if not 85<=a.cutoff<=98:raise SystemExit('Cutoff must be 85-98 C')
zones={n:Path('/sys/class/powercap')/n for n in ['intel-rapl:0','intel-rapl:1','intel-rapl-mmio:0']}
def limits():
 d={}
 for n,z in zones.items():
  d[n]={}
  for f in z.glob('constraint_*'):
   try:d[n][f.name]=f.read_text().strip()
   except OSError:pass
 return d
fds={c:os.open(f'/dev/cpu/{c}/msr',os.O_RDONLY) for c in [0,1,4,12]}
def msr(c,r):return int.from_bytes(os.pread(fds[c],8,r),'little')
def temps():
 return {str(f):int(f.read_text())/1000 for h in Path('/sys/class/hwmon').glob('hwmon*') if (h/'name').read_text().strip()=='coretemp' for f in h.glob('temp*_input')}
def powers():return {n:int((z/'energy_uj').read_text()) for n,z in zones.items() if (z/'energy_uj').exists()}
def stop(*_):raise KeyboardInterrupt
signal.signal(signal.SIGTERM,stop)
workers=[];rows=[];report={'stage':a.stage,'started':datetime.datetime.now().astimezone().isoformat(),'limits_before':limits(),'workload':'avx2-fma' if a.fma else 'matrix','rows':rows}
try:
 if max(temps().values())>=a.cutoff:raise RuntimeError('Temperature too high to start')
 if Path('/sys/class/power_supply/ADP1/online').read_text().strip()!='1':raise RuntimeError('AC disconnected')
 for c in sorted(os.sched_getaffinity(0)):
  cmd=['taskset','-c',str(c),'/tmp/power-a2z-fma-stress',str(a.seconds+2)] if a.fma else ['taskset','-c',str(c),'/tmp/power-a2z-cpu-stress']
  workers.append(subprocess.Popen(cmd,user=1000,group=1000,cwd='/tmp',stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL))
 last=powers();tick=start=time.monotonic()
 while time.monotonic()-start<a.seconds:
  time.sleep(.5);now=time.monotonic();energy=powers();temp=max(temps().values())
  watts={}
  for n,e in energy.items():
   delta=e-last[n]
   if delta<0:delta+=int((zones[n]/'max_energy_range_uj').read_text())
   watts[n]=round(delta/1e6/(now-tick),2)
  row={'seconds':round(now-start,2),'watts':watts,'max_cpu_c':temp,'flags':{str(c):{'perf':hex(msr(c,0x64f)),'therm':hex(msr(c,0x19c))} for c in fds},'battery_status':Path('/sys/class/power_supply/BAT0/status').read_text().strip(),'battery_power_w':int(Path('/sys/class/power_supply/BAT0/power_now').read_text())/1e6,'cpu0_max_khz':int(Path('/sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq').read_text())}
  rows.append(row)
  if len(rows)%2==0:print(json.dumps({'stage':a.stage,**row}),flush=True)
  if temp>=a.cutoff:raise RuntimeError(f'{a.cutoff} C temperature cutoff')
  if Path('/sys/class/power_supply/ADP1/online').read_text().strip()!='1':raise RuntimeError('AC disconnected')
  last,tick=energy,now
except (Exception,KeyboardInterrupt) as e:
 report['stopped_reason']=str(e);print('Stopped: '+str(e),flush=True)
finally:
 for w in workers:
  if w.poll() is None:w.terminate()
 for w in workers:
  try:w.wait(timeout=2)
  except subprocess.TimeoutExpired:w.kill();w.wait()
 report['limits_after']=limits();report['peak_half_second_w']=max([r['watts']['intel-rapl:0'] for r in rows],default=0)
 if rows:report['mean_w']=round(sum(r['watts']['intel-rapl:0'] for r in rows)/len(rows),2)
 for fd in fds.values():os.close(fd)
 dest=OUT/(a.stage+'.json');dest.write_text(json.dumps(report,indent=2));os.chown(dest,1000,1000)
 print(json.dumps({k:v for k,v in report.items() if k not in ['rows','limits_before','limits_after']}),flush=True)
