# Full-Stack Setup

This guide assembles the repository-supported ScanBot3000 stack without inventing mechanical or electrical specifications that are not recorded.

## 1. Clone the repositories

```bash
git clone https://github.com/DreamMakers2/Scanbot3000.git
cd Scanbot3000
./scripts/clone-all.sh
```

The component clones are placed under `components/`, which this repository ignores. If a component is still private during review, GitHub authentication is required until its owner changes visibility.

For an exact reproduction of this initial baseline, check out the commit SHAs in `manifest.yaml` inside each component. For active development, stay on each component's `main` branch.

## 2. Review hardware and safety information

Read:

- `docs/REQUIREMENTS.md`
- `docs/HARDWARE.md`
- `docs/WIRING.md`
- `SECURITY.md`

The repositories do not establish motor models, complete power design, mechanical BOM, or certified safety architecture. Resolve those machine-specific requirements before applying motion power.

## 3. Build the firmware

```bash
cd components/ScanBot3000-firmware
pio run -e esp32s3_Anna
pio run -e teensy41_Beata
```

Follow that repository's `docs/SETUP.md` for upload and first-console validation. The public-ready PlatformIO configuration replaced a missing machine-local VL6180X dependency with the registry package; the firmware checklist explicitly requires physical R-axis revalidation before calling this a production baseline.

## 4. Configure the Raspberry Pi control host

The recorded host is a Raspberry Pi 4B with 2 GB RAM. Follow `components/ScanBot3000-control/docs/SETUP.md` to:

1. Enable the primary UART.
2. Connect Pi TX/RX and ground to Teensy Serial8 using the documented pins.
3. Create a Python virtual environment and install `requirements.txt`.
4. Copy `.env.example` to `.env` and keep it local/untracked.
5. Start Uvicorn on the trusted LAN.

Before motion, confirm the API can receive telemetry and successfully request `pos` and `coordstatus`.

## 5. Serve the kinematics client

```bash
cd components/ScanBot3000-kinematics/webapp
python -m http.server 8000
```

Open `http://localhost:8000/index.html` for standalone visualization, or provide the control endpoint at runtime:

```text
http://localhost:8000/index.html?api=http://<host>:8001/api
```

Do not commit the real host value.

## 6. Validate the integrated machine

Before normal operation:

1. Verify axis identities and motor directions.
2. Verify each relevant limit input.
3. Compare telemetry/readouts with the physical machine.
4. Validate Z homing and coordinated state.
5. Exercise stop behavior using low-risk test motion.
6. Use kinematics dry-run behavior before physical scan paths.
7. Keep clearances and independent emergency-stop access available.

## 7. Optional deployment

The control repository provides a generic systemd unit template and optional Linux `iptables` port redirect. Neither adds authentication. Edit deployment-specific user/path values locally and do not commit them.
