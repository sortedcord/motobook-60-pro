# Evidence bundle

Start with [the research report](../CPU_POWER_LIMITS.md) and
[the command ledger](COMMANDS.md).

- `original.json`: pre-intervention sysfs and selected MSR snapshot.
- `summary.csv`: all measured stages, with the sampling interval explicit.
- Per-stage JSON: samples, before/after limits, temperatures, reasons and results.
- `final-100w-attempt.json`: first 100 W attempt with software cutoff.
- `final-100w-no-software-cutoff.json`: user-requested rerun; 102.01 W peak.
- `final-state.json`: final hardware/service state and no remaining stress workers.
- `installed-policy-checks.json`: final successful operational verification.
- `installed-policy-*-check-failed.log`: retained failed checks and their context.
- `scripts/`: retained stress sources and trial/orchestration programs.
- `prior/`: earlier CPU0 cap, 60-second stress, current-limit and fan-mode evidence.
- `firmware/`: relevant decompiled tables read from this BIOS.
- `installed/`: archived installed power-policy source, installer and unit.
- `logs/`: saved trial stdout and final verification output.
- `SHA256SUMS`: hashes for all evidence files except the manifest itself.

Scripts are machine-specific research artifacts with absolute paths. Read the
report before reproducing mutations. No complete shell-session transcript was
recorded; exact saved scripts and reconstructed-equivalent snippets are labelled.
