# Motobook 60 / Core Ultra 5 225H CPU power-limit investigation

Investigation date: 6 November 2026. Local timestamps are Asia/Kolkata (UTC+05:30).
This report covers the low-clock / low-package-power diagnosis, Linux-specific
research, controlled interventions, the >=70 W experiment, and the installed fix.
The earlier fan identification work is in [fan-identification.md](fan-identification.md)
and the fan controls are documented in [FAN_MONITORING.md](../FAN_MONITORING.md).

## Final 100 W request and result

After the 70 W investigation, the user requested a final >=100 W attempt,
explicitly required a readiness prompt for their external cooler, and requested
maximum fan speed. Readiness was requested and the user confirmed that the
external cooler was running. The supported maximum fan target was set to
**5400 RPM**; actual fan readings were **4338 RPM** before the run and roughly
**4382 RPM** after the final run. No higher physical fan speed was verified.

**The final run reached 102.01 W measured CPU package power.** It ran for
**20.171 seconds**, averaging **94.24 W** over the complete ramp/test window.
There were **14 samples at or above 100 W**, spanning **4.552–8.329 seconds**
into the run. The peak is from an approximately **250 ms** energy interval,
not the earlier 500 ms interval. Power reached ~100–102 W for part of the run,
then settled near **90.39 W mean in the last five seconds** as hardware thermal
limiting became active. This is a reached-power result, not sustained 100 W.

The highest reported CPU temperature was **104 C**. PSYS peaked at **132.06 W**;
reported battery discharge peaked at **71.184 W** even though AC remained
connected. Hardware performance-limit flags showed the current thermal-limit
bit in **54 of 80 samples**. This run demonstrates why a larger numerical
power ceiling cannot guarantee sustained 100 W in this chassis and why its
65 W adapter cannot supply this platform demand alone.

There were two attempts in this final phase:

| Attempt | Software temperature cutoff | Duration | CPU peak | Whole-run CPU mean | Maximum reported C | End condition |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| First 100 W attempt | 98 C | 6.081 s | 96.22 W | 89.80 W | 100 C | Software cutoff |
| Rerun explicitly requested without software cutoff | none | 20.171 s | 102.01 W | 94.24 W | 104 C | Fixed 20-second window completed |

In the first attempt a sampled temperature reached 100 C, exceeding the 98 C
cutoff; polling/sensor update delay allows an overshoot. The user then explicitly
instructed removal of the test's temperature cap and a rerun. **Only the custom
test's software cutoff was removed.** CPU thermal throttling, PROCHOT/shutdown
protection, and the original adaptive thermald remained enabled. No hardware
thermal setting, voltage, clock multiplier, or IccMax was changed.

The final test programmed CPU MSR and MMIO **PL1=105 W / PL2=110 W**, platform
**PSYS PL1=130 W / PL2=135 W**, and ramped **PL4=160 -> 180 -> 190 W**. In the
first attempt the steps were at roughly 3 and 6 seconds; in the no-software-cap
rerun they were at roughly 2 and 4 seconds. Actual CPU PL1/PL2 stayed below the
225H's published 115 W maximum turbo-power figure. PL4 is a separate peak-limit
setting, not the actual measured draw. The second run retained AC-disconnect,
battery-below-50%, a starting-temperature-below-85-C check, and fixed-runtime
termination; it had no ongoing software temperature cutoff.

All 14 workers were stopped and waited for after both attempts. Both reports
record **zero restoration errors**. All experimental CPU/platform caps were
restored to their pre-test values; the daily AC policy remains enabled. The fan
was deliberately left at the user's requested maximum setting for cooldown.
The persistent boost helper still has its 98 C cutoff; the no-cutoff change was
confined to the explicitly requested, bounded research rerun.

Evidence:

