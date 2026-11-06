# power_a2z

Fan RPM helper: see [FAN_MONITORING.md](FAN_MONITORING.md) for usage, dependencies,
and collector integration.

CPU power-limit research, the measured 70 W and 100 W trials, command history,
raw results, and the installed AC performance policy are documented in
[research/CPU_POWER_LIMITS.md](research/CPU_POWER_LIMITS.md).

User-level Linux telemetry collector. A systemd user timer runs `collect.py` every 10 seconds while the user systemd manager is running.

- `data/YYYY-MM-DD.jsonl`: one JSON object per sample, including AC/battery supply attributes, hwmon temperatures and fan RPM with sensor names/labels/limits, thermal-zone temperatures, Motobook firmware fan readings when the sampler is installed, CPU counters/load, process CPU and memory, GPU interfaces when available, focused Niri window/output, audio sinks/sources/player metadata and volume, brightness, USB/PCI/Bluetooth/input devices, and OLED image statistics. Keyboard and touchpad connection and recent-activity state are logged by a separate listener; it stores timestamps and booleans only, never event codes or typed content. The user must be in the `input` group for activity detection.
- `oled_screen_content`: image statistics from a temporary screenshot of the focused Niri output (dimensions and FFmpeg signalstats such as average/range luma and saturation). The image is deleted after analysis; only features are logged.

Sysfs readings are recorded as raw strings with kernel units (commonly micro-units); `sensors` output provides human-readable temperatures. Optional commands that are not installed or have no device return an error/empty result in the record rather than stopping collection.

On this Motobook, fan RPM requires the privileged sampler. Enable it once from this directory with `sudo ./install-fan-monitoring`; see [FAN_MONITORING.md](FAN_MONITORING.md). The existing user collector automatically reads its cache on subsequent runs, with no user-service changes. Temperatures and standard hwmon fans are collected without that sampler.

Useful commands:

```sh
systemctl --user status power-a2z.timer
journalctl --user -u power-a2z.service
systemctl --user stop power-a2z.timer
systemctl --user start power-a2z.timer
```

Data is retained until manually removed. Screenshots and process/activity data can grow over time and may contain sensitive on-screen or application information.

## Power and battery dashboard

On this machine, the dashboard starts automatically at login through the enabled
user service `power-a2z-dashboard.service`. Open **http://powera2z.system** in your
browser. The hostname maps to `127.0.0.1` in `/etc/hosts`; the enabled system
socket `power-a2z-web.socket` listens on loopback port 80 and starts systemd's
socket proxy on demand to forward requests to the dashboard on port 8765.
This address is local to this machine. The proxy exits after five idle minutes
and starts again when needed. The dashboard runs as your user and restarts on
failure; its permanent unit is enabled under the user manager's `default.target`.
Source unit files are in `systemd/`.

Control the dashboard with:

```sh
systemctl --user status power-a2z-dashboard.service
systemctl --user restart power-a2z-dashboard.service
systemctl --user stop power-a2z-dashboard.service
systemctl --user start power-a2z-dashboard.service
journalctl --user -u power-a2z-dashboard.service
```

To disable startup at login, use
`systemctl --user disable --now power-a2z-dashboard.service`. To disable the
local HTTP forwarding socket, use `sudo systemctl disable --now power-a2z-web.socket`
and `sudo systemctl stop power-a2z-web.service`.

For a manual launch from this directory (stop the managed dashboard first to
free port 8765):

```sh
python3 dashboard/server.py
```

Open **http://127.0.0.1:8765** in your browser. Python 3.10+ is sufficient; no packages or build step are required. From the parent workspace, use `python3 power_a2z/dashboard/server.py`.

