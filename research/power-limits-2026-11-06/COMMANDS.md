# Command ledger: Motobook / 225H power investigation

All paths below refer to this machine. Working directory:
`/home/sortedcord/Projects/system/power_a2z`. Commands with `sudo` require root.
This is a ledger of material diagnostics and interventions, not a byte-for-byte
terminal transcript. Archived scripts are the exact retained implementations;
short shell forms for earlier Python sysfs reads/writes are marked equivalent.
Raw writes were used only inside monitored, reversible trials.

## 1. Inventory and baseline inspection

Commands used, with some output limited by `head`, `tail`, or `max_output_tokens`:

```sh
pwd
rg --files -g 'AGENTS.md' -g '*stress*' -g '*power*' -g '*fan*' -g '*research*' -g '*limit*' . /tmp
ls -la
uname -a
sudo -n true
powerprofilesctl
systemctl status thermald power-profiles-daemon --no-pager
pacman -Q thermald linux-tools msr-tools
command -v stress-ng turbostat rdmsr wrmsr intel-undervolt acpidump iasl
lscpu
ps -eo pid,pcpu,comm --sort=-pcpu
ls /sys/bus/platform/devices/
ls /sys/bus/platform/drivers/
ls /sys/bus/wmi/devices
cat /sys/firmware/acpi/platform_profile*
cat /sys/devices/system/cpu/intel_pstate/*
sudo -n journalctl -b -u thermald --no-pager
/usr/bin/thermald --help
cat /sys/class/power_supply/ADP1/online
cat /sys/class/power_supply/BAT0/{status,power_now,capacity}
cat /sys/bus/platform/devices/VPC2004:00/fan_mode
sudo -n cat /sys/kernel/debug/ideapad/status
```

Effect: read only. Established software, governor/profile, AC presence, battery
state, thermal daemon arguments, and available firmware interfaces. `git status`
reported that the project was not a Git repository. Some queried optional tools
were not installed; no package was installed for these trials.

Equivalent readable form of the powercap inspection used:

```sh
sudo python - <<'PY'
from pathlib import Path
for z in Path('/sys/class/powercap').glob('intel-rapl*:*'):
    print(z)
    for f in sorted(z.glob('constraint_*')):
        try:
            print(f.name, f.read_text().strip())
        except OSError as error:
            print(f.name, error)
PY
```

Effect: initial CPU MSR 50/80 W, MMIO 55/65 W, shared PL4=61 W,
PSYS 56/58 W. Read initial time windows separately from power values.
Some core/uncore attributes returned no data; these were not treated as zeros.

The selected-MSR snapshot was obtained with `os.pread` on `/dev/cpu/0/msr`:

```python
fd = os.open('/dev/cpu/0/msr', os.O_RDONLY)
value = int.from_bytes(os.pread(fd, 8, register_number), 'little')
```

Registers read: `0x606`, `0x610`, `0x601`, `0x65c`, `0x65d`, `0x1fc`,
`0x770`, `0x771`, `0x774`, `0x64f`, `0x19c`; subsequently `0x614`, `0xce`,
and `0x1a2`. `0x65d` returned I/O error and was marked unavailable. There
were **no direct MSR writes**. The successful initial snapshot is `original.json`.

Earlier CPU0 correction, equivalent command:

```sh
sudo sh -c 'cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_max_freq > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq'
```

Effect: CPU0 maximum 400000 -> 4900000 kHz. `prior/` retains the before/after
record and the previous 60-second stress monitor and results.

## 2. Firmware and thermal-policy inspection

Decompiled tables already existed from the earlier fan investigation. They
were searched/read, including these expressions:

```sh
rg -n -i 'WMAE|WQAE|PL1|PL2|PL4|PSYS|PPCC|SPPC|ICCM|CTDP' /tmp/motobook-fan-research/*.dsl
rg -n 'Method \((DYTC|WMA[B-Z]|WQ[A-Z0-9]|SPPC|SPL[124])' /tmp/motobook-fan-research/dsdt.dsl
rg -n 'Adapter|ADPW|ADPT|ACPW|ARTG|PSRC|Power Source|ACDC|ACST' /tmp/motobook-fan-research/ssdt18.dsl /tmp/motobook-fan-research/dsdt.dsl
sed -n '43761,44440p' /tmp/motobook-fan-research/dsdt.dsl
sed -n '44753,44875p' /tmp/motobook-fan-research/dsdt.dsl
sed -n '45144,45175p' /tmp/motobook-fan-research/dsdt.dsl
sed -n '3535,3695p' /tmp/motobook-fan-research/ssdt18.dsl
sed -n '430,575p' /tmp/motobook-fan-research/ssdt18.dsl
```

The table copies are archived in `firmware/`. Search/read commands had no
hardware side effects. The earlier `acpidump`/`iasl` extraction was not rerun
for this session; the exact earlier extraction invocation was not captured here.

Read-only ACPI field evaluation, exactly the mechanism used:

```sh
sudo python - <<'PY'
import fcntl
from pathlib import Path
with open('/run/lock/motobook-fan-speed.lock', 'w') as lock:
    fcntl.flock(lock, fcntl.LOCK_EX)
    for field in ['ADPW', 'GKMF', 'ITSM']:
        p = Path('/proc/acpi/call')
        p.write_text(r'\_SB.PC00.LPCB.Q_EC.' + field)
        print(field, p.read_text().strip('\0'))
PY
```

Effect: returned adapter report `0x41` (65), Geek flag 0, thermal mode 4.
Writing the ACPI request file above evaluates a read-only firmware field;
it is not an embedded-controller register write.

DYTC read arguments: `0x2`, `0x7`, `0xc`, `0x3`, `0x6`, evaluated with
`\_SB.PC00.LPCB.Q_EC.VPC0.DYTC <argument>` under the same lock. Responses are
listed in the main report. Thermal cooling-device type/state files and
INTC1042 UUID files were read; no cooling-device state was forced.

## 3. Stress workloads and probe

The matrix binary was already built for the previous stress test. Its source
is archived, as is the additional FMA workload. Rebuild commands:

```sh
gcc -O3 -march=native /tmp/power-a2z-cpu-stress.c -o /tmp/power-a2z-cpu-stress
gcc -O3 -mavx2 -mfma /tmp/power-a2z-fma-stress.c -o /tmp/power-a2z-fma-stress
```

The second command was run in this session. The first is the equivalent rebuild
for the previously created matrix binary. Neither changes CPU settings.

Commands used for the recorded sequence:

```sh
sudo -n python /tmp/power-a2z-probe.py baseline --seconds 10 --fma
sudo -n python /tmp/power-a2z-test-policy.py
sudo -n python /tmp/power-a2z-test-caps.py > /tmp/power-a2z-caps-test.log 2>&1
sudo -n python /tmp/power-a2z-test-caps-high.py > /tmp/power-a2z-caps-high-test.log 2>&1
sudo -n python /tmp/power-a2z-test-oem-mode.py > /tmp/power-a2z-oem-mode.log 2>&1
sudo -n python /tmp/power-a2z-test-caps-target.py > /tmp/power-a2z-caps-target-test.log 2>&1
sudo -n python /tmp/power-a2z-test-caps-final.py > /tmp/power-a2z-caps-final-test.log 2>&1
sudo -n python /tmp/power-a2z-test-daily.py > /tmp/power-a2z-daily-test.log 2>&1
```

The named scripts are archived in `scripts/`. They contain the exact sequencing,
wait times, workload pinning, temperature cutoffs, snapshots, root/user separation,
and `finally` cleanup. They contain absolute paths for this machine and `/tmp`
filenames. Do not run an archived mutation script as a generic installation step.
The probe evolved to add battery readings and configurable 85–98 C cutoffs;
`scripts/power-a2z-probe.py` is the final retained version. Earlier per-stage
JSON preserves the fields that were actually collected at that time.