- [First attempt JSON](power-limits-2026-11-06/final-100w-attempt.json)
- [Final no-software-cutoff JSON](power-limits-2026-11-06/final-100w-no-software-cutoff.json)
- [First attempt script](power-limits-2026-11-06/scripts/power-a2z-final-100w.py)
- [Final rerun script](power-limits-2026-11-06/scripts/power-a2z-final-100w-no-cap.py)
- [First attempt log](power-limits-2026-11-06/logs/power-a2z-final-100w.log)
- [Final rerun log](power-limits-2026-11-06/logs/power-a2z-final-100w-no-cap.log)

## Earlier 70 W result and limits of that result

**Measured CPU package power exceeded 70 W under a 14-worker CPU load.** The
main successful trial averaged **71.79 W**, peaked at **73.18 W** in a roughly
500 ms measurement interval, and ran for **17.08 seconds** before the software
monitor stopped it at **98 C**. A subsequent test through the installed boost
helper averaged **71.44 W** for **8.03 seconds**, peaking at **72.82 W**, with a
maximum temperature of **92 C**.

This demonstrates a >=70 W load result; it does not demonstrate indefinitely
sustainable 70 W operation. The successful main trial averaged **92.44 W PSYS**.
The firmware reported a **65 W adapter**, and the battery supplemented it:
approximately **28 W mean reported battery discharge** over that trial, with
late readings around **30–33 W**. Battery sensor updates lag workload changes.
Power was restored after each trial. Hardware thermal protection stayed enabled. The later 100 W phase is described above.
The original adaptive `thermald` was running during the successful 135 W PL4 trial.

The main restriction was the **61 W PL4 setting**, rather than a 28 W PL1 cap.
Raising PL1/PL2 and PSYS alone left the machine around 30 W. Raising PL4 caused
repeatable increases in measured package power. PL4's programmed number is not
the measured package watts; on this system, 135 W PL4 permitted roughly 72 W
measured CPU package power with the tested workload.

A separate daily policy now raises only PL4 to **100 W** when plugged in and
in the Performance profile. It retains the existing CPU and platform PL1/PL2
budgets and automatic fan control. In a 45.27-second test it averaged **44.14 W**,
peaked at **46.73 W**, and reached **92 C**. Mean reported battery discharge was
**0.32 W**, settling to **0 W** at the end. This is a substantial improvement over
~30 W, without leaving the experimental 90/95 W platform budget enabled.

## Hardware, software, and initial state

- MOTOROLA machine type **83NY**, Motobook 60 14IAH10; BIOS **SFCN07WW**.
- Intel Core Ultra 5 **225H**, 14 cores / 14 threads: 4 P + 8 E + 2 LP-E.
- Arch Linux, kernel **7.2.14-arch1-1** during this investigation.
- `intel_pstate` active; turbo enabled (`no_turbo=0`), `max_perf_pct=100`.
- Energy-performance preference `performance`; platform profile `performance`.
- A `powersave` governor with active `intel_pstate` is not by itself evidence of
  a low frequency cap; EPP and the hardware request also matter.
- `thermald` version **2:2.5.13-1**, originally running with
  `/usr/bin/thermald --systemd --dbus-enable --adaptive`.
- `power-profiles-daemon` active. An existing `/usr/local/bin/motobook-power-profile`
  helper selects Performance on AC and Balanced/Power Saver on battery.
- Battery conservation was active around 79–80%; initial battery status was
  `Not charging`, with AC present. Charging and on-AC battery discharge are different.

Full initial sysfs values and selected MSRs are in
[original.json](power-limits-2026-11-06/original.json).

| Domain / interface | PL1 | PL2 | PL4 | Initial PL1 window | Initial PL2 window |
| --- | ---: | ---: | ---: | ---: | ---: |
| CPU package MSR, `intel-rapl:0` | 50 W | 80 W | 61 W | 55.967744 s | 0.002440 s |
| CPU package MMIO, `intel-rapl-mmio:0` | 55 W | 65 W | 61 W | 55.967744 s | 0.002440 s |
| Platform PSYS, `intel-rapl:1` | 56 W | 58 W | unavailable | 9.994240 s | 0.000976 s |

