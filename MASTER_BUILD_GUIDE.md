# Master Build Guide - Benjamin's Sub-250g FPV Drone

**Project:** Custom wireless FPV drone for Benjamin (age 9)  
**Target weight:** Under 250g with full FPV camera  
**Budget:** €65-100  
**Timeline:** 6-8 weeks  
**Repository:** https://github.com/michalslonina/BenjisDroneProject

---

## Executive Summary

You will build a **3-inch FPV drone that weighs 200-250g** with:
- ✅ Full FPV camera (live video feed)
- ✅ Wireless Xbox controller
- ✅ Custom Benjamin-written firmware
- ✅ Educational value (embedded systems, wireless, flight dynamics)
- ✅ Fun to fly (agile, responsive, indoors/outdoors)

**Key components:**
- GoFlyPro 3" frame (38g, 3D-printed)
- 1105 5000 KV motors (8g each)
- 12A ESCs (7g each)
- F3/F4 flight controller (8g)
- Caddx Baby Ratel camera (18g)
- 25mW VTx (10g)
- 2S 450mAh LiPo battery (60g)

---

## Complete Parts List (Exact Specs)

### FRAME (3D Printed)
- **Part:** GoFlyPro 3-inch FPV Drone Frame
- **Download:** https://www.printables.com/model/733870-goflypro-fpv-drone-frame-3-35-and-4-inch-sub-250g
- **Print material:** PETG (PLA works but less durable)
- **Infill:** 12-15%
- **Print time:** ~20-25 hours total
- **Weight:** 38g
- **Cost:** €0 (you print it) + ~€5-8 filament
- **Notes:** Print main chassis, arms, camera mount, battery strap

---

### MOTORS (4x Required)
**Part:** 1104 7200 KV Brushless Motor (with software input limiting)

| Spec | Value |
|------|-------|
| Size | 1104 |
| KV | 7200 |
| Weight per motor | ~7-7.5g |
| Total (4x) | 28g |
| Voltage | 2S LiPo (7.4V) |
| Current draw (max) | ~7-8A per motor |
| Shaft | 2mm |
| Connector | 2mm banana or solder |
| RPM on 2S | 53,280 (will be limited in firmware) |

**Where to buy:**
- AliExpress: Search "1104 7200KV brushless motor"
- Price: €2-4 per motor (€8-16 for 4)
- Alternative brands: Eachine, DYS, Happymodel

**Why 1104 7200 KV + Software Limiting:**
- Saves 4g weight (28g vs 32g with 1105)
- Benjamin learns input scaling in firmware
- Software maps stick input to 0-200 range (instead of 0-255)
- Firmware tames aggressive motor behavior
- Educational: Shows how to compensate in software
- New total weight: 237g (13g margin under 250g)
- Can be tuned/adjusted in code anytime
- Proven approach for lightweight quads

---

### ESCs (4x Required)
**Part:** 12A Brushless ESC (Aluminum PCB)

| Spec | Value |
|------|--------|
| Rated current | 12A continuous |
| Burst current | 15-20A |
| Weight per ESC | ~7g |
| Total (4x) | 28g |
| Firmware | BLHeli compatible (standard) |
| Input voltage | 2S LiPo (5.5V - 8.4V) |
| Connector | XT30 or solder |
| BEC | 5V regulated output |

**Where to buy:**
- AliExpress: Search "12A ESC brushless blheli"
- Price: €2-4 per ESC (€8-16 for 4)
- Brands: Eachine, Racerstar, DYS (all compatible)

**Important:**
- Must have BLHeli or compatible firmware
- Aluminum PCB (lighter than regular PCB)
- Comes with connectors for motors

---

### FLIGHT CONTROLLER (1x Required)
**Part:** Omnibus F3 or SP Racing F3 Flight Controller

| Spec | Value |
|------|--------|
| Form factor | Compact |
| Gyroscope | MPU6000 or similar |
| Accelerometer | Built-in |
| Firmware | Betaflight compatible |
| Weight | ~8g |
| Voltage | 5V (from BEC) |
| Connectors | Standard servo headers |
| Processor | ARM Cortex-M4 |

