# FPV Drone for Benjamin

A 3D printable FPV (First Person View) drone project designed for educational and recreational flying with my son Benjamin (age 9).

**Goal:** Build and fly a wireless-controlled 3D-printed drone using custom ESP32 firmware to learn about embedded systems, wireless communication, and flight control.

## 📚 Documentation (Start Here!)

1. **[FOR_BENJAMIN.md](docs/FOR_BENJAMIN.md)** — Benjamin's guide to the project
2. **[SYSTEM_DIAGRAM.md](SYSTEM_DIAGRAM.md)** — Visual system architecture (Mermaid diagrams)
3. **[SYSTEM_ARCHITECTURE.md](SYSTEM_ARCHITECTURE.md)** — How everything connects
4. **[BOM.md](BOM.md)** — Complete bill of materials with prices
5. **[SOURCING_GUIDE.md](SOURCING_GUIDE.md)** — Where to buy parts and timeline

## Project Structure

```
├── cad/                      # 3D models and CAD files
│   ├── frame/               # Drone frame components
│   ├── arms/                # Motor arms
│   └── body/                # Fuselage and housing
├── firmware/                 # Flight controller firmware
│   ├── esp32_transmitter/    # Xbox controller → RF transmitter
│   └── esp32_receiver/       # RF receiver → Flight controller
├── electronics/              # Circuit diagrams and PCB designs
├── docs/                     # Documentation
│   ├── FOR_BENJAMIN.md      # Benjamin's guide
│   ├── assembly/            # Assembly instructions
│   └── tuning/              # Betaflight configuration guide
├── slicing/                  # 3D printer settings and profiles
└── builds/                   # Build logs and flight test data
```

## System Overview

```
Xbox Controller → ESP32 TX ─(RF)─→ ESP32 RX → Flight Controller → Motors → 🚁 Flies!
                                      ↓
                                  FPV Camera → VTx ─(RF)─→ Phone (Goggles)
```

## Build Options

### ⭐ Option 1: Sub-250g FPV (RECOMMENDED)
- **Frame:** GoFlyPro 3" (38g, perfect for 250g limit)
- **Motors:** 1105 5000 KV lightweight (8g each)
- **Battery:** 2S 450mAh 45C (60g, ~4-5 min flight time)
- **Camera:** Caddx Baby Ratel (18g, 800 TVL)
- **VTx:** 25mW compact (10g, ~200m range)
- **Total Weight:** 200-250g ✅
- **Cost:** ~€65-100
- **Flight:** Agile, fun, good for indoors
- **See:** [SUB_250G_FPV_BUILD.md](SUB_250G_FPV_BUILD.md)

### Option 2: Standard 5" FPV
- **Frame:** TBS Source One (95-100g)
- **Motors:** 2300 KV brushless
- **Battery:** 3S 1000mAh
- **Camera:** 1000 TVL
- **VTx:** 200mW
- **Total Weight:** 350-400g
- **Cost:** ~€100-130
- **Flight:** Stable, longer flight time
- **See:** [WEIGHT_BUDGET.md](WEIGHT_BUDGET.md)

## Project Timeline

- **Week 1:** Order components (AliExpress + local)
- **Week 2-3:** Receive parts, begin 3D printing
- **Week 4-5:** Assembly and wiring
- **Week 5-6:** Firmware development (Benjamin's task)
- **Week 6+:** Testing, tuning, first flights

## Status

- [x] System design
- [x] Component selection & sourcing
- [ ] 3D frame design
- [ ] Component procurement
- [ ] Hardware assembly
- [ ] Firmware (receiver code)
- [ ] Betaflight configuration
- [ ] Testing & flight validation

## Safety

⚠️ **Before every flight:**
- Check all propellers are secure
- Verify battery connection
- Test control input
- Keep clear of people and animals
- Never aim at faces

## Learning Outcomes

✅ Wireless RF communication  
✅ Embedded systems programming (C/C++)  
✅ Flight dynamics and gyro/accelerometer sensors  
✅ Motor control and ESCs  
✅ 3D design and printing  
✅ Electronics assembly and soldering  
✅ Problem-solving and debugging  

---

**Start with:** Read [SYSTEM_DIAGRAM.md](SYSTEM_DIAGRAM.md) and [docs/FOR_BENJAMIN.md](docs/FOR_BENJAMIN.md)