`constraint_0_max_power_uw=28000000` is the reported base/reference value, not
the active PL1 setting. The active setting is `constraint_0_power_limit_uw`.
Do not diagnose a 28 W cap from the former alone.

Both package interfaces expose the same effective PL4 value: changing the MSR
package PL4 through sysfs also changed the MMIO interface's PL4 readback.
The package MSR and MMIO PL1/PL2 values remain separate.

### Earlier CPU0 frequency restriction

Before these trials, CPU0 alone had `scaling_max_freq=400000` despite a
`cpuinfo_max_freq=4900000`. Restoring its maximum to 4900000 raised its HWP
maximum request from 7 to 79. Other policies were already at their hardware
maximum. The saved before/after record is
[power-a2z-cpu0-limit-before.json](power-limits-2026-11-06/prior/power-a2z-cpu0-limit-before.json).
The original writer of that cap was not established; it must not be attributed
to `thermald` without evidence.

The equivalent corrective command is:

```sh
sudo sh -c 'cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_max_freq > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq'
```

Earlier compilation readings showed high core utilization but P-core clocks
around 1.7–2.4 GHz and package power around 23 W. The earlier 60-second stress
trial peaked at 31.83 W on its 2-second package-power monitor; the dashboard's
longer averaging window displayed a different peak. Its original scripts and
records are preserved in [prior/](power-limits-2026-11-06/prior/).

## How measurements were taken

The main workload was an optimized C 64-by-64 floating-point matrix multiply.
One unprivileged process was pinned to each of the 14 logical CPUs using
`taskset -c`. The controller ran as root to read RAPL and MSRs, but workload
processes dropped to UID/GID 1000. Workers had their own 65-second timeout and
were terminated and waited for in the controller's `finally` block.

A second workload used AVX2/FMA arithmetic with multiple independent vector
accumulators. Its 19.69 W baseline is **not** directly comparable to the matrix
trials: full CPU utilization does not make different instruction mixes consume
the same power. All PL4 comparisons in the table below use the matrix workload.

Power was derived from cumulative hardware energy counters:

```
watts = wrapped_delta(energy_uj) / 1,000,000 / elapsed_monotonic_seconds
```

The probe sampled approximately every **0.5 seconds**, handled energy-counter
wraparound, and read CPU MSR and MMIO energy counters as a cross-check, plus PSYS.
These are hardware estimates, not a wall-socket meter or an exact USB-C input
measurement. The dashboard sampler has a longer window and can smooth short
peaks. Arithmetic means in the summary are means of the nearly equal-duration
sample intervals. Battery power is the battery's sysfs sensor and can lag.

Every sample included maximum core/package temperature, CPU0's frequency cap,
and current/log MSR status from CPUs 0, 1, 4, and 12. Battery status and power
were added for the higher PL4 trials. Limits were captured before and after each
stage. Samples below the start/end boundary can contain workload ramp-up.

Software stopped workers on AC removal or the selected temperature cutoff.
Initial trials used 92 C. After inspecting the hardware temperature target and
testing stronger fan cooling, later controlled boost trials used **98 C**.
`MSR_TEMPERATURE_TARGET` read **0x02690000**, corresponding to a 105 C target and
a 2 C TCC offset on this boot. We did not modify that register. Intel's generic
225H product specification lists a 110 C maximum operating temperature; this
machine's actual configured thermal policy must also be respected.

The better-cooled 125/135 W PL4 trials pre-ran the maximum fan request. Actual
measured fan speed reached roughly **4,338–4,356 RPM**, despite a 5,400 RPM target.
The earlier 115 W trial started without as much fan lead time and reached its
92 C cutoff sooner. These are sequential experiments, not a randomized thermal
benchmark; do not interpret their temperature differences as solely a PL4 effect.

## Trial results

