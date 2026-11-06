# Motobook fan RPM

`motobook-fan-speed` is a Python script that reads the current CPU fan speed
on this Motorola 83NY (Motobook 60 14IAH10). It checks the model before querying
the firmware. It does not set a fan target or change the cooling mode.

## Usage

From this directory:

```sh
sudo ./motobook-fan-speed
```

From anywhere:

```sh
sudo /home/sortedcord/Projects/system/power_a2z/motobook-fan-speed
```

Example output:

```text
CPU fan: 2,105 RPM
```

Dependencies are Python 3 and the `acpi_call` module matching the running kernel.
The Arch `extra/acpi_call` package is already installed for the current kernel.
The script loads the module itself when invoked. Root is required to load the
module and access `/proc/acpi/call`.

## Collector integration

Install and enable the system sampler from this directory:

```sh
sudo ./install-fan-monitoring
```

This installs a root-owned helper at `/usr/local/lib/power-a2z/motobook-fan-speed`
and the units from `systemd/` into `/etc/systemd/system/`, then enables
`power-a2z-fan.timer` and immediately samples once. The system service runs as
root every 10 seconds. It loads `acpi_call`, invokes only the fan-speed getter,
and atomically writes `/run/power-a2z/fan.json` with mode 0644. The user collector
does not need root or sudo access. Run the installer again after changing the helper
or unit definitions to update the installed copies.

The JSON cache contains an ISO timestamp, `rpm`, and `status` (`ok` or `error`).
Failures replace the previous reading with null RPM and an error status. The
collector accepts successful samples only when they are at most 30 seconds old;
missing, malformed, future-dated, or stale samples never become zero RPM. A real
zero is retained as a stopped fan.

`collect.py` adds `fans_hwmon`, `fan_firmware`, and `thermal_zones` to each
snapshot, and enriches `temperatures_hwmon` with sensor names, limits, and alarms.
The dashboard shows these readings and history under **Fans & thermals**, with
aggregate fan RPM and hottest temperature included in the sample table and CSV.
Historical samples without fan fields remain supported.

Check or stop the sampler with:

```sh
systemctl status power-a2z-fan.timer power-a2z-fan.service
journalctl -u power-a2z-fan.service
cat /run/power-a2z/fan.json
sudo systemctl disable --now power-a2z-fan.timer
```

The helper still prints `CPU fan: 2,105 RPM` when used directly. Its optional
`--output /path/to/fan.json` argument enables atomic JSON output; the destination
directory must already exist. A nonzero exit status indicates failure.

## Firmware query

The query was identified by disassembling this laptop's ACPI tables:

```text
\_SB.GZFD.WMAE 0 17 b01000304
```

This calls WMAE method `0x11` (Get Feature Value) for feature `0x04030001`
(current fan RPM). The result is four bytes interpreted as an unsigned
little-endian integer. Writing this request to `/proc/acpi/call` invokes the
getter; it does not write a fan-speed target. The helper serializes its queries
using `/run/lock/motobook-fan-speed.lock`.

The firmware's separate fan reference data reports one fan, a maximum of
5,400 RPM and a minimum reference of 1,500 RPM. These are reference values;
the minimum is not a guarantee that the fan will always spin.