The dashboard reads the existing JSONL logs and automatically refreshes every 10 seconds. It includes power and charge history, remaining-runtime or time-to-full estimates, battery capacity and cycle count, CPU temperature and utilization, memory usage, display brightness, power-source events, an accessible sample table, and CSV export. **Fans & thermals** shows fan RPM, CPU and hottest-sensor temperature histories, and individual sensor readings with hardware-reported high/critical limits and status. Fan history and CSV use the fastest available fan. Zero RPM means stopped; unavailable, failed, or stale readings remain missing. Older logs still show their recorded temperatures, with fan readings unavailable. Choose a recording date and a 1-hour, 6-hour, 24-hour, or full-recording window. Windows end at the latest sample, so older recordings remain explorable when collection is stopped.

**Live fan control** in Fans & thermals lets you choose Auto or Manual, then apply the setting. Manual targets range from 1,500 to 5,400 RPM in steps of 100, using a slider or numeric input. The requested setting and live measured speed are displayed separately; firmware behavior means they may differ. Controls affect the current fan even when viewing historical recordings. The setting is not automatically reapplied after reboot.

Install or update the control service with `sudo ./install-fan-control`. The dashboard stays unprivileged. A root-owned helper behind `power-a2z-fan-control.socket` validates the exact machine/BIOS and bounds every target. The socket is restricted to this machine's `sortedcord` account (UID 1000); the web API also requires a local connection, recognized hostname, matching origin and request token. Last successful helper requests are stored in `/run/power-a2z/fan-control.json`; this records requested mode/target, not hardware target readback. Check the service with `systemctl status power-a2z-fan-control.socket power-a2z-fan-control.service`.

**System power** reports CPU package and platform PSYS watts from Intel RAPL on both AC and battery power, with history charts, sample-table columns, and CSV fields (`cpu_package_w`, `platform_psys_w`, `power_window_seconds`). PSYS includes CPU power and its platform coverage depends on the hardware; do not add these overlapping values together or interpret PSYS as charger output or wall-socket consumption.

The read-only root sampler `power-a2z-power.timer` runs every 10 seconds and atomically publishes `/run/power-a2z/power.json` for the existing user collector. Install or update it with `sudo ./install-power-monitoring`. It calculates average watts from energy counter deltas and excludes duplicate MMIO and child domains. The first reading, reboot, suspend, a sampling gap over 60 seconds, or a counter reset produces missing values until the next valid interval. A counter rollover is handled when its endpoints are near the reported range boundary. Missing, invalid, or cached readings older than 30 seconds display as a dash. Raw sampler data is logged in `rapl_power`. Check the sampler with `systemctl status power-a2z-power.timer` and `journalctl -u power-a2z-power.service`.

Battery sessions group consecutive charging or discharging readings until a battery state or power-source change. The Sessions section shows complete, ongoing, and partial sessions intersecting the selected window, using the full recorded timeline so sessions can cross dates. Matching readings across collection gaps remain in one session, though changes during a gap cannot be observed. Duration includes elapsed time across gaps; energy and backlight-on estimates exclude gaps. Battery power is measured at the battery, and energy is integrated from adjacent readings. Backlight-on time is an estimate from brightness and `bl_power`; it can overestimate actual screen-on time, and unavailable readings are excluded.

Battery metrics use the first present system battery (peripheral batteries are excluded). Energy and power are converted from kernel micro-units; charge-based batteries use nominal voltage to estimate watt-hours. The power chart shows battery power magnitude during both charging and discharging, not total AC consumption. Health may exceed 100% for batteries with full capacity above the design rating. Energy discharged integrates consecutive discharging readings and excludes collection gaps longer than 60 seconds or three sample intervals. CPU usage is calculated from counter deltas and may be missing on the first sample or after counters reset. Missing sensors are shown as unavailable.

Only dashboard assets and normalized telemetry are served, not raw collector logs, process lists, window titles, or serial numbers. The server binds to loopback by default and remains local. It caches normalized samples in memory and reads only appended log data after the initial load; a partial final line is deferred until complete.

Optional arguments:

```sh
python3 dashboard/server.py --port 9000 --data-dir /path/to/logs
```

Stop with Ctrl+C. Run the data-conversion and API checks with:

```sh
python3 -m unittest discover -s dashboard/tests -v
```
