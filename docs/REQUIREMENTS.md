# ScanBot3000 Requirements

This document consolidates requirements that are directly evidenced by the three component repositories. Unknown minimums are intentionally left unknown rather than guessed.

## Verified project hardware configuration

### Control host

- **Raspberry Pi 4B**.
- **RAM in the recorded deployment:** 2 GB.
- **Primary serial interface:** `/dev/serial0` in the application defaults.
- **UART configuration:** 1,000,000 baud, 8 data bits, no parity, 1 stop bit, LF newline.
- **Networking:** a trusted local network for browser-to-control REST/WebSocket traffic.

No lower Raspberry Pi model, RAM minimum, storage minimum, Ethernet/Wi-Fi requirement, or exact OS release has been validated by the repository evidence.

### Motion supervisor

- **Teensy 4.1**.
- USB console at 115200 baud in firmware configuration.
- Serial8 mirror to the Raspberry Pi at 1,000,000 baud in the established setup.

### Axis controllers

- **ESP32-S3 DevKitC-1 class target** (`esp32-s3-devkitc-1` in PlatformIO).
- 16 MB flash configured by `platformio.ini`.
- PSRAM enabled by `platformio.ini`.
- Four logical physical axis roles: R, Z, X1, X2.
- TMC2209 stepper driver per axis controller.
- DS18B20 temperature probe and digital limit input.
- SSD1306 OLED and WS2812B/NeoPixel indication.
- AS5600 magnetic encoder on non-R axes.
- VL6180X time-of-flight range sensor on R.

Exact stepper motor models, supply voltage/current sizing, gearing, mechanical loads, travel dimensions, frame components, and full machine BOM are not established by this repository set.

## Browser / visualization requirements

- Browser capable of the checked-in static HTML/CSS/JavaScript application.
- WebGL support sufficient for Three.js `0.157.0` / `THREE.WebGLRenderer`.
- Network access to unpkg and Google Fonts unless those frontend resources are vendored locally.

No numeric browser CPU, RAM, storage, or GPU minimum is documented. A discrete GPU is not established as required.

## Development software

### Firmware

- Git.
- PlatformIO Core or PlatformIO IDE.
- Arduino framework through PlatformIO.
- ESP32-S3 platform: `espressif32 @ ^6.5.0`.
- Teensy PlatformIO platform/board: `teensy` / `teensy41`.

Library versions and names are maintained in `ScanBot3000-firmware/platformio.ini`.

### Control host

Existing setup documentation specifies **Python 3.10+**. Current dependency lower bounds are:

- `fastapi>=0.110`
- `uvicorn[standard]>=0.25`
- `pyserial>=3.5`
- `pydantic>=2.5`

The deployment uses a Linux/systemd-style environment. Debian-family package commands are documented, but the exact tested Raspberry Pi OS release is unknown. The optional port redirect uses `iptables`.

### Kinematics

No Node.js/npm build is required. The frontend is static HTML/CSS/JavaScript and currently loads Three.js `0.157.0` from unpkg. The example local server uses Python's `http.server`; that repository does not pin a Python version for this standalone use.

## Minimum requirements

The verified baseline above is the only reproducible hardware configuration supported by repository evidence. Lower CPU/RAM/flash/controller substitutions, different SBCs, alternative motor drivers, or sensor substitutions have not been qualified and are not claimed as minimum-compatible.

## Recommended requirements

No higher-spec SBC, GPU, controller, motor, storage, or power configuration has sufficient repository evidence to be called a formal recommendation. Use the verified boards for reproduction and explicitly test/document alternatives.