The data formats are described in the
[Linux Lenovo WMI documentation](https://github.com/torvalds/linux/blob/master/Documentation/wmi/devices/lenovo-wmi-other.rst).

The source helper lives in this project. The installed system service executes
its root-owned copy so it never runs a user-writable project script as root.

## Request maximum RPM or restore automatic control

Research and a live test on 2026-11-05 found that BIOS **SFCN07WW** on this
MOTOROLA 83NY implements a direct fan RPM setter even though the separate
Lenovo full-speed switch is unsupported. Use the guarded project helper:

```sh
sudo ./motobook-fan-control max
sudo ./motobook-fan-speed
```

To return control to the firmware:

```sh
sudo ./motobook-fan-control auto
```

The helper accepts `max`, `auto`, or `manual RPM`, checks the model and BIOS, and reads
`\_SB.GZFD.WQC3 0` to confirm one fan with maximum reference 5400 RPM and minimum
reference 1500 RPM before changing anything. It shares the sampler's lock.
Maximum requests **5400 RPM**; automatic sends **0**, which means firmware
control, not stopped. No startup service is installed for these overrides.

The live test increased measured RPM from about 2100 to about 4330 after the
maximum request. Automatic control brought it back to about 1960–2130 RPM;
requesting maximum again reproduced the increase. The reference/target is not
a guarantee of the measured speed: report actual RPM from the getter.

Firmware evidence: the running DSDT SHA-256 was
`1236b79196f1d6e92ac9e06fb89e02dce8cc8288069f562049a5153754a79011`.
Its `\_SB.GZFD.WMAE` method implements SetFeatureValue (method 18), feature
`0x04030001`, dividing the RPM target by 100 before invoking the firmware's EC
command 0x62. The helper passes an eight-byte little-endian buffer containing
the feature ID followed by the RPM target. It uses this firmware method rather
than writing EC registers directly.

Sources:

- [Linux WMI driver](https://github.com/torvalds/linux/blob/master/drivers/platform/x86/lenovo/wmi-other.c): `lwmi_om_fan_get_set` and `lwmi_om_hwmon_write` document the same setter and zero-for-auto convention.
- [Linux interface documentation](https://cdn.kernel.org/doc/html/latest/wmi/devices/lenovo-wmi-other.html): `fanX_target` and fan reference limits.
- [Model-specific Toolkit investigation](https://github.com/LenovoLegionToolkit-Team/LenovoLegionToolkit/issues/449): the separate `0x04020000` full-speed switch and Legion fan-table methods fail on 83NY. That finding does not rule out the directly implemented RPM setter tested here.

The existing `fan_mode` was already 4 and `platform_profile` was already
`performance` during the test; neither setting was changed.

## Cooling-mode comparison (2026-11-05)

With the manual target removed, short 15–25 second tests under the existing
workload produced these observations:

| Setting | Measured RPM |
| --- | --- |
| `fan_mode=1` | 0 |
| `fan_mode=4` | 0 rising to about 2100 |
| `fan_mode=0` | About 2100 |
| `fan_mode=2` | About 2100 |
| `platform_profile=low-power`, fan mode 4 | About 2100; CPU 51–54 °C |
| `platform_profile=performance`, fan mode 4 | About 1950 |
| `powerprofilesctl set balanced`, fan mode 4 | Fell to 0 after the transition |
| Restored manual maximum target | About 4340 |

These are short observations, not fixed speeds for each profile: temperature,
workload, and firmware hysteresis vary throughout the sequence. No tested
cooling profile forced maximum fan RPM. Mode 2 did not produce an observable
high-speed cleaning cycle during its 15-second test.

`power-profiles-daemon` is active on this machine. A direct sysfs balanced
request read back as performance. Setting balanced through `powerprofilesctl`
successfully made both the daemon and firmware report balanced, so use that
interface for profile changes. The tests restored the daemon to performance,
fan mode to 4, and the manual maximum target afterward. Raw samples from the
first comparison are in `/tmp/power-a2z-fan-mode-results.json` (temporary).


## Dashboard control

Install or update with `sudo ./install-fan-control`, then open Fans & thermals
at http://powera2z.system. Select Auto or Manual, choose a target if manual,
and press Apply. Valid manual targets are 1500–5400 RPM in 100-RPM steps.
The command-line equivalent is `sudo ./motobook-fan-control manual 3500`.

The installed root helper publishes the last successful request atomically to
`/run/power-a2z/fan-control.json`. Its timestamp records the request, not a
confirmed hardware target. The existing fan sampler continues to report actual
RPM independently. No fan target is automatically reapplied at startup.

`power-a2z-fan-control.socket` accepts requests only from the configured desktop
user (sortedcord/UID 1000). Its root broker independently validates requests and
executes only the fixed installed helper with bounded arguments. The dashboard
uses same-origin JSON POST requests with a per-process request token; it never
runs sudo or writes the firmware interface itself. Other local web hostnames
must be explicitly added to `local_fan_request` in `dashboard/server.py`.
