# FPV Drone System Architecture

## System Overview

This is a **wireless remote-controlled drone** where Benjamin controls it with an Xbox controller, and sees what the drone sees through FPV goggles on a phone.

### Block Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                         GROUND (You & Benjamin)              │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌──────────────┐         ┌─────────────┐                   │
│  │ Xbox         │         │ Old Phone   │                   │
│  │ Controller   │         │ (FPV        │                   │
│  │              │         │  Goggles)   │                   │
│  └──────┬───────┘         └──────▲──────┘                   │
│         │                        │                           │
│         │ USB Cable              │ WiFi/USB receiver         │
│         │                        │                           │
│  ┌──────▼──────────────────────────┐                        │
│  │    ESP32 TX                      │                        │
│  │  (Transmitter)                   │                        │
│  │  - Reads Xbox input              │                        │
│  │  - Sends stick data wirelessly   │                        │
│  └──────┬───────────────────────────┘                        │
│         │                                                     │
│         │ RF Signal (2.4GHz, ~100m range)                   │
│         │                                                     │
└─────────┼─────────────────────────────────────────────────────┘
          │
          │ (WIRELESS LINK)
          │
┌─────────▼─────────────────────────────────────────────────────┐
│                         DRONE (In the sky)                     │
├───────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────────┐         ┌─────────────────────┐         │
│  │ RF Module RX     │         │ FPV Camera + VTx    │         │
│  │ (Receiver)       │         │ (Video sender)      │         │
│  │ - Gets stick     │         │ - Sends video to    │         │
│  │   commands       │         │   phone goggles     │         │
│  └────────┬─────────┘         └─────────────────────┘         │
│           │                                                     │
│  ┌────────▼──────────────────┐                                │
│  │    ESP32 RX               │                                │
│  │  (Receiver)               │                                │
│  │  - Gets wireless commands │                                │
│  │  - Converts to FC signals │                                │
│  └────────┬──────────────────┘                                │
│           │                                                     │
│           │ SBUS Signal (serial signal)                       │
│           │                                                     │
│  ┌────────▼──────────────────┐                                │
│  │  Flight Controller (FC)    │                                │
│  │  - Reads stick commands    │                                │
│  │  - Controls motors         │                                │
│  │  - Stabilizes drone        │                                │
│  └────────┬──────────────────┘                                │
│           │                                                     │
│      ┌────┴────┬────────┬────────┐                            │
│      │          │        │        │                            │
│  ┌───▼──┐ ┌───▼──┐ ┌───▼──┐ ┌───▼──┐                        │
│  │Motor1│ │Motor2│ │Motor3│ │Motor4│                        │
│  └──────┘ └──────┘ └──────┘ └──────┘                        │
│     (ESCs drive each motor)                                   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Data Flow

1. **Control Input** → Benjamin pushes Xbox sticks
2. **Wireless TX** → ESP32 sends stick positions via RF
3. **Wireless RX** → ESP32 on drone receives commands
4. **Flight Control** → Commands converted to motor speeds
5. **Video Output** → Camera sends video to phone (separate)

## Key Points for Benjamin

- **Two ESP32s talk to each other** using radio waves (2.4GHz)
- **Flight Controller** is like the drone's brain — it keeps everything balanced
- **Motors spin based on FC commands** — faster = drone goes up
- **Phone shows FPV camera view** — you see what the drone sees

## Safety Levels

```
Level 1: Sticks centered = Motors off (SAFE)
Level 2: Signal lost > 1 second = Motors stop (SAFE)
Level 3: Battery low = Soft landing procedure (SAFE)
```

