# Sub-250g FPV Build Guide

## Challenge Accepted! Yes, It's Possible

You CAN build a sub-250g FPV camera drone. It requires:
- **3-inch frame** (vs 5-inch)
- **Lightweight components** (1104-1106 motors, not 2300 KV)
- **2S battery** (vs 3S) - higher discharge rate
- **Lightweight FPV** (action cam or small cinewhoop style)
- **Careful component selection**

---

## Recommended Frame: GoFlyPro 3"

**Download:** [GoFlyPro - FPV Drone Frame - Sub 250g](https://www.printables.com/model/733870-goflypro-fpv-drone-frame-3-35-and-4-inch-sub-250g)

**Specifications:**
- **Frame weight:** 33-40g (incredibly light!)
- **Wheelbase:** 3 inches (76mm)
- **Total target weight:** 200-250g **with full FPV**
- **Material:** PETG or Carbon PETG
- **Designed for:** Freestyle flying, long endurance

**Why GoFlyPro:**
- ✅ Specifically designed for sub-250g
- ✅ Proven by hundreds of builders
- ✅ Excellent documentation
- ✅ Great for first-person view flying
- ✅ Can handle GoPro (heavier option) or lightweight camera

---

## Sub-250g Weight Budget (REALISTIC)

| Component | Weight | Notes |
|-----------|--------|-------|
| **Frame (GoFlyPro 3")** | 38g | PETG 15% infill |
| **Motors (1105 5000KV)** | 32g | 4x @ 8g each |
| **ESCs (12A)** | 28g | 4x @ 7g each, aluminum |
| **Flight Controller** | 8g | F3/F4 compact |
| **Camera** | 18g | Caddx Baby Ratel (small CMOS) |
| **VTx** | 10g | 25mW compact |
| **Battery (2S 450mAh 45C)** | 60g | **Key to staying under 250g** |
| **Propellers (3")** | 12g | 2 sets |
| **Wiring/connectors** | 20g | Minimalist |
| **Misc (velcro, tape, etc)** | 15g | Keep minimal |
| | | |
| **TOTAL** | **241g** | ✅ Under 250g! |

---

## Optimized Component List for Sub-250g

### Motors - 1105 or 1106 5000 KV

**Examples:**
- **Eachine 1105 5000 KV:** ~8g per motor, €3-4 each on AliExpress
- **DYS 1105 5000 KV:** ~8g, better quality (~€5 each)
- **Happymodel 1105 5000 KV:** ~8g, popular choice (~€4-5 each)

**Why 5000 KV on 2S:**
- 2S = 7.4V × 5000 KV = 37,000 RPM
- Good balance for 3" props
- Flies more aggressively than 5-inch (faster, more responsive)

### ESCs - 12A or Smaller

**Examples:**
- **Eachine Blheli 12A:** ~7g, €2-3 each
- **Racerstar 12A:** ~7g, €2-3 each
- **DYS XS12A:** ~8g, better reliability (~€5 each)

**Must have:** 
- ✅ BLHeli or compatible firmware (standard)
- ✅ Aluminum PCB (lighter than normal PCB)
- ✅ 2S rated minimum

### Flight Controller - Compact F3 or F4

**Examples:**
- **Omnibus F3:** ~7-8g, €8-10
- **Kakute F4:** ~8g, ~€12
- **SP F3:** ~7g, €8-10

**Important:**
- Get the compact version (not full-size)
- Must support SBUS input (for your ESP32 RX)
- Built-in gyro/accelerometer

### Camera - Lightweight CMOS

**Best options for sub-250g:**

1. **Caddx Baby Ratel (RECOMMENDED)**
   - Weight: 16-18g
   - Resolution: 800-1000 TVL
   - Small form factor (17x17mm)
   - Price: €20-25
   - Great FOV for 3" quad

2. **RunCam Micro 3**
   - Weight: 18-20g
   - Resolution: 800 TVL
   - Good optical quality
   - Price: €25-30

3. **Eachine 400 Line**
   - Weight: 15g
   - Resolution: 400 TVL (lower quality)
   - Ultra lightweight
   - Price: €15-18
   - **Trade-off:** Lower video quality

**Do NOT use:** Full-size cameras (GoPro Hero, etc.) - too heavy for sub-250g

### VTx - Compact 25mW

**Examples:**
- **Eachine TX805 5.8G 25mW:** ~10g, €10-12
- **Runcam Nano TX:** ~9g, €15-18
- **Immersion RC 25mW module:** ~10g, €15-20

**Why 25mW?**
- Sufficient range: ~100-200m line of sight
- Lighter than 200mW modules
- Less heat (important on small frame)
- Uses less power (battery friendly)

### Battery - 2S LiPo (CRITICAL)

**Must be light AND powerful:**
- **Capacity:** 450-550 mAh
- **Discharge rate:** 45-50C minimum (for 3" quad)
- **Weight:** 60-70g

**Examples:**
- **Eachine 450mAh 45C:** ~62g, €6-8
- **Happymodel HV 550mAh 60C:** ~65g, €8-10 (better quality)
- **Gaoneng GNB 450mAh 50C:** ~62g, €8-10

**Flight time:** ~4-5 minutes per battery (decent for freestyle)

### Propellers - 3 Inch

**Must be:** Lightweight plastic (not carbon fiber)
- **Gemfan 3 inch props:** €2-3 per pair
- **HQ 3 inch props:** €3-4 per pair
- **Sunnysky 3 inch props:** €3-4 per pair

**Get 2-3 sets** (props get damaged)

---

## Wiring for Sub-250g (Minimize Everything!)

### Power distribution:
- Use thin wire (24 AWG or 26 AWG max)
- Minimize length (motors close to ESCs)
- Solder directly when possible (no connectors)

### Signal wiring:
- Use servo connectors or JST-GH (lightweight)
- Keep runs as short as possible
- Bundle with thin zip ties

### FPV wiring:
- Short video cable (camera to VTx)
- Short power cable (BEC to VTx)

**Total wiring weight goal:** 15-20g

---

## Building for 250g

### Critical Steps

1. **Measure components as they arrive**
   - Weigh each part individually
   - Track total running weight
   - Adjust if over budget

2. **Choose lightweight solder technique**
   - Solder everything directly (no connectors where possible)
   - Saves ~3-5g vs connectors
   - Makes repairs harder but worth it for weight

3. **Minimize structural materials**
   - Print frame at 12-15% infill (gyroid pattern best)
   - Use minimal hot glue (velcro instead where possible)
   - Skip unnecessary supports/mounts

4. **Assembly order:**
   - Weigh frame + arms: ~38g
   - Add motors (4x): +32g = 70g
   - Add ESCs (4x): +28g = 98g
   - Add FC: +8g = 106g
   - Add camera: +18g = 124g
   - Add VTx: +10g = 134g
   - Add battery: +60g = 194g
   - Add props/wiring: +30g = 224g
   - **Safe margin to 250g: ~26g**

---

## Expected Performance

**Flying characteristics (vs 5" quad):**
- ✅ **More agile** — Responds faster to input
- ✅ **Faster acceleration** — 2S motors are responsive
- ✅ **Lighter feel** — Easier to control for beginners
- ✅ **Shorter flights** — 4-5 min vs 6-8 min on 5"
- ✅ **Better indoors** — Smaller frame, safer in tight spaces
- ⚠️ **Twitchier** — Less stable in wind, needs good control
- ⚠️ **Shorter range** — 25mW VTx has ~200m range max

**Best use cases:**
- Indoor freestyle flying
- Short outdoor flights in calm weather
- Learning FPV control in a safe platform
- Fun and fast flying experience

---

## Alternative: Project Synthara (GoPro Compatible)

If you want HIGHER video quality with GoPro:

**[Project Synthara - Generative Design FPV Drone](https://www.printables.com/model/1216454-project-synthara-generative-design-fpv-drone-frame)**

- **Frame weight:** ~50g (heavier but optimized design)
- **Can carry:** Naked GoPro (action cam)
- **Total weight:** Can do 200-250g
- **Trade-off:** More complex build, less agile (GoPro is front-heavy)

---

## Sourcing for Sub-250g Build

| Component | AliExpress Search | Est. Price EUR |
|-----------|------------------|----------------|
| Motors 1105 5000KV | "1105 5000KV brushless motor" | €3-5 each |
| ESCs 12A | "12A ESC blheli brushless" | €2-4 each |
| Flight Controller | "SP F3 flight controller" or "Omnibus F3" | €8-12 |
| Camera | "Caddx Baby Ratel" or "Eachine 400 line" | €15-25 |
| VTx | "25mW 5.8G VTx" | €10-15 |
| 2S Battery | "450mAh 45C LiPo 2S" | €6-10 |
| Propellers | "3 inch propeller quad" | €2-3 per set |
| | | |
| **TOTAL ELECTRONICS** | | **€60-90** |
| **Filament for frame** | Your existing PETG | €5-10 |
| **GRAND TOTAL** | | **€65-100** |

**Even cheaper than 5-inch build!**

---

## 3D Printing GoFlyPro 3"

### Print Settings

```
General:
- Layer height: 0.2mm
- Line width: 0.4mm
- Infill: 12-15% (critical for weight)
- Pattern: Gyroid (strongest at low infill)
- Material: PETG (safer than PLA)

Supports:
- Type: Tree supports
- Angle: 50°
- Density: 10-15%

Speed:
- Print speed: 40-50 mm/s (slower = stronger)
- Wall speed: 30 mm/s
```

### Part-by-part

| Part | Print Time | Weight | Notes |
|------|-----------|--------|-------|
| Main chassis | 6-8h | 15g | 15% infill, vertical orientation |
| 4x Arms (together) | 8-10h | 18g | Can print together to save time |
| Camera mount | 2-3h | 2g | 10% infill ok |
| Battery strap | 1h | 2g | Simple design |
| **Total** | **~20-25h** | **~38g** | Can run parallel on 3 printers! |

**With 3 printers:** Print chassis on 1, arms on 2, mounts on 3 = ~10 hours wall-clock time

---

## Benjamin's Firmware for Sub-250g

**Good news:** Same firmware as the 5" build!

The ESP32 TX/RX code doesn't change:
- Still reads Xbox controller
- Still sends via nRF24L01
- Still outputs SBUS to FC

The only difference is **tuning in Betaflight** for the smaller, lighter frame:
- Sensitivity adjustments
- PID tuning (stick response)
- Rate adjustments (how fast it rotates)

Benjamin can learn about:
- Why smaller drones need different tuning
- How weight affects flight dynamics
- Betaflight PID controller theory

---

## Success Criteria for Sub-250g

- [ ] Weigh each component before assembly
- [ ] Total weight under 250g
- [ ] FPV camera working (test with USB receiver on phone)
- [ ] Wireless control working (ESP32 to FC)
- [ ] Flight controller responding to inputs
- [ ] Propellers spin correctly (no reversals)
- [ ] First indoor flight successful
- [ ] Benjamin is smiling! 🚁

---

## Recommendation

**Go with GoFlyPro 3" + lightweight electronics:**
- ✅ Actually stays under 250g with good video
- ✅ Fun to fly (agile, responsive)
- ✅ Cheaper overall (~€65-100)
- ✅ Still educational for Benjamin
- ✅ Better for indoors (smaller, safer)
- ✅ Faster to print (3" frame < 5" frame)

**Print timeline:** ~25 hours total (parallelizable across 3 printers)

Let's do this! 🚀

