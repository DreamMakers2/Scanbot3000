# Hardware Overview

This page describes hardware that is explicitly represented in firmware/control configuration. It is not a complete mechanical/electrical BOM.

## Controller hierarchy

| Layer | Verified hardware | Role |
| --- | --- | --- |
| Host | Raspberry Pi 4B (2 GB recorded deployment) | FastAPI/UI host and UART bridge |
| Supervisor | Teensy 4.1 | Homing, coordination, console, telemetry aggregation |
| Axis node | ESP32-S3 DevKitC-1 class target | Per-axis driver, sensor, and local UI control |
| Motor driver | TMC2209 | Stepper drive/configuration |

## Axis-node peripherals

Firmware evidence includes:

- DS18B20 temperature sensing.
- Digital limit switch input.
- SSD1306 OLED.
- WS2812B/NeoPixel indicators.
- AS5600 magnetic encoder on non-R axes.
- VL6180X time-of-flight sensor on R.

The R node repurposes the encoder-side role for VL6180X ranging and a dedicated NeoPixel activity indicator.

## Unknown / machine-specific hardware

The repositories do not define a complete public BOM for:

- stepper motor make/model and electrical rating;
- motor power-supply specification;
- mechanical frame, bearings, rails, transmission, gearing, or couplers;
- cable gauges/connectors and enclosure;
- independent emergency-stop components;
- travel dimensions and physical clearance envelope.

Do not infer those values from firmware soft limits or the 3D visualization. Document them separately when they are verified and intended for publication.
