# Frame Design Selection Guide

## Overview

The drone **frame is the skeleton** that holds all parts together. Since you have 3x Creality Ender 5 Plus printers, you can 3D print the entire frame and print spares quickly.

---

## Frame Type: 5-Inch Quadcopter

We're building a **5-inch quad** because:
- ✅ Good size for a 9-year-old (not too big, not too small)
- ✅ Plenty of open-source designs available
- ✅ Fits within Ender 5 Plus print bed
- ✅ Balanced for stability + maneuverability
- ✅ Uses common 5" propellers

---

## Recommended Open-Source Frames

### Option 1: TBS Source One (BEST - Highly Recommended!)

**Where to get CAD:**
- **GitHub:** https://github.com/tbs-trappy/source_one (official open-source)
- **Printables:** [TBS Source One Frame](https://www.printables.com/model/986512-open-source-fpv-drone-frame-project-initiated-by-t)
- Multiple community versions available
- Well-documented on GitHub with full CAD in STEP format

**Advantages:**
- ✅ Industry-standard design (proven by professionals)
- ✅ Excellent documentation (multiple languages)
- ✅ Very modular (easy to repair/modify)
- ✅ Active community support on GitHub
- ✅ Tons of YouTube tutorials
- ✅ Strong but lightweight
- ✅ Great for learning (clear design principles)

**Frame Specifications:**
- **Wheelbase:** 5 inches (210mm diagonal)
- **Frame weight:** ~95-100g (PETG, 15% infill)
- **Total drone weight:** ~350-400g (with all electronics)
- **Material:** PETG recommended (stronger than PLA)

**Print Requirements:**
- Main chassis: 1x
- Side plates: 2x
- Arms: 4x (+ 4 spares recommended)
- Camera mount: 1x
- Battery holder: 1x
- **Total print time:** ~45-55 hours (parallelizable across 3 printers)

**Why TBS Source One is best:**
1. **Professional design** — Used by racers/professionals worldwide
2. **Open-source community** — Many people have solved problems you'll hit
3. **Learning value** — Well-designed for understanding frame engineering
4. **Future proof** — Compatible with many aftermarket parts

---

### Option 2: Flywoo Freestyle 5" (Good Alternative)

**Where to get CAD:**
- Search: "Flywoo Freestyle" on Printables or Thingiverse
- Some versions have published STL files
- Alternative: Look for "Flywoo inspired" designs

**Advantages:**
- ✅ Beginner-friendly design
- ✅ Good part access for wiring
- ✅ Modular (easy to replace broken arms)
- ✅ Proven stable platform
- ✅ Good documentation online

**Disadvantages:**
- ⚠️ May need slight CAD modifications
- ⚠️ Check if published STL matches your setup

**Print Requirements:**
- Main chassis: 1x
- Arms: 4x (+ 4 spares recommended)
- Camera mount: 1x
- Battery holder: 1x
- **Total print time:** ~40-50 hours

**Print Settings:**
- Layer height: 0.2mm
- Infill: 15-20% (lightweight but strong with PETG)
- Support: Yes, for overhangs
- Orientation: Optimize for strength (watch grain direction)

---

### Option 2: TBS Source One (Larger, More Advanced)

**Where to get CAD:**
- Published on Thingiverse
- Well-documented design
- Popular in FPV community

**Advantages:**
- ✅ Extremely well-documented
- ✅ Very modular design
- ✅ Great for learning (complex, but teaches design)
- ✅ Proven excellent frame

**Disadvantages:**
- ⚠️ Larger (might not fit easily in Ender 5 Plus bed)
- ⚠️ More complex assembly
- ⚠️ Overkill for a 9-year-old beginner

**Verdict:** Save this for drone #2 when Benjamin has experience

---

### Option 3: Simple DIY Quad Frame (Easiest)

**Design your own simple frame:**
- 4 arms radiating from center
- Central chassis for FC, battery
- Minimal parts

**Advantages:**
- ✅ Benjamin learns CAD design
- ✅ Customizable to your specific parts
- ✅ Simplest assembly

**Disadvantages:**
- ⚠️ Requires CAD design work (Fusion 360, FreeCAD)
- ⚠️ No online support community
- ⚠️ More testing needed to verify strength

**Verdict:** Good learning project, but slower start

---

## CAD Tools & Resources

### Software Options

| Tool | Cost | Difficulty | Learning |
|------|------|-----------|----------|
| **Fusion 360** | Free (student) | Medium | Industry standard |
| **FreeCAD** | Free | Medium-Hard | Open-source, steeper learning curve |
| **Tinkercad** | Free | Easy | Good for beginners, limited features |
| **Onshape** | Free | Medium | Cloud-based, modern |

### Resources for Learning CAD
- **YouTube:** "Fusion 360 quad frame design" tutorials
- **Printables:** Most designs have step-by-step assembly photos
- **Thingiverse:** Remixable designs (based on existing designs)

---

## Ender 5 Plus Specifications

**Build plate:** 220 x 220 mm  
**Max print height:** 300 mm (but we'll use ~100mm max)

**Frame parts that fit:**
- ✅ Arms (individual): ~150mm long
- ✅ Chassis: ~200mm diagonal
- ✅ Camera mount: ~50mm
- ✅ Battery holder: ~100mm

**Parts that need splitting:**
- ⚠️ Large integrated frames might need printing in sections and gluing

---

## Material Selection

### PLA (Polylactic Acid)
| Pros | Cons |
|------|------|
| Easy to print | Brittle on impact |
| Good detail | Less flexible |
| Cheap | Absorbs water |

**Use for:** Camera mount, battery holder (non-critical)

### PETG (Polyethylene Terephthalate Glycol)
| Pros | Cons |
|------|------|
| Much stronger | Harder to print (warping) |
| More flexible | Needs higher temps |
| Less brittle | More expensive |

**Use for:** Arms, chassis (critical structural parts)

### Recommended: **PETG for arms and chassis, PLA for mounts**

---

## Print Strategy with 3 Printers

### Parallelization Plan

**Week 1-2: Baseline Frames**
- **Printer 1:** Main chassis (20h)
- **Printer 2:** Arms (4x) (24h)
- **Printer 3:** Mounts + battery holder (12h)
- **Total:** ~26 hours wall-clock (vs 56h sequential)

**Week 2-3: Spares (while assembling)**
- **Printer 1:** 4 spare arms (24h)
- **Printer 2:** Spare chassis (20h)
- **Printer 3:** Extra mounts (8h)

### Print Queue

```
Priority (print in this order):
1. Main chassis (single print)
2. Arms (4 parts, can print together if they fit)
3. Camera mount (for assembly)
4. Battery holder (for assembly)
5. Spares (print continuously in background)
```

---

## Assembly Preparation

### Before You Print

1. **Find your STL files** (Week 1)
   - Download from Printables/Thingiverse
   - Check that parts fit your Ender 5 Plus bed
   - If too large, plan how to split/glue parts

2. **Prepare slicer** (Week 1)
   - Import STLs into Cura or PrusaSlicer
   - Set print orientation for strength
   - Configure supports where needed
   - Estimate print time per part

3. **Prepare workspace** (Week 1)
   - Get super glue or epoxy for joining parts
   - Gather sandpaper (smooth rough edges)
   - Have paint/primer ready (optional, for looks)

### Print Settings to Use

```
General Settings:
- Nozzle: 0.4mm
- Plate temp: 60°C (PLA) or 80°C (PETG)
- Nozzle temp: 200°C (PLA) or 230°C (PETG)
- Layer height: 0.2mm
- Line width: 0.4mm
- Infill: 15% (lightweight, still strong)
- Infill pattern: Gyroid (strong diagonals)

Supports:
- Enable if overhangs > 45°
- Type: Tree supports (less material, easier removal)
- Angle: 50°

Adhesion:
- Brim: Yes (helps with corners)
- Raft: No (adds too much time)
```

---

## Post-Processing

### After Print

1. **Remove from plate carefully**
   - Wait for plate to cool
   - Use scraper, don't lever

2. **Remove supports**
   - Use sharp knife or flush cutters
   - Sand down leftover marks

3. **Sand rough edges**
   - 120 grit → 220 grit → 400 grit
   - Makes assembly easier, safer to handle

4. **Clean parts**
   - Remove any loose plastic strands
   - Wash if very dusty

5. **Optional: Paint/Primer**
   - Spray primer if you want colors
   - Not required, but Benjamin might enjoy it

### Gluing Parts Together (if frame is split)

1. **Test fit first** (dry assembly)
2. **Use super glue (cyanoacrylate) or epoxy**
3. **Clamp/hold for 24h while drying**
4. **Sand joint smooth**

---

## Troubleshooting

### Print Warping
- ✅ PETG warps more than PLA
- ✅ Lower bed temp or add brim
- ✅ Ensure good bed leveling
- ✅ Try closing printer enclosure to reduce drafts

### Print Stringing
- ✅ Increase retraction distance
- ✅ Lower print speed slightly
- ✅ Increase nozzle-to-part distance

### Support Removal Difficulty
- ✅ Use tree supports (easier than linear)
- ✅ Print orientation matters (rotate model in slicer)
- ✅ Lower support density if possible

### Weak Parts
- ✅ Increase infill to 20-25%
- ✅ Check layer adhesion (first layer too thin?)
- ✅ Use PETG instead of PLA for stress areas

---

## Timeline

| Week | Task |
|------|------|
| 1 | Finalize frame design, download/prepare STLs |
| 1-2 | Print baseline frame parts |
| 2-3 | Receive plastic, clean and sand parts |
| 3 | Start assembly with available parts |
| 3-4 | Print spares (arms especially) |
| 4 | Integrate frame with electronics |

---

## Next Steps

1. **Search for "5 inch FPV quad" on Printables**
2. **Find Flywoo-inspired or similar beginner frame**
3. **Download STL files and check Ender 5 Plus bed**
4. **Prepare print settings in Cura**
5. **Start printing while ordering electronics**

