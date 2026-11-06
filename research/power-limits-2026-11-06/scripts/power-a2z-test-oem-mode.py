import fcntl,json,subprocess,time
from pathlib import Path
ROOT=Path('/home/sortedcord/Projects/system/power_a2z');OUT=ROOT/'research/power-limits-2026-11-06'
def acpi(arg):
 with open('/run/lock/motobook-fan-speed.lock','w') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX)
  p=Path('/proc/acpi/call');p.write_text(r'\_SB.PC00.LPCB.Q_EC.VPC0.DYTC '+hex(arg));response=p.read_text().strip('\0')
  print(hex(arg),response,flush=True)
  return int(response,0)
def cmd(*a):subprocess.run(a,check=True)
def caps():return {str(f):f.read_text().strip() for z in Path('/sys/class/powercap').glob('intel-rapl*:*') for f in z.glob('constraint_*power_limit_uw') if f.parent.name not in ['intel-rapl:0:0','intel-rapl:0:1']}
orig={'get':hex(acpi(2)),'ext':hex(acpi(12)),'caps':caps()};(OUT/'oem-mode-before.json').write_text(json.dumps(orig,indent=2))
try:
 # This BIOS's DYTC SET_EXT function 1 enables its native Geek mode.
 status=acpi(0x11100b)
 if status&0xff!=1:raise RuntimeError('Firmware rejected native mode')
 cmd(str(ROOT/'motobook-fan-control'),'max')
 print('Caps after OEM mode:',json.dumps(caps()),flush=True)
 cmd('/usr/bin/python','/tmp/power-a2z-probe.py','oem-geek-mode','--seconds','18')
 print('Caps after load:',json.dumps(caps()),flush=True)
finally:
 acpi(0x100b)
 # Restore the original MMC performance mode (function 0xb, mode 2).
 acpi(0x12b001)
 for name,val in orig['caps'].items():
  try:Path(name).write_text(val)
  except OSError as e:print('Restore failed',name,e,flush=True)
 cmd(str(ROOT/'motobook-fan-control'),'auto')
 print('Original OEM performance mode, caps, and fan restored.',flush=True)
