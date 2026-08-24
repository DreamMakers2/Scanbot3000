# Multi-Repository Development

## Ownership model

Keep changes in the repository that owns the behavior. This reduces accidental coupling and lets contributors work on browser, host, or firmware code independently.

- Firmware protocol/motion/pins/sensors → `ScanBot3000-firmware`.
- FastAPI/UART/dashboard/API validation → `ScanBot3000-control`.
- Three.js visualization/scan paths/browser integration → `ScanBot3000-kinematics`.
- System docs/compatibility/release coordination → `Scanbot3000`.

## Interface changes

A change to serial command syntax, axis semantics, API routes, telemetry fields, soft limits, or scan behavior may require synchronized documentation/code changes in more than one repository. Record the compatible component SHAs in `manifest.yaml` only after the combination is intentionally reviewed.

## Local layout

`scripts/clone-all.sh` creates:

```text
Scanbot3000/
├── components/
│   ├── ScanBot3000-firmware/
│   ├── ScanBot3000-control/
│   └── ScanBot3000-kinematics/
├── docs/
└── manifest.yaml
```

`components/` is ignored so nested working copies cannot accidentally become part of the home repository.

## Public-data hygiene

Keep host addresses, `.env`, serial-device overrides, local paths, logs, credentials, and real infrastructure outside version control. Examples should use `localhost`, `<host>`, and other clear placeholders unless a literal value is part of the project's generic protocol/configuration.