| Trial / raw JSON basename | Duration s | Mean CPU W | Peak ~500 ms CPU W | Hottest C | End condition |
| --- | ---: | ---: | ---: | ---: | --- |
| baseline | 10.08 | 19.69 | 20.83 | 58.0 | completed |
| max-fan-original-policy | 10.07 | 29.14 | 31.08 | 64.0 | completed |
| thermald-stopped | 15.1 | 30.14 | 31.97 | 64.0 | completed |
| thermald-nonadaptive | 15.1 | 30.1 | 31.88 | 64.0 | completed |
| raised-package-and-platform-caps | 15.11 | 30.24 | 31.4 | 63.0 | completed |
| raised-peak-cap-80w | 15.1 | 38.75 | 40.76 | 72.0 | completed |
| raised-peak-cap-100w | 15.09 | 51.12 | 53.55 | 86.0 | completed |
| raised-peak-cap-115w | 3.01 | 62.49 | 63.03 | 92.0 | 92 C temperature cutoff |
| oem-geek-mode | 18.11 | 30.54 | 31.81 | 64.0 | completed |
| raised-peak-cap-125w | 12.06 | 65.52 | 66.91 | 88.0 | completed |
| raised-peak-cap-130w | 10.55 | 68.69 | 69.89 | 98.0 | 98 C temperature cutoff |
| raised-peak-cap-135w | 17.08 | 71.79 | 73.18 | 98.0 | 98 C temperature cutoff |
| daily-original-budget-pl4-100w | 45.27 | 44.14 | 46.73 | 92.0 | completed |
| installed-boost-verification | 8.03 | 71.44 | 72.82 | 92.0 | completed |

The [summary CSV](power-limits-2026-11-06/summary.csv) also includes PSYS and
battery means. Every stage has its own JSON in
[the evidence directory](power-limits-2026-11-06/).

### Intervention sequence and interpretation

1. **Maximum fan alone:** about 29 W mean. More cooling did not remove the
   electrical restriction.
2. **Stopped `thermald`:** about 30 W, then restored it. Stopping the process
   alone did not fix the limit; stopping it is not guaranteed to undo settings
   it previously programmed.
3. **Temporary nonadaptive `thermald`:** about 30 W. The temporary unit was
   stopped and the original adaptive service restarted. No permanent
   nonadaptive override was installed.
4. **Raised both package interfaces to PL1=75 W / PL2=80 W and PSYS to
   PL1=90 W / PL2=95 W, keeping PL4=61 W:** still about 30 W. All writes read
   back at the requested wattages. This isolates why simply raising PL1/PL2
   did not work.
5. **Raised PL4 in steps with those other caps:** 80 -> ~39 W mean; 100 ->
   ~51 W; 115 -> ~62 W; 125 -> ~66 W; 130 -> ~69 W; 135 -> ~72 W.
   The 135 W figure is a peak-limit setting, not measured 135 W CPU draw.
   CPU package PL1/PL2 still bounded the test at 75/80 W.
6. **Native firmware Geek mode through DYTC:** the BIOS accepted the command,
   but the test remained ~30 W with original power caps. Geek mode was
   explicitly cleared and ordinary Performance restored.
7. **Daily setting, only PL4=100 W, original platform budget and automatic fan:**
   ~44 W mean / 47 W peak over 45 seconds, versus ~30 W previously. The
   significant battery supplementation from the high-power trial was absent.
8. **Installed boost helper:** separately reproduced >70 W with the original
   adaptive daemon active. The helper's restore paths and profile transitions
   were checked separately.

The evidence supports **PL4 being an effective restriction on this machine**.
It does not establish that all Core Ultra 200H laptops have the same problem,
that this BIOS value is a Linux kernel bug, or that a permanent 70 W CPU budget
is suitable for this chassis and its currently detected 65 W adapter.

## MSR evidence and what it means

Initial snapshots included:

