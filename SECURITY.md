# Security Policy

## System security model

ScanBot3000 spans a browser, a local FastAPI service, a Raspberry Pi serial interface, and embedded motor controllers. The current `ScanBot3000-control` API does not implement application-layer authentication. A caller with access to that service can submit commands that may cause physical movement.

Keep the control plane on a trusted, segmented local network. Do not expose the FastAPI port directly to the public internet. If remote access is required, place an authenticated VPN, reverse proxy, access gateway, or equivalent control in front of it and apply least-privilege network policy.

## Physical safety

Software stop controls, soft limits, homing state, and the visualization are not represented as certified safety functions. Verify motor direction, wiring, limit behavior, travel, clearances, and emergency-stop provisions on the actual machine before normal operation.

## Sensitive information

Do not publish `.env` files, credentials, access tokens, private addresses/hostnames, Wi-Fi details, MAC addresses, device serials, personal data, identifying paths, private logs, or infrastructure configuration. Redact those values before sharing diagnostics.

## Reporting a vulnerability

Use GitHub private vulnerability reporting / Security Advisories on the relevant component repository when available. If the issue spans components, report it privately to the repository owner through GitHub and identify the affected repositories without publishing exploit details.
