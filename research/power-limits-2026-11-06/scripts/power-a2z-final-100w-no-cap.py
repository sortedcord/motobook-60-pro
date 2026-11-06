import datetime,json,os,signal,subprocess,time
from pathlib import Path
ROOT=Path('/home/sortedcord/Projects/system/power_a2z');OUT=ROOT/'research/power-limits-2026-11-06';PC=Path('/sys/class/powercap');peak=PC/'intel-rapl:0/constraint_2_power_limit_uw'
import fcntl
lock=open('/run/lock/motobook-power-control.lock','a');fcntl.flock(lock,fcntl.LOCK_EX)
rows=[];workers=[];original={};report={'started':datetime.datetime.now().astimezone().isoformat(),'target_cpu_w':100,'external_cooler_ready_confirmed':True,'software_temperature_cutoff_c':None,'hardware_thermal_protection':'unchanged','rows':rows}
fd=os.open('/dev/cpu/0/msr',os.O_RDONLY)
def reg(r):return hex(int.from_bytes(os.pread(fd,8,r),'little'))
def temp():
 return max(int(f.read_text())/1000 for h in Path('/sys/class/hwmon').glob('hwmon*') if (h/'name').read_text().strip()=='coretemp' for f in h.glob('temp*_input'))
def ac():return Path('/sys/class/power_supply/ADP1/online').read_text().strip()=='1'
def check():
 if not ac():raise RuntimeError('AC disconnected')
 if int(Path('/sys/class/power_supply/BAT0/capacity').read_text())<50:raise RuntimeError('Battery below 50%')
def write(f,v):
 f.write_text(str(v))
 if int(f.read_text())!=v:raise RuntimeError(f'Power-limit readback mismatch: {f}')
def interrupt(*args):raise KeyboardInterrupt
signal.signal(signal.SIGTERM,interrupt)
zones={n:PC/n for n in ['intel-rapl:0','intel-rapl:1']}
def energy():return {n:int((z/'energy_uj').read_text()) for n,z in zones.items()}
changes=[('intel-rapl:0',0,105),('intel-rapl:0',1,110),('intel-rapl-mmio:0',0,105),('intel-rapl-mmio:0',1,110),('intel-rapl:1',0,130),('intel-rapl:1',1,135),('intel-rapl:0',2,160)]
try:
 check()
 if temp()>=85:raise RuntimeError('CPU must start below 85 C')
 subprocess.run([str(ROOT/'motobook-fan-control'),'max'],check=True)
 print(subprocess.check_output([str(ROOT/'motobook-fan-speed')],text=True).strip(),flush=True)
 original={PC/z/f'constraint_{i}_power_limit_uw':int((PC/z/f'constraint_{i}_power_limit_uw').read_text()) for z,i,_ in changes}
 report['original_limits_uw']={str(p):v for p,v in original.items()}
 for z,i,v in changes:write(PC/z/f'constraint_{i}_power_limit_uw',v*1000000)
 last=energy();tick=start=time.monotonic();stage=160
 for c in sorted(os.sched_getaffinity(0)):
  workers.append(subprocess.Popen(['taskset','-c',str(c),'/tmp/power-a2z-cpu-stress'],user=1000,group=1000,cwd='/tmp',stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL))
 while time.monotonic()-start<20:
  time.sleep(.25);now=time.monotonic();e=energy();watts={}
  for n,value in e.items():
   delta=value-last[n]
   if delta<0:delta+=int((zones[n]/'max_energy_range_uj').read_text())
   watts[n]=round(delta/1e6/(now-tick),2)
  r={'seconds':round(now-start,3),'cpu_w':watts['intel-rapl:0'],'psys_w':watts['intel-rapl:1'],'cpu_c':temp(),'pl4_w':int(peak.read_text())/1e6,'battery_status':Path('/sys/class/power_supply/BAT0/status').read_text().strip(),'battery_w':int(Path('/sys/class/power_supply/BAT0/power_now').read_text())/1e6,'perf_flags':reg(0x64f),'thermal_flags':reg(0x19c)}
  rows.append(r);print(json.dumps(r),flush=True);check()
  elapsed=now-start
  wanted=160 if elapsed<2 else 180 if elapsed<4 else 190
  if wanted!=stage:write(peak,wanted*1000000);stage=wanted;print('PL4 ramp -> '+str(stage)+' W',flush=True)
  last,tick=e,now
 report['end_reason']='20-second window complete'
except (Exception,KeyboardInterrupt) as err:
 report['end_reason']=str(err) or 'interrupted';print('Stopping: '+report['end_reason'],flush=True)
finally:
 for p in workers:
  if p.poll() is None:p.terminate()
 for p in workers:
  try:p.wait(timeout=2)
  except subprocess.TimeoutExpired:p.kill();p.wait()
 errors=[]
 for f,v in reversed(list(original.items())):
  try:
   if not ac():v=min(v,int(f.read_text()),61000000 if f==peak else v)
   write(f,v)
  except (OSError,RuntimeError) as e:errors.append(str(e))
 # Keep the maximum fan requested by the user for cooldown; do not revert to auto.
 subprocess.run([str(ROOT/'motobook-fan-control'),'max'],check=False,stdout=subprocess.DEVNULL)
 os.close(fd);fcntl.flock(lock,fcntl.LOCK_UN);lock.close()
 report['restore_errors']=errors;report['all_workers_stopped']=all(p.poll() is not None for p in workers)
 report['peak_cpu_w']=max((r['cpu_w'] for r in rows),default=0)
 report['mean_cpu_w']=round(sum(r['cpu_w'] for r in rows)/len(rows),2) if rows else 0
 report['duration_s']=rows[-1]['seconds'] if rows else 0
 report['max_cpu_c']=max((r['cpu_c'] for r in rows),default=0)
 dest=OUT/'final-100w-no-software-cutoff.json';dest.write_text(json.dumps(report,indent=2));os.chown(dest,1000,1000)
 print(json.dumps({k:v for k,v in report.items() if k not in ['rows','original_limits_uw']}),flush=True)
