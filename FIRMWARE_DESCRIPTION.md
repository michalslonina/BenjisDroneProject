# Firmware Description (What the Code Will Do)

## Overview

Two ESP32 boards run firmware that talk to each other via radio (nRF24L01 modules). This document describes what each one does **in plain English** — Benjamin will write the actual code.

---

## ESP32 TX (Transmitter) - Ground Station

### Purpose
**Reads Xbox controller input and sends it wirelessly to the drone.**

### What It Does

1. **Reads Xbox Controller**
   - Connects via USB to the ESP32
   - Reads stick positions (left/right, up/down)
   - Reads button states (if we add buttons later)
   - Gets values every ~20ms (50 times per second)

2. **Prepares the Data**
   - Takes 4 stick values (throttle, pitch, roll, yaw) from Xbox controller
   - **Scales them to limit aggressive motor response**
     - Raw range: 0-255 (full power)
     - Limited range: 0-200 (80% max power)
     - This tames the 1104 7200 KV aggressive motors
   - Converts to numbers the flight controller understands
   - Packs them into a small message (4 bytes per stick)
   - Example: Xbox `[255, 127, 127, 127]` → limited `[200, 127, 127, 127]`
   - Benjamin can adjust limit in code (200, 210, 220, etc.) for tuning

3. **Sends via Radio**
   - Uses nRF24L01 to broadcast the stick data
   - Sends ~50 times per second (matches controller read rate)
   - Uses 2.4 GHz frequency (same as WiFi but different channel)
   - Range: ~100 meters in open air

4. **Error Handling**
   - Checks if radio module is connected
   - Logs errors to serial monitor (for debugging)
   - Keeps trying to send even if some packets are lost (radio is robust)

---

## ESP32 RX (Receiver) - On the Drone

### Purpose
**Receives wireless stick commands and converts them to flight controller signals.**

### What It Does

1. **Listens for Radio Signals**
   - Waits for packets from transmitter
   - Receives stick data every ~20ms
   - Checks if signal is valid (no corruption)
   - Tracks how long it's been since last valid signal

2. **Safety/Failsafe**
   - **If signal is good:** Passes stick values to flight controller
   - **If no signal for >1 second:** **IMMEDIATELY CUTS THROTTLE**
     - This is the most important safety feature
     - Prevents runaway drone if radio link dies
     - All sticks go to neutral/center position

3. **Converts to Flight Controller Format**
   - Flight controller expects **SBUS protocol** (a serial format)
   - Takes stick values like `[127, 200, 50, 150]`
   - Converts to SBUS packet (25 bytes, specific format)
   - Sends via UART serial port to flight controller

4. **Status Monitoring**
   - Blinks LED: 
     - **Fast blink** = Good signal, all OK
     - **Slow blink** = Signal weak or intermittent
     - **Off** = No signal / Failsafe active
   - Sends debug info to serial monitor

5. **Signal Quality Tracking**
   - Counts successful packets received
   - Measures RSSI (signal strength)
   - Reports back to ground station if we add telemetry later

---

## What Each Component Does (Firmware Perspective)

### Xbox Controller
- **Input device** — sends button/stick states via USB
- **Read every 20ms** — consistent update rate
- **Provides:** Throttle (0-255), Pitch (-128 to +127), Roll (-128 to +127), Yaw (-128 to +127)

### nRF24L01 RF Module
- **Wireless transceiver** — sends/receives radio packets
- **2.4 GHz frequency** — same as WiFi
- **Reliable but not perfect** — some packets may be lost (OK because we send 50/sec)
- **TX power:** Programmable (can set 0mW to 25mW for testing, or max for range)

### ESP32 TX (Transmitter)
- **Main job:** Read controller → format → send via radio
- **Updates:** 50 times per second
- **Protocol:** Custom binary format (4 bytes per stick, plus header/footer)

### ESP32 RX (Receiver)
- **Main job:** Listen for radio → validate → convert to SBUS → send to FC
- **Timing:** Receives packets as they arrive (async)
- **Failsafe:** Cut throttle if no signal for 1000ms
- **Output:** SBUS serial data at 100,000 baud

