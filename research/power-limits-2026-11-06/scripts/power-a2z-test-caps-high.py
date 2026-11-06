import json,subprocess
from pathlib import Path
ROOT=Path('/home/sortedcord/Projects/system/power_a2z');OUT=ROOT/'research/power-limits-2026-11-06'
original=json.loads((OUT/'original.json').read_text())
changes=[]
def cmd(*c):return subprocess.run(c,check=True)
def write(z,i,v):
 f=Path('/sys/class/powercap')/z/f'constraint_{i}_power_limit_uw'
 try:
  f.write_text(str(v*1000000));r=f.read_text().strip();print(f'{f}: requested {v} W, read back {r}',flush=True);changes.append({'path':str(f),'requested_w':v,'readback':r})
 except OSError as e:print(f'{f}: {e}',flush=True);changes.append({'path':str(f),'error':str(e)})
def probe(name):cmd('/usr/bin/python','/tmp/power-a2z-probe.py',name,'--seconds','15')
try:
 cmd('systemctl','stop','thermald')
 cmd(str(ROOT/'motobook-fan-control'),'max')
 for z in ['intel-rapl:0','intel-rapl-mmio:0']:
  write(z,0,75);write(z,1,80)
 write('intel-rapl:1',0,90);write('intel-rapl:1',1,95)
 for peak in [100,115]:
  write('intel-rapl:0',2,peak)
  probe(f'raised-peak-cap-{peak}w')
finally:
 for name,val in original['paths'].items():
  if '/powercap/' in name and ('power_limit_uw' in name or 'time_window_us' in name):
   try:Path(name).write_text(val)
   except OSError as e:print('Restore error:',name,str(e),flush=True)
 (OUT/'cap-write-results-100-115.json').write_text(json.dumps(changes,indent=2))
 cmd('systemctl','start','thermald')
 cmd(str(ROOT/'motobook-fan-control'),'auto')
 print('Original power limits, thermal daemon and fan restored.',flush=True)
