import subprocess
from pathlib import Path
f=Path('/sys/class/powercap/intel-rapl:0/constraint_2_power_limit_uw');original=f.read_text()
try:
 f.write_text('100000000')
 subprocess.run(['/usr/bin/python','/tmp/power-a2z-probe.py','daily-original-budget-pl4-100w','--seconds','45','--cutoff','95'],check=True)
finally:
 f.write_text(original)
 print('Original PL4 restored.',flush=True)