**Where to buy:**
- AliExpress: Search "SP F3 flight controller" or "Omnibus F3"
- Price: €8-12
- Alternative: "Kakute F4" (~€12, better but heavier)

**What it does:**
- Reads gyro/accelerometer sensors
- Receives SBUS input from ESP32 RX
- Outputs PWM signals to ESCs
- Runs Betaflight firmware (pre-loaded, ready to use)

**You don't code this** — it's pre-programmed. Just configure in Betaflight.

---

### FPV CAMERA (1x Required)
**Part:** Caddx Baby Ratel FPV Camera

| Spec | Value |
|------|--------|
| Type | CMOS sensor |
| Resolution | 800-1000 TVL |
| Weight | 18g |
| Form factor | 17×17mm (super compact) |
| FOV | ~160° |
| Lens | 2.1mm |
| Power | 5V @ ~200mA |
| Connector | Standard video + power |
| Video output | NTSC analog 650mV |

**Where to buy:**
- AliExpress: Search "Caddx Baby Ratel FPV camera"
- Price: €20-25
- Alternatives: RunCam Micro 3 (€25-30, slightly better quality)

**Why this camera:**
- Lightweight (18g is key for 250g budget)
- Small form factor fits 3" frame perfectly
- Good image quality for FPV
- Reliable and proven

---

### VIDEO TRANSMITTER (VTx) (1x Required)
**Part:** 25mW 5.8GHz Compact VTx

| Spec | Value |
|------|--------|
| Power | 25mW |
| Frequency | 5.8GHz (FPV standard) |
| Channels | Multiple selectable |
| Weight | 10g |
| Input | Video in + 5V power |
| Output | RF antenna |
| Range | ~100-200m line-of-sight |

**Where to buy:**
- AliExpress: Search "25mW 5.8GHz VTx" or "Eachine TX805 5.8G 25mW"
- Price: €10-15
- Brands: Eachine TX805, Runcam Nano TX (various options)

**Why 25mW:**
- Lighter than 200mW modules (saves 5g)
- Sufficient range for learning (100-200m)
- Uses less power (battery friendly)
- Legal in most countries (varies by region)

---

### USB VIDEO RECEIVER (1x Required)
**Part:** 5.8GHz USB Video Receiver Module

| Spec | Value |
|------|--------|
| Type | USB adapter |
| Frequency | 5.8GHz |
| Channels | 48-channel selectable |
| Compatibility | Android/iOS via USB-C or micro-USB |
| Weight | Negligible |
| Price | €15-20 |

**Where to buy:**
- AliExpress: Search "5.8GHz USB wireless video receiver"
- Alternative: Local hobby shops

**How it works:**
- Plugs into phone (old phone you have!)
- Receives VTx signal from drone
- Shows FPV video in app
- Benjamin wears phone in goggles-style holder

---

### BATTERY (1x Required + Backup)
**Part:** 2S LiPo 450mAh 45C-50C

| Spec | Value |
|------|--------|
| Cells | 2S (7.4V nominal, 8.4V max) |
| Capacity | 450mAh |
| Discharge rate | 45C minimum (50C better) |
| Weight | ~60g |
| Connector | XT30 (standard) |
| Charging | Standard LiPo charger |
| Flight time | ~4-5 minutes |

**Where to buy:**
- AliExpress: Search "450mAh 2S 45C LiPo"
- Local hobby shop (faster, supports local)
- Price: €6-10 per battery
- **Buy 2-3 batteries** (enables longer session)

**Important:**
- Needs proper LiPo charger
- Never discharge below 3.0V per cell (6.0V total)
- Lipos are dangerous if damaged — handle carefully

---

### PROPELLERS (2 Sets Recommended)
**Part:** 3-inch Plastic Propellers

| Spec | Value |
|------|--------|
| Size | 3 inches (76mm) |
| Type | Plastic (lightweight) |
| Weight per set | 6g (CW + CCW pair) |
| Total (2 sets) | 12g |
| Buy 2-3 sets | Backup/spares |

