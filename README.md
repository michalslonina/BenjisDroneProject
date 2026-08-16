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

## Component Stack

- **Control:** 2x ESP32 + nRF24L01 RF modules (custom wireless protocol)
- **Flight:** F4 Flight Controller (Betaflight compatible)
- **Motors:** 4x brushless 2300 KV + ESCs
- **FPV:** 1000 TVL camera + 200mW VTx + USB receiver
- **Frame:** TBS Source One (3D printed PETG, 15% infill, ~95-100g)
- **Power:** 3S 1000mAh LiPo battery
- **Total Weight:** ~350-400g (practical minimum with full FPV system)

**Note:** While target was <250g, this is unrealistic with FPV video. See [WEIGHT_BUDGET.md](WEIGHT_BUDGET.md) for detailed analysis.

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
