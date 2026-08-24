# AI / Agent Prompting

These patterns are intended to keep AI-assisted work grounded in repository evidence and free of private environment data.

## Cross-repository architecture review

```text
Review this ScanBot3000 change across firmware, control, and kinematics. Identify the owning repository, affected serial/API contracts, hardware assumptions, safety implications, and documentation that must stay synchronized. Use only code/configuration and documented tested hardware as evidence. Mark unknowns explicitly instead of guessing.
```

## Public-release audit

```text
Audit the ScanBot3000 repository for public release. Check current files and retained Git refs for credentials, tokens, real IP/DNS/hostnames, MAC addresses, personal email/user/path data, GPS/location data, machine-specific configuration, logs, generated files, and stale project names. Distinguish generic placeholders/RFC1918 code patterns from actual environment identifiers.
```

## Requirements documentation

```text
Build a requirements document from the repositories. Separate exact verified hardware from minimum and recommended requirements. Do not infer numeric CPU/RAM/storage/GPU/power/motor requirements unless repository or test evidence supports them. State unknowns plainly.
```

## Interface consistency

```text
Compare ScanBot3000 firmware console commands, control-server REST/WebSocket behavior, and kinematics client calls. Report mismatches in command names, units, axis identifiers, limits, endpoints, telemetry fields, or assumptions. Do not invent compatibility.
```

Before using any AI system, remove real credentials, private infrastructure, personal identifiers, and sensitive logs from supplied context.
