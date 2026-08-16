# Quick Start Guide - FPV Drone Project

Welcome! This guide helps you get started with Benjamin's drone project. Read this first, then follow the detailed docs.

---

## What Are We Building?

A **wireless 3D-printed FPV drone** that Benjamin controls with an Xbox controller. The drone sends back a live camera feed so he can see what it sees.

**Key components:**
- 3D-printed frame (you'll print this)
- Brushless motors + ESCs (you'll solder)
- Flight controller (pre-programmed)
- Custom wireless receiver/transmitter (Benjamin will code this)
- FPV camera + video transmitter
- 3S LiPo battery

---

## What Benjamin Will Learn

✅ **Programming (C/C++)** — Write ESP32 firmware  
✅ **Wireless comms** — How RF modules talk  
✅ **Electronics** — Soldering, wiring, power distribution  
✅ **Mechanics** — 3D design, assembly, troubleshooting  
✅ **Embedded systems** — Microcontroller real-time control  
✅ **Flying** — FPV piloting and drone stability  

---

## Timeline Overview

```
Week 1:    Order parts → Start 3D printing
Week 2-3:  Parts arrive → Continue printing + assembly prep
Week 4-5:  Final assembly → Wiring + electronics
Week 5-6:  Benjamin writes firmware → Testing & tuning
Week 6+:   First flights! 🚁
```

---

## Quick Read Order

**For Dad (setup):**
1. [BOM.md](BOM.md) — What to buy (~€100)
2. [SOURCING_GUIDE.md](SOURCING_GUIDE.md) — Where to buy it
3. [FRAME_SELECTION.md](FRAME_SELECTION.md) — Which 3D model to print

**For Benjamin (learning):**
1. [docs/FOR_BENJAMIN.md](docs/FOR_BENJAMIN.md) — Your project overview
2. [SYSTEM_DIAGRAM.md](SYSTEM_DIAGRAM.md) — How everything connects
3. [SYSTEM_ARCHITECTURE.md](SYSTEM_ARCHITECTURE.md) — Deep dive into each part

**For Assembly (both):**
1. [docs/ASSEMBLY_GUIDE.md](docs/ASSEMBLY_GUIDE.md) — Step-by-step assembly
2. [FIRMWARE_DESCRIPTION.md](FIRMWARE_DESCRIPTION.md) — What Benjamin's code will do

**For First Flight:**
1. [docs/TESTING_CHECKLIST.md](docs/TESTING_CHECKLIST.md) — Pre-flight tests

---

## The Next 3 Actions (Start Today)

### Action 1: Order Components (This Week)

**Go to [SOURCING_GUIDE.md](SOURCING_GUIDE.md) and order:**

- [ ] **AliExpress items** (20-30 day delivery)
  - nRF24L01 RF modules (2x)
  - Brushless motors (4x)
  - ESCs (4x)
  - Flight controller
  - Camera + VTx
  - Video receiver
  - Connectors + wire
  - **Total:** ~€80-100

- [ ] **Local hobby shop items** (5-10 day delivery)
  - 3S LiPo battery
  - Battery charger
  - Propellers
  - **Total:** ~€30-40

### Action 2: Start 3D Printing (This Week)

**From [FRAME_SELECTION.md](FRAME_SELECTION.md):**

- [ ] Find an open-source 5" quad frame on Printables/Thingiverse
- [ ] Download STL files
- [ ] Prepare print settings for Ender 5 Plus
- [ ] Start printing frame parts in parallel on all 3 printers
- [ ] Target: Have frame ready by week 3

### Action 3: Study the System (This Week)

**For Benjamin:**
- [ ] Read [docs/FOR_BENJAMIN.md](docs/FOR_BENJAMIN.md) (15 min)
- [ ] Look at [SYSTEM_DIAGRAM.md](SYSTEM_DIAGRAM.md) (20 min)
- [ ] Understand what each part does

**For Dad:**
- [ ] Read [SYSTEM_ARCHITECTURE.md](SYSTEM_ARCHITECTURE.md) (30 min)
- [ ] Understand the data flow
- [ ] Plan assembly steps

---

## Budget Breakdown

| Category | Cost | Notes |
|----------|------|-------|
| **Electronics** | ~€100 | Motors, ESCs, FC, camera, VTx, receiver |
| **Filament** | ~€20-30 | For 3D printing frame (you have) |
| **Charger** | ~€10-15 | If you don't have one |
| **Misc** | ~€10-15 | Connectors, solder, hot glue |
| | | |
| **TOTAL** | ~€150-160 | Can reduce to €100-120 with discounts |

---

## Tools You'll Need

**Soldering:**
- 30-40W soldering iron ✓
- Solder (lead-free or regular) ✓
- Helping hands tool ✓
- Wet sponge (for iron cleaning) ✓

**Mechanical:**
- Screwdrivers (0.5mm, 1.5mm, 2.5mm) ✓
- Flush cutters ✓
- Hot glue gun ✓
- Super glue (cyanoacrylate) ✓
- Sandpaper (120/220/400 grit) ✓

**Electrical:**
- Multimeter ✓
- USB cables ✓
- Servo extension cables ✓

**Software:**
- Arduino IDE (free) — for programming ESP32
- Betaflight Configurator (free) — for FC setup
- FPV app on old phone — for goggles

---

## Key Concepts for Benjamin

### What is FPV?
**FPV = First Person View**  
You see from the drone's perspective, like you're riding on it!

### How does control work?
```
You move Xbox sticks → Radio signal → Drone receives → Motors spin → Drone flies
```

### What's the WiFi module?
The **nRF24L01** is like a tiny radio tower.  
It sends your stick commands wirelessly to the drone. Same frequency as WiFi but different.

### Why two ESP32s?
- **One on ground** (with Xbox controller) — Transmitter
- **One on drone** — Receiver
- They talk to each other via radio

### What is the Flight Controller?
The **drone's brain**.  
It reads your commands and automatically balances the drone using gyro sensors.

---

## Safety First!

⚠️ **Rules for flying:**
1. Never fly near people or animals
2. Always remove propellers when testing
3. Check battery voltage before flying
4. Let propellers cool between flights
5. Wear eye protection (just in case!)
6. Have a safe open area (park, large field)
7. Never point drone at faces
8. Always do preflight checks

---

## If Something Goes Wrong

**Don't panic!** Troubleshooting is part of learning.

| Problem | Likely Cause | Solution |
|---------|--------------|----------|
| Won't power on | Low battery | Charge battery |
| Radio won't connect | nRF24 not working | Check SPI wires, power |
| Motors won't spin | Soldering problem | Check solder joints |
| Gyro reading wrong | FC oriented wrong | Rotate FC in software |
| Drone crashes | Prop came off | Tighten propellers |

**When stuck:**
1. Check the relevant troubleshooting section
2. Use multimeter to test connections
3. Ask Dad for help
4. Worst case: Start over (you have spare parts!)

---

## Next Steps (Right Now)

1. **Read this file completely** (you're doing it!)
2. **Open [SOURCING_GUIDE.md](SOURCING_GUIDE.md)** and order parts
3. **Open [FRAME_SELECTION.md](FRAME_SELECTION.md)** and start 3D printing
4. **Create a reminder** to check AliExpress order status
5. **Show Benjamin** [docs/FOR_BENJAMIN.md](docs/FOR_BENJAMIN.md) this weekend

---

## Success Metrics

By the end of this project, Benjamin will have:

✅ Soldered and assembled a complete FPV drone  
✅ Written firmware to control it wirelessly  
✅ Flown it successfully indoors and/or outdoors  
✅ Fixed bugs when things didn't work  
✅ Understood how drones really work (not just "it flies")  
✅ Built something truly cool with his dad! 🚀

---

## Contact & Help

When you get stuck:
- YouTube search for specific component (e.g., "nRF24L01 Arduino tutorial")
- Check [docs/TESTING_CHECKLIST.md](docs/TESTING_CHECKLIST.md) for troubleshooting
- Ask in FPV community forums (DIYDrones, RCGroups)
- Reach out to local maker/hobby communities

---

## You're Ready!

You have everything you need to build this drone. The hardest part is starting.

**Let's build something awesome!** 🚁✨

Start with [SOURCING_GUIDE.md](SOURCING_GUIDE.md) — Order parts now, everything else flows from there.