**Where to buy:**
- AliExpress: Search "3 inch propeller quad" or "Gemfan 3 inch"
- Price: €2-3 per pair
- Brands: Gemfan, HQ, Sunnysky (all similar)

**Important:**
- Need 1 CW (clockwise) + 1 CCW (counter-clockwise)
- Props get damaged in crashes — spares essential
- DO NOT use carbon fiber props (too heavy for 250g budget)

---

### CONNECTORS & WIRING
**What you need:**

| Item | Qty | Weight | Notes |
|------|-----|--------|-------|
| XT30 connectors | 2 | 2g | Battery connector |
| Servo connectors | 4 | 2g | ESC to FC (can solder instead) |
| Wire (24 AWG) | ~1m | 5g | Motor power runs |
| Wire (26 AWG) | ~2m | 3g | Signal wires |
| Shrink tube | - | 2g | Insulation |
| Super glue | - | 0g | Assembly |
| Hot glue | - | 0g | Mounting |

**Where to buy:**
- AliExpress: Search "FPV drone connector kit"
- Price: €5-10 for assorted connectors/wire
- Local hobby shop: Connectors individually

---

### GROUND STATION (YOU ALREADY HAVE)

**ESP32 TX (Transmitter)**
- 1x ESP32 development board (you have)
- 1x nRF24L01 RF module (€2-3)
- 1x Xbox controller (you have)
- USB cables (you have)

**Purpose:** Reads Xbox input, transmits to drone via RF

---

### DRONE ELECTRONICS (ESP32 RX)

**ESP32 RX (Receiver)**
- 1x ESP32 development board (you have)
- 1x nRF24L01 RF module (€2-3)
- 1x Logic level converter (€2-3)
- USB cable for programming (you have)

**Purpose:** Receives wireless commands, converts to SBUS for FC

---

## Complete Sourcing Checklist

### Week 1: Place Orders NOW

**AliExpress Cart** (20-30 day delivery):
- [ ] 4x 1105 5000 KV motors (€12-20)
- [ ] 4x 12A ESCs (€8-16)
- [ ] 1x Flight Controller F3/F4 (€8-12)
- [ ] 1x Caddx Baby Ratel camera (€20-25)
- [ ] 1x 25mW 5.8GHz VTx (€10-15)
- [ ] 2x nRF24L01 modules (€4-8)
- [ ] 1x Logic level converter (€2-3)
- [ ] FPV connector kit (€5-10)
- [ ] Propeller sets 3" (€5-10 for multiple sets)
- [ ] **Subtotal AliExpress: €74-119**
- [ ] Combine shipments where possible to save shipping

**Local Hobby Shop** (5-10 day delivery):
- [ ] 2-3x 2S 450mAh 45C LiPo batteries (€12-30)
- [ ] USB 5.8GHz video receiver (€15-20)
- [ ] Battery charger if you don't have one (€15-25)
- [ ] **Subtotal Local: €42-75**

**You Already Have:**
- [ ] 3x Creality Ender 5 Plus printers
- [ ] 2x ESP32 boards
- [ ] PETG filament
- [ ] Soldering iron + solder
- [ ] Multimeter
- [ ] Old phone for FPV goggles

**Total Budget:** €116-194 (with spares/charger)  
**Minimum:** €90-120 (just essentials)

---

## 3D Printing Timeline

### Week 1-2: Design & Prep
- [ ] Download GoFlyPro 3" STL files
- [ ] Import into Cura/PrusaSlicer
- [ ] Configure print settings (12-15% infill, gyroid, PETG)
- [ ] Estimate print time per part

### Week 2-4: Printing (Parallelized)
**Printer 1:**
- [ ] Main chassis (8-10h)
- [ ] Spare chassis (8-10h)
- **Total:** ~18-20h

**Printer 2:**
- [ ] 4x Arms (8-10h)
- [ ] 4 Spare arms (8-10h)
- **Total:** ~18-20h

**Printer 3:**
- [ ] Camera mount (2-3h)
- [ ] Battery strap (1h)
- [ ] Miscellaneous (4-5h)
- **Total:** ~8-10h

