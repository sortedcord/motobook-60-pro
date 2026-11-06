# Motobook 83NY fan identification — 2026-11-05

Lenovo's public parts service was queried through its normal parts-lookup
read endpoints, using machine types 83NY, 83NC, and 83JK. The normalized,
non-personal results are saved in `lenovo-fan-parts.json`.

83NY (this Motobook) and 83NC (IdeaPad Slim 5 14IAH10) return identical fan FRUs:

- 5F10S14203: HY variant; Lenovo's part photo shows BN9507S5H-001P,
  DC 5 V, 0.5 A.
- 5F10S14204: FCN variant. No rated speed appears on the inspected labels.
- 5F10S14427: DWPH variant; Lenovo's part photo shows EFH-09005H-CP01,
  DC 5.0 V, 0.8 A.

83JK (IdeaPad Pro 5 14IAH10) instead returns 5F10S14230 (PK) and
5F10S14231 (AVC) thermal modules. A shared 14IAH10 name is not enough
to establish shared cooling hardware.

The machine's as-built lookup returned entries for both 5F10S14203
and 5F10S14427. This does not conclusively identify the physical supplier
installed in the unit; the firmware reports one fan. No machine serial
or barcode is stored here.

No publicly available manufacturer RPM specification was located for the
identified fan model codes. Lenovo's parts metadata has `specs: null` for
these fans and the inspected labels do not state RPM. The electrical
ratings cannot establish maximum speed. The firmware's 5400-RPM fan-test
reference and the observed ~4340 RPM remain distinct from a verified
manufacturer rating.

Sources:

- https://support.lenovo.com/partslookup
- Read endpoint: POST https://pcsupport.lenovo.com/us/en/api/v4/upsellAggregation/parts/compatible with mtId (machine type); no purchase or account mutation.
- https://support.lenovo.com/vg/en/solutions/HT517297 (Slim 5 machine-type identification)
- https://download.lenovo.com/Images/Parts/5F10S14203/1.jpg
- https://download.lenovo.com/Images/Parts/5F10S14204/5F10S14204_B.jpg
- https://download.lenovo.com/Images/Parts/5F10S14427/5F10S14427_B.jpg
