# ScanBot3000 Architecture

```mermaid
%%{init: {"theme":"base","themeVariables":{"fontFamily":"Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, Segoe UI, sans-serif","primaryTextColor":"#0f172a","lineColor":"#64748b","tertiaryColor":"#f8fafc"}}}%%
flowchart LR
    subgraph OP["01 · Operator layer"]
        direction TB
        UI["ScanBot3000 Kinematics<br/>Static HTML / CSS / JS<br/>Three.js 0.157.0<br/>scan paths · point cloud"]
    end

    subgraph HOST["02 · Control host"]
        direction TB
        PI["Raspberry Pi 4B<br/>ScanBot3000-control<br/>FastAPI + Uvicorn<br/>REST · WebSocket · pyserial"]
    end

    subgraph SUP["03 · Motion supervisor"]
        direction TB
        TEENSY["Teensy 4.1<br/>homing · coordination · soft limits<br/>telemetry aggregation<br/>USB + Pi console mirror"]
    end

    subgraph AXES["04 · Distributed axes"]
        direction TB
        R["R axis · ESP32-S3<br/>TMC2209 · DS18B20 · limit input<br/>VL6180X ranging · NeoPixel"]
        Z["Z axis · ESP32-S3<br/>TMC2209 · DS18B20 · limit input<br/>AS5600 encoder"]
        X1["X1 axis · ESP32-S3<br/>TMC2209 · DS18B20 · limit input<br/>AS5600 · virtual X / P pair"]
        X2["X2 axis · ESP32-S3<br/>TMC2209 · DS18B20 · limit input<br/>AS5600 · virtual X / P pair"]
    end

    UI <-->|"REST · WebSocket"| PI
    PI <-->|"UART · 1,000,000 baud"| TEENSY
    TEENSY <-->|"framed UART"| R
    TEENSY <-->|"framed UART"| Z
    TEENSY <-->|"framed UART"| X1
    TEENSY <-->|"framed UART"| X2

    TRUST["Trust & safety boundary<br/>Control API is intentionally unauthenticated<br/>and intended only for a trusted local network.<br/>Physical limits and emergency stop remain machine responsibilities."]
    PI -. "privileged machine-control access" .-> TRUST

    classDef operator fill:#eff6ff,stroke:#60a5fa,stroke-width:1.5px,color:#0f172a;
    classDef host fill:#ecfdf5,stroke:#34d399,stroke-width:1.5px,color:#0f172a;
    classDef supervisor fill:#f5f3ff,stroke:#8b5cf6,stroke-width:1.5px,color:#0f172a;
    classDef axis fill:#fffbeb,stroke:#f59e0b,stroke-width:1.25px,color:#0f172a;
    classDef boundary fill:#0f172a,stroke:#334155,stroke-width:1.5px,color:#e2e8f0;

    class UI operator;
    class PI host;
    class TEENSY supervisor;
    class R,Z,X1,X2 axis;
    class TRUST boundary;

    style OP fill:#f8fafc,stroke:#cbd5e1,stroke-width:1px
    style HOST fill:#f8fafc,stroke:#cbd5e1,stroke-width:1px
    style SUP fill:#f8fafc,stroke:#cbd5e1,stroke-width:1px
    style AXES fill:#f8fafc,stroke:#cbd5e1,stroke-width:1px
    linkStyle default stroke:#64748b,stroke-width:1.5px;
```

## Repository boundaries

ScanBot3000 uses separate repositories because the three implementation layers have different runtimes, deployment environments, dependencies, and contribution surfaces.

### `ScanBot3000-kinematics`

Static Three.js browser client for 3D kinematics, scan-path UI, control widgets, and range-point visualization. It can operate in visualization-only mode without hardware.

### `ScanBot3000-control`

FastAPI application for the Raspberry Pi. It owns HTTP/WebSocket transport, dashboard serving, UART reconnect behavior, bounded telemetry buffers, runtime settings, and helpers that translate web operations to Teensy console commands.

### `ScanBot3000-firmware`

Embedded PlatformIO project for the Teensy 4.1 supervisor and ESP32-S3 axis nodes. It owns homing, coordinated motion, telemetry, driver control, sensors, local displays/LEDs, and serial protocols.

## Data flow

1. The operator opens the static kinematics client or the built-in control dashboard.
2. Browser requests reach `ScanBot3000-control` over REST/WebSocket on the trusted LAN.
3. The control service bridges requests and console telemetry over the Raspberry Pi primary UART (`/dev/serial0` in the recorded deployment) at 1,000,000 baud.
4. The Teensy 4.1 supervises motion and exchanges framed serial data with ESP32-S3 axis controllers.
5. R/Z/X1/X2 telemetry returns through the same path to the browser.

## Motion model

The firmware exposes physical axes `R`, `Z`, `X1`, and `X2`. The Teensy also derives virtual coordinated `X` and `P` coordinates from the X1/X2 pair. X/Z/P coordinated absolute targets require homing and are constrained by firmware soft limits; R is separately controlled.

## Trust boundaries

The current FastAPI service is unauthenticated. CORS is restricted to common local origins in code, but CORS is not authorization. Network access to the control API is therefore privileged machine-control access.

Mechanical safety, supply protection, independent emergency-stop design, and safe physical clearances are machine-level responsibilities outside these repositories.