## 4. Fan controls

```sh
sudo -n ./motobook-fan-control max
sudo -n ./motobook-fan-speed
sudo -n ./motobook-fan-control auto
```

Effect: maximum supported **target** 5400 RPM, and restoration to firmware auto.
Actual observed speed after ramp-up was approximately 4338–4356 RPM. The target
and measured speed are not interchangeable. Fan helper validates this machine,
BIOS, and firmware reference buffer before writing the fan feature.

Installed equivalents:

```sh
sudo /usr/local/lib/power-a2z/motobook-fan-control max
sudo /usr/local/lib/power-a2z/motobook-fan-speed
sudo /usr/local/lib/power-a2z/motobook-fan-control auto
```

## 5. Thermald A/B comparison

Material commands executed inside the policy script:

```sh
sudo systemctl stop thermald
sudo systemd-run --unit=power-a2z-thermald-test --service-type=simple /usr/bin/thermald --no-daemon --dbus-enable
sudo systemctl stop power-a2z-thermald-test
sudo systemctl start thermald
```

Effect: tested daemon stopped and temporarily running without `--adaptive`.
Neither fixed the ~30 W restriction. The original adaptive daemon was restored.
No permanent `thermald` service override was installed.

## 6. Powercap writes

These are equivalent shell forms of the Python `Path.write_text` operations
in the archived scripts, **not additional independent trials**. Every applied
value was read back immediately. Units are microwatts.

```sh
# Experimental package budgets, both interfaces.
sudo sh -c 'echo 75000000 > /sys/class/powercap/intel-rapl:0/constraint_0_power_limit_uw'
sudo sh -c 'echo 80000000 > /sys/class/powercap/intel-rapl:0/constraint_1_power_limit_uw'
sudo sh -c 'echo 75000000 > /sys/class/powercap/intel-rapl-mmio:0/constraint_0_power_limit_uw'
sudo sh -c 'echo 80000000 > /sys/class/powercap/intel-rapl-mmio:0/constraint_1_power_limit_uw'
# Experimental platform budgets; these require battery supplementation here.
sudo sh -c 'echo 90000000 > /sys/class/powercap/intel-rapl:1/constraint_0_power_limit_uw'
sudo sh -c 'echo 95000000 > /sys/class/powercap/intel-rapl:1/constraint_1_power_limit_uw'
```

Effect with the original PL4: still ~30 W. Then the scripts wrote package
`constraint_2_power_limit_uw` successively as **80000000, 100000000, 115000000,
125000000, 130000000, 135000000**, each followed by a monitored load trial.
Effects are in `summary.csv` and the main report. Each script restored its
snapshot on exit. The first scripts also rewrote saved time-window strings;
the kernel rounded CPU PL2 windows from 2440 to 1952 us. The installed helper
never writes time windows. This incidental difference is documented, not hidden.

The separate daily test wrote only PL4=100000000 with original other budgets,
ran for 45 seconds, then restored PL4=61000000.

## 7. Native Geek mode

The archived `power-a2z-test-oem-mode.py` uses the same ACPI call/lock mechanism:

```
\_SB.PC00.LPCB.Q_EC.VPC0.DYTC 0x11100b   # enable native Geek SET_EXT
\_SB.PC00.LPCB.Q_EC.VPC0.DYTC 0x100b     # clear Geek SET_EXT
\_SB.PC00.LPCB.Q_EC.VPC0.DYTC 0x12b001   # restore ordinary Performance
```

Effect: accepted by this BIOS, but no measured power improvement with original
caps. Restored the original mode and caps. No direct EC address writes.

## 8. Installation and verification

```sh
python -m py_compile motobook-power-control
chmod +x motobook-power-control install-performance-policy
sudo -n ./install-performance-policy
sudo -n ./motobook-power-control status
systemctl status power-a2z-performance --no-pager
```