| MSR | Meaning used here | Initial value |
| --- | --- | --- |
| `0x606` | RAPL units | `0xa0e03` |
| `0x610` | Package PL1/PL2 | `0x43828000df8190` |
| `0x601` | VR current / PL4 register used by RAPL | `0x1e8` |
| `0x65c` | Platform power limits | `0x81d0005b81c0` |
| `0x1fc` | Miscellaneous power management status/configuration, read only | `0x8e0005f` |
| `0x770` | HWP enabled | `0x1` |
| `0x771` | HWP capabilities | `0x11d1c4f` |
| `0x774` | HWP request after CPU0 cap correction | `0x4f07` |
| `0x64f` | Performance limit reasons, idle | `0x1d020000` |
| `0x19c` | CPU thermal/current status, idle snapshot | `0x88352800` |

During the initial low-power load, `0x64f` repeatedly read **0x1d021100**:
its current electrical/other bit was set. `0x19c` had its current-limit bit
(bit 12) set while its current thermal-status bit (bit 0) was clear. We
examined current bits, not just accumulated historical log bits.

Those indicators do not uniquely identify PL4, IccMax, the voltage regulator,
or the charger. The **controlled PL4 write and resulting package-power change**
is stronger causal evidence than the indicator alone. Under the daily test,
power-limit reasons became active as the original PSYS budget took effect.

Only sysfs powercap controls were used to modify power limits during these
trials. We did not write arbitrary MSRs, disable PROCHOT, modify IccMax, alter
voltage, remove hardware thermal throttling, or flash firmware.

## Firmware investigation

The machine's own decompiled ACPI tables were used to check method behaviour.
Relevant copies are in [firmware/](power-limits-2026-11-06/firmware/).

- `dsdt.dsl`, `\_SB.PC00.LPCB.Q_EC.VPC0.DYTC`: normal profile control and
  the SET_EXT branch that enables the firmware's Geek mode.
- `dsdt.dsl`, `\_SB.GZFD.WMAE`: WMI feature methods 17/18; fan feature
  `0x04030001` uses a target in RPM divided by 100. Zero returns to auto.
- `dsdt.dsl`, `\_SB.GZFD.WQC3`: fan reference buffer advertised 5,400 maximum
  and 1,500 minimum target. This is not a verified physical fan-rating label.
- `ssdt18.dsl`, `ODVP`: firmware policy has adapter-power, battery, and Geek
  mode conditions. In particular it compares `ADPW` with 44 and 64.
- Read-only evaluation of `\_SB.PC00.LPCB.Q_EC.ADPW` returned **0x41 = 65**.
  This is firmware's adapter-power report; no independent USB-PD analyser was used.
- `GKMF=0`, `ITSM=4` after restoration. The DYTC normal profile readback was
  **0x8012b01**, and extended mode readback was **0xf001** (Geek disabled).

DYTC commands used, all serialized against the fan helper's ACPI lock:

| Argument | Purpose / observed response |
| --- | --- |
| `0x2` | Get active normal state -> `0x8012b01` |
| `0x7` | Get MMC mode -> `0x20001` |
| `0xc` | Get extended state -> `0xf001` |
| `0x3` | Function capability -> `0x19f10001` |
| `0x6` | MMC capability -> `0xc0001` |
| `0x11100b` | Enable native Geek SET_EXT -> `0x1f101` |
| `0x100b` | Clear Geek SET_EXT -> `0xf001` |
| `0x12b001` | Restore ordinary MMC Performance -> `0x8012b01` |

The Linux GameZone path was not a usable substitute: this firmware's relevant
WMAA path returns zero. There was no usable firmware-attributes CPU power
control exposed. We did not copy another laptop's embedded-controller writes.

`thermald` D-Bus introspection was available, but control methods reported
that D-Bus control support was disabled by configuration (`DbusControl=0` in
`/etc/thermald/thermald-features.xml`). Thus its D-Bus interface was not used
to force new power budgets.

## Linux research and source assessment

