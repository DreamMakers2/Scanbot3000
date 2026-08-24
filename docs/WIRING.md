# Wiring References

Only wiring explicitly supported by the repository documentation is summarized here. Always cross-check the firmware pin map before building hardware.

## Raspberry Pi ↔ Teensy UART mirror

The recorded control deployment uses:

- Raspberry Pi GPIO14 / TXD → Teensy pin 34 / RX8.
- Raspberry Pi GPIO15 / RXD ← Teensy pin 35 / TX8.
- Common ground.
- 1,000,000 baud, 8N1, LF newline in the application configuration.

The Raspberry Pi application refers to the primary UART as `/dev/serial0`.

## Teensy ↔ ESP32-S3 axis links

Firmware implements high-speed framed UART links between the Teensy supervisor and the ESP32-S3 axis controllers. Exact Teensy per-axis port assignments and ESP32 pin definitions should be taken directly from the current firmware source rather than copied from this overview.

## ESP32-S3 axis wiring

The authoritative public pin definitions are in:

```text
ScanBot3000-firmware/src/esp32s3_Anna/anna_pins.h
```

The current firmware README highlights GPIO assignments for the TMC2209, DS18B20, limit input, OLED/encoder buses, LEDs, and R-axis VL6180X behavior. Use that file as the implementation source of truth.

## What is not specified

Power distribution, motor supply wiring, wire gauge, connector ratings, grounding topology beyond the serial common ground, fusing, emergency-stop wiring, and enclosure wiring are not sufficiently specified in these repositories and are not invented here.
