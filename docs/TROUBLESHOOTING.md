# Full-Stack Troubleshooting

Use the component-specific troubleshooting guides for details. This page helps identify which layer owns a failure.

## Kinematics page works but hardware is offline

Check `ScanBot3000-control` first. Confirm its API is reachable from the browser, then verify the Pi can open `/dev/serial0` and receives Teensy telemetry. Standalone visualization is expected to work without the backend.

## Control dashboard loads but there is no telemetry

Verify Teensy power/firmware, the Pi UART configuration, common ground, and 1,000,000 baud settings. Use the Teensy USB console to separate embedded/link problems from the FastAPI layer.

## Axis links are missing or unstable

Check the firmware-side framed UART links and physical wiring. Project history includes link-timeout tuning, so fix wiring/baud/ground issues before simply increasing timeouts.

## `moveabs` is rejected

The control server validates the documented X/Z/P ranges, and the firmware additionally requires valid homing for X/Z/P. Query `coordstatus` and `pos`, then inspect any reported firmware error before changing limits.

## Range data is missing

R-axis ranging uses the VL6180X path. The firmware's public-ready dependency changed from a missing machine-local library reference to the PlatformIO registry package, so physical R-axis behavior is an explicit revalidation item in the firmware release checklist.

## Browser CORS error with a custom domain

The current control service permits localhost and common private-address origins, not arbitrary DNS names. Do not broadly open CORS as a substitute for an authenticated remote-access design.
