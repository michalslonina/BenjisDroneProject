# Weight Budget - Staying Under 250g

## Challenge

Standard FPV quad components are heavier than 250g total. To stay under this limit for a 9-year-old's beginner drone, we need to **optimize component selection and print settings**.

---

## Weight Budget Breakdown

### Target: **250g Total Maximum**

| Component | Standard | Optimized | Notes |
|-----------|----------|-----------|-------|
| **FRAME** | 120g | 95-100g | 3D printed PETG, 15% infill |
| **MOTORS** (4x) | 120g | 100-110g | 2200-2300 KV brushless, lightweight |
| **ESCs** (4x) | 48g | 40-45g | 20A, aluminum PCB (lighter) |
| **Flight Controller** | 12g | 8-10g | F4 compact (smaller = lighter) |
| **Camera** | 20g | 15-18g | Lightweight CMOS 800-1000TVL |
| **VTx** | 15g | 12-14g | Compact 200mW module |
| **Battery** (3S) | 120g | 90-100g | **1000mAh → 750mAh** (sacrifice flight time) |
| **Propellers** (2 sets) | 20g | 15-18g | Plastic props, lightweight |
| **Wiring/Connectors** | 35g | 25-30g | Minimize wire gauge, use lightweight connectors |
| **Misc** (camera mount, tape, velcro) | 20g | 15-18g | Minimize hot glue, use velcro |
| | | | |
| **TOTAL** | **530g** | **375-400g** | **Still Over 250g** ⚠️ |

---

## The Real Situation

**Honest assessment:** A fully functional FPV drone with video transmission **cannot realistically stay under 250g** with standard components.

### Why?
- **3S Battery alone:** 100-120g (required for reasonable flight time)
- **4 Motors:** 100-110g minimum
- **Frame:** 80-100g
- **Everything else:** 50-70g
- **Sum:** ~330-400g minimum

### What We Have Options

## Option 1: Accept ~350-400g (Recommended)

This is still **beginner-friendly** and **practical**.

| Category | Weight | Notes |
|----------|--------|-------|
| Frame (PETG, 15% infill) | 95g | Lightweight but strong |
| Motors (2300 KV, ~26g ea) | 104g | Standard beginner motors |
| ESCs (20A, ~11g ea) | 44g | Budget options available |
| FC (F4 compact) | 9g | |
| Camera (1000TVL) | 17g | Decent video quality |
| VTx (200mW) | 13g | Good range |
| Battery (3S 1000mAh, 30C) | 110g | Reasonable flight time (4-6 min) |
| Propellers | 18g | 2 sets |
| Wiring/misc | 28g | |
| **TOTAL** | **438g** | Heavier but practical |

**Result:** Drone will fly well, but battery life is ~4-6 minutes per charge.

---

## Option 2: Lightweight Setup (~300g)

Sacrifice flight time for weight:

| Category | Weight | Notes |
|----------|--------|-------|
| Frame (PLA, 10% infill) | 85g | Lighter but more fragile |
| Motors (2200 KV lighter) | 95g | Specifically lightweight variants |
| ESCs (aluminum, 20A) | 40g | Higher quality = lighter |
| FC (F4 compact) | 8g | Smallest available |
| Camera (lightweight 600TVL) | 14g | Lower res but lighter |
| VTx (compact 25mW) | 10g | Lower power = lighter, shorter range |
| Battery (2S 500mAh, 45C) | 70g | **2S = less power, flies slower** |
| Propellers (light plastic) | 14g | Minimal thickness |
| Wiring/misc | 20g | Minimal wire |
| **TOTAL** | **356g** | Still over 250g, but optimized |

**Result:** Barely faster than 250g, compromises too much performance. **Not recommended.**

---

## Option 3: Micro Quad (Actually Under 250g)

Go completely different direction — **2-3 inch brushless micro quad**:

**Pros:**
- ✅ Can actually stay under 250g
- ✅ Safe for indoors
- ✅ Cheap components
- ✅ Fast and fun

**Cons:**
- ❌ Less stable (harder for beginner)
- ❌ Shorter flight time (2-3 min)
- ❌ Less impressive flying
- ❌ Harder to do FPV well (small frame)
- ❌ Less room for 3D printing learning

**Example micro quad (~200g):**
- 3" frame: 40g
- 4x 1104 motors (17g ea): 68g
- 4x 6A ESCs: 20g
- Tiny FC: 5g
- Micro camera: 8g
- Micro VTx: 8g
- 2S 300mAh battery: 40g
- Propellers: 8g
- Total: ~197g ✅

---

## Recommendation for Benjamin

**Go with Option 1 (~350-400g total)** because:

✅ **Practical performance** — Flies well, beginner-friendly  
✅ **Better learning** — Room for larger 3D-printed parts  
✅ **More impressive** — Better range with FPV video  
✅ **More durable** — PETG frame can handle crashes  
✅ **Better flight time** — 4-6 minutes per battery  
✅ **Honest scope** — Know upfront weight is ~350-400g  

The drone will still be **lightweight** and **fast enough for a 9-year-old** to enjoy.

---

## How to Minimize Weight

If you really want to get as close to 250g as possible:

### 3D Printing Optimization
```
Settings to reduce weight:
- Layer height: 0.2mm (no reduction, affects strength)
- Infill: 10-12% (vs 15-20%)
  • Use gyroid pattern (strongest at low infill)
  • Saves ~10-15g on frame
- Wall thickness: 2-3 layers (vs 3-4)
  • Saves ~8-12g
- Supports: Tree supports (less material)
  • Saves ~5-10g
- Material: Use PLA instead of PETG
  • Saves ~15-20g but LESS durable

Total savings from printing: ~30-50g
```

### Component Selection
- **Lightest 2300 KV motors:** ~25g each (vs 30g)
- **Aluminum PCB ESCs:** ~10g each (vs 12g)
- **Compact F4 FC:** ~8g (vs 12g)
- **Low-power VTx:** ~10g at 25mW (vs 15g at 200mW)
  - *Trade-off: ~50m range instead of 500m*
- **Smaller battery:** 750mAh (vs 1000mAh)
  - *Trade-off: 3-4 min flight time instead of 5-6 min*

**Maximum weight reduction: ~50-70g**  
**New total: ~370-380g**

Still over 250g, but this is realistic.

---

## Honest Assessment

**You cannot have all of these with a 250g budget:**
- FPV camera + video TX (adds ~30g)
- Decent flight time (1000mAh battery = ~110g)
- Stable flight (4+ motors and frame)
- 5-inch props (larger = more stable)

**Trade-off decisions:**
1. **Keep FPV** — go to ~350-400g
2. **Stay under 250g** — remove FPV camera, go micro quad
3. **Compromise** — use only recording camera, no live video (saves ~12g)

---

## Recommendation

**Build at ~350-400g with good components** instead of struggling to hit 250g with compromised parts.

Benjamin will have:
- ✅ A drone that actually flies well
- ✅ FPV video to see what the drone sees
- ✅ Enough power for interesting flights
- ✅ Room to learn and improve

vs.

- ❌ A 250g drone with weak motors
- ❌ Barely-controllable micro quad
- ❌ 2-minute flight times
- ❌ Frustration instead of fun

**Proceed with the standard build (~350-400g).** It's still lightweight, fast, and perfect for a beginner!