Sources were consulted on 6 November 2026. Owner reports are labelled as such;
their proposed fixes were not assumed to apply to this machine.

1. **Intel 225H specification:** [official specifications](https://www.intel.com/content/www/us/en/products/sku/241749/intel-core-ultra-5-processor-225h-18m-cache-up-to-4-90-ghz/specifications.html).
   Intel lists 28 W processor base power and 115 W maximum turbo power. These
   do not guarantee a laptop will sustain either a particular wattage or its
   maximum single-core turbo on all cores. The user's 75 W expectation is not
   the CPU's published maximum turbo-power number.
2. **Intel current/EDP guidance:** [Intel support article 000039154](https://www.intel.com/content/www/us/en/support/articles/000039154/processors/intel-core-processors.html).
   Describes possible IccMax, BIOS VR-current, and power-delivery causes. It is
   general XTU guidance, not a confirmed diagnosis or Linux-specific 225H fix.
3. **Exact-CPU Linux owner report:** [4PDA RedmiBook Pro 2025 thread, post #1803](https://4pda.to/forum/index.php?showtopic=1103147&st=1800).
   Owner described a 225H staying around 28 W and below about 55 C under Linux,
   and reported that enabling `thermald` restored dynamic limits. The author's
   PL0 terminology is imprecise; it is not adopted here. The forum returned
   HTTP 403 on direct open; the search index exposed the post text. This was
   not an independently reproduced or upstream-confirmed fix.
4. **Related-CPU detailed owner report:** [LG Gram Pro 16Z90TR / 255H Linux setup](https://github.com/jvdillon/rtx-laptop-linux#7-run-thermald-without---adaptive-and-pin-cpu-power-caps).
   Author described 400 MHz cores at 60 C, MMIO PL1 shrinking to 13–26 W, and
   PL2=0. Reported recovery after avoiding adaptive thermald and pinning caps;
   associated the failure with firmware/NVIDIA policy communication. This is
   materially different from our nonzero PL2 and PL4-sensitive result. Its
   disabled-policy workaround loses some chassis/battery/GPU budget controls.
5. **Same CPU family, manufacturer instruction:** [ASRock NUC-225H/255H manual, printed p.22](https://download.asrock.com/IPC/Manual/NUC-255H.pdf#page=28).
   The board vendor says its Intel Innovation Platform Thermal Framework
   implementation relies on Windows DTT and instructs Linux users to disable
   that option. This is a board-specific instruction, not a Motobook fix.
6. **Counterexample to a universal Linux power bug:** [Phoronix original 255H Windows/Linux tests](https://www.phoronix.com/review/windows-beats-linux-arl-h/4).
   The tester investigated with Lenovo/Intel and found Linux CPU power within
   expectations, despite performance differences. Lower Linux benchmark scores
   alone do not establish a wattage-cap bug.
7. **Thermald policy mechanism:** [Intel thermald developer documentation](https://github.com/intel/thermal_daemon/blob/master/DEVELOPER.md).
   Relevant for understanding OEM thermal policy, including chassis sensors;
   a cool CPU alone does not prove all thermal limits should be removed.
8. **Upstream RAPL implementation:** [Linux powercap driver source](https://github.com/torvalds/linux/blob/master/drivers/powercap/intel_rapl_common.c).
   Confirms constraint-index mapping, the PL4 peak constraint, and discrete time
   windows. The driver's PL4 maximum generalization is about twice PL2, so a
   PL4 setting above the published 115 W turbo number is not itself evidence
   of measured CPU draw above 115 W. We still bounded actual CPU PL1/PL2.
9. **Same-family PL4 owner observations:** [4PDA post #1269 and neighbouring posts](https://4pda.to/forum/index.php?showtopic=1103147&st=1260).
   Owners discussed PL4 having more effect than PL1/PL2 and approximately
   80–85 W PL4 corresponding to 37–40 W draw. These are Windows-oriented owner
   reports, not Linux cases; included because the mechanism matches our local
   measurement. Do not reuse their numbers as universal safe settings.
10. **Original 225H Linux SBC testing:** [CNX Software UP Xtreme ARL review](https://www.cnx-software.com/2025/12/14/up-xtreme-arl-ai-dev-kit-review-benchmarks-and-ai-workloads-on-an-intel-core-ultra-5-225h-arrow-lake-sbc/).
    Tester reports 28/60/120 W PL1/PL2/PL4. Useful evidence that the limits are
    separate; it does not establish this laptop's board-current capability.
11. **Lenovo driver interface:** [kernel lenovo-wmi-other documentation](https://docs.kernel.org/6.19/wmi/devices/lenovo-wmi-other.html).
    Helped identify the method and capability interfaces. Not every machine
    exposing these GUIDs implements all power-control methods.
12. **Native Geek mode on another IdeaPad:** [upstream mailing-list investigation](https://lkml.iu.edu/hypermail/linux/kernel/2606.1/13276.html).
    An AMD IdeaPad owner's DYTC observations motivated checking our own tables.
    Only our own BIOS method implementation was used for the local trial.

No confirmed Motobook-specific upstream Linux fix was found. We did not treat
an unrelated desktop Core Ultra thermald issue, GPU wattage caps, or generic
Windows tuning advice as proof of the cause here.

Representative search terms: `225H thermald 28`, `225H linux power limit`,
`255H linux 30W throttling`, `225H PL4`, `14IAH10 PL4`, `225H IccMax`,
`DYTC Geek linux`, and `lenovo WMI SetFeatureValue cpu power limit`.

## Changes installed and how to operate them

Source files:

- [motobook-power-control](../motobook-power-control): root-only, BIOS-matched
  controller. `watch`, `status`, `stock`, and bounded `boost` commands.
- [power-a2z-performance.service](../systemd/power-a2z-performance.service):
  starts the daily watch policy at boot.
- [install-performance-policy](../install-performance-policy): installs the
  root-owned executable and enables the service.

Installed paths:

```
/usr/local/sbin/motobook-power-control
/etc/systemd/system/power-a2z-performance.service
/run/lock/motobook-power-control.lock
```

The daily watcher polls every 2 seconds. It raises **only PL4** to 100 W on AC
in Performance. It restores a ceiling of 61 W off AC, outside Performance,
or at 95 C, and resumes the higher setting only after cooling to 85 C or below.
It preserves a tighter off-AC/nonperformance PL4 if firmware already imposed
one. Stopping the service restores PL4 to at most 61 W. It keeps `thermald`
active, leaves its dynamic PL1/PL2 control in place, and does not set fan mode.

Status / logs:

```sh
sudo /usr/local/sbin/motobook-power-control status
systemctl status power-a2z-performance.service
journalctl -u power-a2z-performance.service
```

Temporary high-power configuration:

```sh
sudo /usr/local/sbin/motobook-power-control boost --seconds 60
```

Boost requests maximum fan cooling, waits 12 seconds for the fan to ramp,
then applies CPU MSR/MMIO 75/80 W, PSYS 90/95 W, and PL4 135 W. It requires AC,
at least 50% battery, and a starting temperature below 85 C. It runs for the
requested **1–120 seconds**, ending early at 98 C, AC removal, or battery below
50%. It holds the policy lock so the daily watcher does not fight the trial.
On exit/SIGINT/SIGTERM it attempts to restore every changed power limit and the
previous fan setting. The timer starts after fan preparation. The command
changes limits; it does **not** start a CPU workload. Use an actual build or
separate bounded workload to measure draw. Higher caps do not force power use.

Disable the automatic policy and return to the stock PL4 ceiling:

```sh
sudo systemctl disable --now power-a2z-performance.service
sudo /usr/local/sbin/motobook-power-control stock
```

Re-enable:

```sh
sudo systemctl enable --now power-a2z-performance.service
```

The standard fan controller remains available from the dashboard. The timed
boost temporarily takes fan control and restores the setting it found at the
start; avoid issuing a conflicting fan request during that short interval.

## Verification, incidental changes, and unresolved points

- Service stop restored PL4 to 61 W; restarting in Performance on AC restored
  100 W. Balanced/Performance transitions were checked against hardware.
- Installed boost was exercised with actual load and reproduced >70 W.
- Explicit interruption of the installed helper was tested. Detailed final
  checks are in [installed-policy-checks.json](power-limits-2026-11-06/installed-policy-checks.json).
- All worker processes were terminated and waited for. The temporary
  nonadaptive thermald unit was removed from service; adaptive thermald remains
  active. Geek mode is disabled and normal Performance is selected. The final 100 W request leaves the fan at its maximum manual target, superseding earlier auto-restoration.
- The first installed-helper check found a wrong path for the fan helper.
  It was corrected to `/usr/local/lib/power-a2z/motobook-fan-control` before
  completion. The failed log is retained. A subsequent check incorrectly
  expected initial MMIO PL1=55 W after profile changes; adaptive firmware policy
  had legitimately changed it to 47.5 W. The final check compares the snapshot
  immediately before boost with its restored values, rather than assuming
  static MMIO limits. All failed-check logs are retained. The external snapshot could also race with thermald before the helper captured its own snapshot; the final check verifies static CPU/PSYS values and confirms MMIO PL1 is within the original policy range rather than requiring an unchanged value across another writer. The helper now captures limits immediately before applying boost, after fan preparation.
- One initial selected-MSR snapshot attempt failed on unsupported MSR `0x65d`.
  The successful snapshot records it as unavailable. No write to it was made.
- **Time-window round-trip:** early trial cleanup wrote the initial sysfs
  time-window strings back. The kernel's integer time-window conversion rounded
  CPU PL2 windows from **2440 us to 1952 us**. This incidental change is recorded
  in before/after JSON. Later installed policy/boost code does not write time
  windows. Exact original hardware encoding cannot be round-tripped through
  this short-window sysfs conversion; firmware initialization on reboot is
  expected to restore its defaults, but that reboot was not performed or tested.
  No raw MSR/MMIO write was used to force restoration of this value.
- Full PL4/thermal behaviour after suspend or reboot has not been load-tested.
  The watcher is enabled at boot and periodically reevaluates conditions, but
  this session did not interrupt the user's login with a reboot.
- Higher-rated adapter compatibility and a sustained >70 W cooling solution
  were not established. A 65 W adapter cannot alone supply a 90+ W platform
  indefinitely. The high-power setting therefore remains a bounded boost.

## Evidence and reproduction

See [COMMANDS.md](power-limits-2026-11-06/COMMANDS.md) for the command ledger,
[summary.csv](power-limits-2026-11-06/summary.csv) for machine-readable results,
[scripts/](power-limits-2026-11-06/scripts/) for the actual test harnesses,
[logs/](power-limits-2026-11-06/logs/) for saved command output, and
[SHA256SUMS](power-limits-2026-11-06/SHA256SUMS) for evidence-file hashes.
The command ledger distinguishes retained exact scripts from equivalent
one-line reconstructions of earlier interactive actions. This is an evidence
bundle, not a claim to have recorded a complete terminal session transcript.

## Final captured machine state

[final-state.json](power-limits-2026-11-06/final-state.json) records the final
readback, including service units, CPU policies, fan setting, and remaining
stress-process check. At capture (09:51:46 IST), adaptive thermald and the
enabled daily performance service were active, there were **no stress workers**,
and the maximum fan target was still requested with **4391 RPM measured**.
The last installed-policy verification **passed**, including service/profile
transitions, explicit helper interruption, original fan-mode restoration,
nonexperimental CPU/PSYS caps, and MMIO PL1 remaining under adaptive policy.
An archived copy of the installed source and unit is in
[installed/](power-limits-2026-11-06/installed/).