### Flight Controller
- **Input:** SBUS signal from ESP32 RX
- **Processing:** Reads stick commands, runs gyro stabilization, calculates motor speeds
- **Output:** PWM signals to ESCs (already happens, firmware doesn't control this)
- **Assumption:** Uses standard Betaflight firmware (pre-loaded before drone assembly)

### ESCs (Motor Speed Controllers)
- **Input:** PWM signal from Flight Controller
- **Job:** Convert PWM signal to motor commutation
- **Output:** 3-phase power to brushless motor
- **Assumption:** ESCs are already flashed and calibrated

### Motors
- **Input:** 3-phase AC power from ESCs
- **Job:** Spin proportional to power level
- **Output:** Mechanical thrust
- **Assumption:** No firmware involved (just physics)

---

## Data Flow Diagram (Firmware Perspective)

```
GROUND STATION:
┌──────────────────────────────────────┐
│ Xbox Controller                       │
│ (stick values: 0-255)                 │
└─────────────┬────────────────────────┘
              │
              ↓ USB read (20ms)
┌──────────────────────────────────────┐
│ ESP32 TX Firmware                     │
│ - Read USB device                     │
│ - Pack stick values into 4 bytes      │
│ - Send via nRF24L01                   │
└─────────────┬────────────────────────┘
              │
              ↓ nRF24L01 transmission
        [  RADIO LINK  ]
              ↓
┌──────────────────────────────────────┐
│ nRF24L01 RX                           │
│ (receives 4 bytes)                    │
└─────────────┬────────────────────────┘
              │
              ↓ SPI read (async)
┌──────────────────────────────────────┐
│ ESP32 RX Firmware                     │
│ - Receive radio packet                │
│ - Check for failsafe (1s timeout)     │
│ - Convert to SBUS (25 byte format)    │
│ - Send to UART @ 100k baud            │
│ - Blink LED for status                │
└─────────────┬────────────────────────┘
              │
              ↓ UART serial (to FC)
┌──────────────────────────────────────┐
│ Flight Controller (Betaflight)        │
│ (reads SBUS, runs stabilization)      │
└─────────────┬────────────────────────┘
              │
              ↓ PWM outputs (4 channels)
      [  ESC 1  ESC 2  ESC 3  ESC 4  ]
              │     │     │     │
              ↓     ↓     ↓     ↓
        [ Motor x4 spinning ]
              │     │     │     │
              ↓     ↓     ↓     ↓
            🚁 DRONE FLIES
```

---

## Communication Protocols

### USB (Xbox → ESP32 TX)
- **Standard USB HID protocol**
- **Baud rate:** Not applicable (USB is faster)
- **Data:** Stick positions + buttons
- **Benjamin's job:** Use existing USB library to read controller

### nRF24L01 (ESP32 TX ↔ ESP32 RX)
- **Custom binary protocol** (4 bytes per update)
- **Frequency:** 2.4 GHz (programmable channel)
- **Speed:** 1 Mbps
- **Packets:** ~20 bytes each
- **Timing:** Send every 20ms
- **Benjamin's job:** Learn nRF24L01 library, set up SPI bus, send/receive packets

### SBUS (ESP32 RX → Flight Controller)
- **Industry standard** for RC receivers
- **Baud rate:** 100,000
- **Format:** 25 bytes per frame
- **Frame structure:** 
  - Header byte: 0x0F
  - 11-bit channel data (16 channels possible, we use 4)
  - Footer/sync bytes
- **Benjamin's job:** Format stick values into SBUS packets, send via UART

---

## Key Implementation Decisions

### Why SBUS?
- Standard protocol used by all Betaflight flight controllers
- Easy to implement once you understand the format
- Much more reliable than PWM (parallel channels)

### Why Custom RF Protocol?
- nRF24L01 doesn't care about data format
- Simple 4-byte stick format is fast and reliable
- Can easily add telemetry later (battery voltage, signal strength, etc.)

### Why 50 Hz (20ms) update rate?
- Standard for radio control systems
- Fast enough for smooth control
- Slow enough to not overload microcontroller or radio

### Why 1-second failsafe?
- Enough time to distinguish signal loss from temporary glitch
- Prevents rapid oscillations
- Standard in RC systems

---

## Testing the Firmware

Benjamin can test each part separately:

1. **Xbox Controller** — Read values, print to serial monitor
   - "Throttle: 127, Pitch: 200, Roll: 50, Yaw: 150"

2. **nRF24L01 TX** — Send packets, print "Sent OK" or "Failed"
   - Add counters: "Sent 1234 packets, 0 lost"

3. **nRF24L01 RX** — Receive packets, print received values
   - "RX: 127, 200, 50, 150" every 20ms

4. **SBUS Conversion** — Show SBUS bytes being sent
   - Print hex values: "0x0F 0xAA 0xBB 0xCC ..."

5. **Failsafe** — Disconnect radio, count down to failsafe trigger
   - "Signal OK" → "Lost 0.5s" → "Lost 1.0s" → "FAILSAFE"

---

## Debugging Tools

Benjamin will use these to debug when things don't work:

1. **Serial Monitor** (USB to computer)
   - Shows debug messages at 115,200 baud
   - Can see what firmware is doing every step

2. **LED Blink Patterns**
   - Visual feedback even without serial connection
   - Tells you if radio is working

3. **Oscilloscope** (optional, if Dad has one)
   - Can measure SBUS signal to see if format is correct
   - Can measure nRF24L01 SPI bus

4. **Test Flight Checklist**
   - Check each stick in Betaflight (configurator app)
   - Watch motor speeds on FC before propellers attached