**Wall-clock time with 3 printers:** ~18-20 hours (vs 54+ sequential)

### Week 3: Post-Processing
- [ ] Remove supports from all parts
- [ ] Sand rough edges (120 → 220 → 400 grit)
- [ ] Clean parts thoroughly
- [ ] Inspect for cracks/defects

---

## Assembly Timeline

### Week 4-5: Electronics Assembly
- **Session 1 (2-3h):** Motor-to-ESC soldering
- **Session 2 (2-3h):** Power distribution + FC connection
- **Session 3 (1-2h):** Camera + VTx mounting
- **Session 4 (1-2h):** Ground station setup (ESP32 TX)

### Week 5-6: Wireless & Testing
- **Session 5 (1-2h):** Receiver (ESP32 RX) wiring
- **Session 6 (2-3h):** Betaflight configuration
- **Session 7 (2-3h):** Radio link testing
- **Session 8 (1-2h):** Pre-flight checks

### Week 6+: Firmware & Flying
- Benjamin writes ESP32 firmware (2-4 weeks)
- First indoor test flights
- Betaflight tuning
- Outdoor flights (weather permitting)

---

## Weight Budget (Final Breakdown)

| Component | Weight | Cumulative |
|-----------|--------|-----------|
| Frame (GoFlyPro 3") | 38g | 38g |
| Motors (1104 7200 KV, 4x @ 7.5g) | 28g | 66g |
| ESCs (12A, 4x @ 7g) | 28g | 94g |
| Flight Controller | 8g | 102g |
| Camera (Caddx Baby Ratel) | 18g | 120g |
| VTx (25mW) | 10g | 130g |
| Battery (2S 450mAh) | 60g | 190g |
| Propellers (2 sets) | 12g | 202g |
| Wiring/connectors | 18g | 220g |
| Hot glue/misc | 12g | 232g |
| **SAFETY MARGIN** | **18g** | **250g** ✅ |

**Note:** 1104 7200 KV motors are software-limited via input scaling in Benjamin's firmware (0-255 stick range mapped to 0-200 command range). This tames aggressive motor response while saving weight.

---

## Benjamin's Firmware Task

Benjamin will write **two ESP32 programs:**

### 1. ESP32 TX (Ground Station)
**What it does:**
- Reads Xbox controller stick positions (USB HID)
- Formats data into 4-byte packets
- Sends via nRF24L01 at 50 Hz (20ms intervals)
- Reads: Throttle, Pitch, Roll, Yaw

**Benjamin learns:**
- USB device communication
- Radio protocol design
- SPI bus (nRF24L01 interface)
- Real-time embedded programming

### 2. ESP32 RX (On Drone)
**What it does:**
- Listens for nRF24L01 packets
- Implements failsafe (cut throttle if no signal for 1 second)
- Converts stick data to SBUS format (25-byte protocol)
- Outputs SBUS to Flight Controller via UART
- Status LED feedback (signal quality indication)

**Benjamin learns:**
- Wireless receiver programming
- Safety-critical systems (failsafe design)
- Protocol conversion (custom format → SBUS)
- Serial communication (UART)
- System debugging with LED feedback

**Resources for Benjamin:**
- Arduino IDE (free)
- nRF24L01 library examples
- SBUS format documentation
- YouTube tutorials on these topics

---

## Testing Procedure

### Pre-Flight Checklist (30 min)
- [ ] Weigh drone (should be <250g)
- [ ] Visual inspection (no cracks)
- [ ] Verify all connections solid
- [ ] Test FC LED (powers on)
- [ ] Test motors spin (without props!)
- [ ] Test radio link (signal received)
- [ ] Verify camera video shows up on phone
- [ ] Verify stick inputs work in Betaflight

### First Flight Procedure (15 min)
- [ ] Clear flying area (no people/animals)
- [ ] Attach propellers (CW + CCW correct)
- [ ] Arm drone in Betaflight
- [ ] Hover at low throttle (practice)
- [ ] Test stick response (gentle)
- [ ] Land gently
- [ ] Disarm and cool down

### Post-Flight Inspection (5 min)
- [ ] Check battery voltage (above 6.0V)
- [ ] Inspect propellers for damage
- [ ] Feel motors (should be warm, not hot)
- [ ] Verify frame integrity
- [ ] Charge battery for next flight

---

## Troubleshooting

### Drone Won't Power On
- Check battery voltage (use multimeter)
- Check XT30 polarity (red/black correct?)
- Check BEC output from ESC (should be 5V)

### One Motor Doesn't Spin
- Check solder joints (motor to ESC)
- Test ESC with different motor
- Try different signal wire (to FC)

### Radio Won't Connect
- Check nRF24L01 power (3.3V)
- Check SPI wires (SCK, MOSI, MISO)
- Check CE/CSN pins
- Verify both ESP32s have nRF24L01

### Gyro Reading Wrong
- Check FC orientation in Betaflight
- Verify gyro axis mapping
- Calibrate gyro (Betaflight menu)

### Drone Unstable in Air
- Check PID tuning (Betaflight)
- Verify prop CW/CCW correct
- Check weight distribution
- Verify no loose parts

---

## Success Criteria

By end of project:
- ✅ Drone weighs 200-250g
- ✅ Full FPV video system working
- ✅ Wireless control responding correctly
- ✅ Successful test flights (indoor or outdoor)
- ✅ Benjamin understands system completely
- ✅ Benjamin wrote the firmware
- ✅ Father-son bonding ✨

---

## Key Documentation Files

| File | Purpose |
|------|---------|
| [SUB_250G_FPV_BUILD.md](SUB_250G_FPV_BUILD.md) | Complete sub-250g strategy |
| [SYSTEM_DIAGRAM.md](SYSTEM_DIAGRAM.md) | Visual system architecture |
| [docs/ASSEMBLY_GUIDE.md](docs/ASSEMBLY_GUIDE.md) | Step-by-step assembly |
| [FIRMWARE_DESCRIPTION.md](FIRMWARE_DESCRIPTION.md) | What firmware does (non-code) |
| [docs/TESTING_CHECKLIST.md](docs/TESTING_CHECKLIST.md) | Pre-flight & testing procedures |
| [FRAME_SELECTION.md](FRAME_SELECTION.md) | Frame options & printing |
| [docs/FOR_BENJAMIN.md](docs/FOR_BENJAMIN.md) | Benjamin's beginner guide |

---

## Next Actions (Priority Order)

### This Week
1. ✅ Read this guide (you're doing it!)
2. ⬜ Order parts from AliExpress
3. ⬜ Download GoFlyPro STL files
4. ⬜ Start 3D printing frame

### Next Week
5. ⬜ Parts begin arriving
6. ⬜ Continue 3D printing
7. ⬜ Prep assembly workspace
8. ⬜ Gather soldering tools

### Weeks 3-4
9. ⬜ All parts arrive
10. ⬜ Frame printing complete
11. ⬜ Start electronics assembly
12. ⬜ Solder motors/ESCs

### Weeks 5-6
13. ⬜ Complete mechanical assembly
14. ⬜ Wire flight controller
15. ⬜ Setup ground station
16. ⬜ Benjamin writes firmware

### Week 6+
17. ⬜ Test all systems
18. ⬜ Debug issues
19. ⬜ First flights!
20. ⬜ Tuning and optimization

---

## Contact & Resources

**For soldering help:** YouTube "beginner drone soldering"
**For Betaflight:** betaflight.com (official docs)
**For ESP32 coding:** Arduino IDE tutorials
**Community:** DIYDrones.com, RCGroups.com

---

## Final Notes

This is **genuinely achievable.** Thousands of people have built sub-250g FPV drones. You have:
- ✅ Equipment (3x printers, soldering iron)
- ✅ Skills (you're better at C++ than I am!)
- ✅ Time (6-8 weeks is reasonable)
- ✅ Budget (€90-120 minimum)
- ✅ Motivation (building with Benjamin!)

**The hardest part is starting. The second hardest is staying patient during 3D printing.**

Everything else is straightforward once you have components.

**Good luck! 🚀**

