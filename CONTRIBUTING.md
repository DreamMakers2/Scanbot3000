# Contributing to ScanBot3000

Use this project-home repository for system-level documentation, compatibility metadata, architecture, hardware/wiring references, and cross-component issues. Make implementation changes in the component repository that owns the affected code.

## Where changes belong

- Embedded protocol, pins, motion, sensors: `ScanBot3000-firmware`.
- FastAPI, UART bridge, dashboard, REST/WebSocket behavior: `ScanBot3000-control`.
- Browser visualization, scan paths, point-cloud UI: `ScanBot3000-kinematics`.
- Cross-repository architecture, setup order, compatibility manifest: this repository.

## Contribution rules

1. Ground technical claims in code, configuration, documented hardware, or an explicitly tested setup.
2. Do not invent minimum requirements, compatibility, safety guarantees, or hardware specifications.
3. Update the project manifest only when the referenced component commits are intentionally known to work together.
4. Keep cross-repository links and terminology consistent.
5. Preserve component third-party notices and licenses.

## Public-data rules

Never commit credentials, API keys, tokens, Wi-Fi details, real private-network endpoints, hostnames, MAC addresses, personal email addresses, identifying filesystem paths, GPS/location data, serial numbers, private service names, machine logs containing private data, or local component clones. Use placeholders such as `<host>`, `<path>`, and `<serial-device>`.

## Review checklist

- [ ] The change belongs in this repository.
- [ ] Architecture/setup/requirements remain consistent across components.
- [ ] Manifest changes pin intentional, reviewable component commits.
- [ ] No environment-specific or sensitive data is included.
- [ ] Physical-motion language does not imply an unsupported safety guarantee.