Installer actions:

```sh
install -m 0755 motobook-power-control /usr/local/sbin/motobook-power-control
install -m 0644 systemd/power-a2z-performance.service /etc/systemd/system/power-a2z-performance.service
systemctl daemon-reload
systemctl enable --now power-a2z-performance.service
```

Live check script:

```sh
sudo -n python /tmp/power-a2z-verify-installed-policy.py > /tmp/power-a2z-installed-verification.log 2>&1
```

It exercised Balanced/Performance transitions, service stop/start, timed boost,
SIGTERM cleanup, fan restoration, and adaptive thermald status. One run included
an 8-second CPU probe through the installed boost command, reproducing >70 W.
An initial helper-path error was fixed. Further checks found that treating MMIO
PL1 as static across adaptive-policy updates was an invalid test assumption;
failed logs are preserved alongside the final status and checks.

Operational commands and rollback are in the main report. The persistent daily
policy raises only PL4, not the experimental PSYS budgets. The boost command
expires automatically and restores its own immediate pre-write snapshot.

## 9. Research tooling

Web search and page-open tools were used for the source list in the main report,
with queries recorded there. The Linux `intel_rapl_common.c` source was also
read using Python `urllib.request.urlopen` from the official upstream raw URL:

```
https://raw.githubusercontent.com/torvalds/linux/master/drivers/powercap/intel_rapl_common.c
```

Relevant findings: separate PL4 handling, shared-interface peak readback, and
integer time-window conversion. No source code downloaded from a forum was
executed. The 4PDA direct page returned HTTP 403; indexed post text supplied its
owner reports. A PDF screenshot attempt failed; readable manual text supplied
the ASRock instruction. Neither failure was treated as local hardware evidence.

## 10. Final requested >=100 W tests

The user was prompted to confirm readiness with an external cooler and confirmed
it was running. Fans were set to their supported maximum before either attempt:

```sh
sudo -n /usr/local/lib/power-a2z/motobook-fan-control max
sudo -n /usr/local/lib/power-a2z/motobook-fan-speed
```

First attempt, using a 98 C software cutoff:

```sh
sudo -n python /tmp/power-a2z-final-100w.py > /tmp/power-a2z-final-100w.log 2>&1
```

Effect: 96.22 W CPU peak; ended at 6.081 seconds when a temperature sample
reached 100 C. The software check was 98 C; sampling/sensor delays permit
overshoot. All workers stopped and prior limits restored without errors.

The user explicitly requested removing the software temperature cap and rerunning:

```sh
sudo -n python /tmp/power-a2z-final-100w-no-cap.py > /tmp/power-a2z-final-100w-no-cap.log 2>&1
```

Effect: **102.01 W CPU peak**, 94.24 W whole-run mean over 20.171 seconds,
104 C maximum temperature. Fourteen ~250 ms samples met/exceeded 100 W.
Hardware thermal limiting subsequently reduced draw to around 90 W. PSYS
peaked at 132.06 W; battery discharge at 71.184 W with AC still connected.
The fixed 20-second window completed and all workers stopped. Prior power
limits were restored, with zero recorded restoration errors. Fan maximum was
left requested for cooldown.

Both scripts set CPU MSR/MMIO PL1=105 W / PL2=110 W and PSYS PL1=130 W /
PL2=135 W. PL4 was ramped 160 -> 180 -> 190 W (first script at approximately
3/6 seconds; rerun at 2/4 seconds). Each write was read back. CPU PL1/PL2
remained below the published 115 W turbo specification. Neither script wrote
hardware thermal controls, voltage, IccMax, or clock multipliers. Only the second
script removed the custom ongoing temperature check; both retained a below-85-C
start check, AC/battery checks, and fixed runtime. The installed everyday boost
helper was not changed to remove its software temperature cutoff.

The scripts are archived under `scripts/`, raw logs under `logs/`, and both
attempts have separate JSON records. The failed first attempt was not overwritten.
