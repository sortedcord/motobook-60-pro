import json,os,time
from pathlib import Path
fd=os.open('/dev/cpu/0/msr',os.O_RDONLY)
def reg(x):return int.from_bytes(os.pread(fd,8,x),'little')
z=Path('/sys/class/powercap/intel-rapl:0');last=int((z/'energy_uj').read_text());tick=time.monotonic();samples=[]
for i in range(6):
 time.sleep(2)
 now=time.monotonic();energy=int((z/'energy_uj').read_text());delta=energy-last
 if delta<0:delta+=int((z/'max_energy_range_uj').read_text())
 flags=reg(0x64f);thermal=reg(0x19c)
 row={'seconds':(i+1)*2,'package_w':round(delta/1e6/(now-tick),2),'perf_flags':hex(flags),'electrical_other':bool(flags&256),'current_limit':bool(thermal&4096),'thermal':bool(thermal&1)}
 print(json.dumps(row),flush=True);samples.append(row);last,tick=energy,now
 for p in Path('/sys/class/hwmon').glob('hwmon*'):
  if(p/'name').read_text().strip()=='coretemp' and int((p/'temp1_input').read_text())>=95000:raise SystemExit('Temperature cutoff')
Path('/tmp/power-a2z-limit-under-load.json').write_text(json.dumps(samples,indent=2))
os.close(fd)
