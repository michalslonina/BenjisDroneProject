# Frame Design Selection — FINAL DECISION

## Chosen Frame: ASCopter H-Frame (remixed for our build)

**Status:** ✅ Source downloaded, tuned, rendered, and verified. Ready to print.

**Files in this repo:** `cad/frame/`
- `ASCopterHframe.scad` — original source (by clifton2, Thingiverse thing:1758777, CC-BY-NC)
- `ASCopter_tuned.scad` — our tuned parameters, ready to open in OpenSCAD
- `ASCopter_tuned.stl` — pre-rendered STL, ready to slice

## Why This Frame

We evaluated 5 candidate OpenSCAD designs (Kestrel, kaefert's 250, FNQ220, mjholmes' mini quad, ASCopter H-Frame). Two were disqualified outright:

- **The Kestrel (Patshead/falcon-frames)** — turned out to be a **laser-cut carbon fiber design**, not 3D-printable. Ruled out immediately.
- **kaefert's "250" frame** — real OpenSCAD source checked line-by-line. Built for 5" props (`propeller_radius = 127/2`) with a full boxed enclosure for GPS, sonar, and OpenLog SD card — sensor gear we don't need. Heavy (thick walls, 24mm stack box) and would require gutting most of the design to fit our 3" sub-250g build. Not worth remixing.
- **mjholmes' mini quad** — designed around 1811 2900KV motors, 5" props, 15.5mm motor mount spacing. That's a completely different motor mount pattern than our 1103s (~9mm pattern). Would need a redesign, not a parameter tweak.

**ASCopter H-Frame** won because it's a lean, single flat-plate parametric design that already ships with a `motorType=20` ("1104") preset — nearly identical mount footprint to our 1103 motors (M2 screws, ~9mm hole spacing) — and every dimension (`quadWidth`, `quadLength`, `mainBodyWidth`, `bodyDepth`) is a top-level variable.

## Verified Tuning

We didn't just eyeball this — we rendered it in OpenSCAD and computed the numbers:

| Parameter | Original default | Tuned value | Why |
|---|---|---|---|
| `motorType` | 13 (brushed) | **20** (1104 preset) | Closest match to our 1103 8000KV motors |
| `quadWidth` | 65mm | **95mm** | Gives 18.8mm prop-tip clearance for 3" (76.2mm) props |
| `quadLength` | 65mm | **70mm** | Gives 13.8mm prop-tip clearance on the sides |
| `mainBodyWidth` | 25mm | **30.5mm** | Matches F4V3S Plus flight controller mounting pattern |
| `bodyDepth` | 2mm | 2mm (unchanged) | Thin plate keeps weight minimal |

**Verified weight:** Computed actual solid volume from the rendered STL (9.3 cm³) → **~11.8g at 100% solid PETG**, realistically **~6-8g printed** with normal wall count + infill. That's dramatically lighter than the GoFlyPro 3" frame estimate (38g) we'd budgeted for earlier — this buys back real weight margin against the 250g limit.

## ⚠️ One thing to verify when motors arrive

The `motorType=20` mounting holes are laid out in a "+" cross pattern (holes 4.5mm from center along X/Y axes). Some 1103/1104 motors instead use a diagonal-square pattern. **When the 1103 motors arrive, measure the screw hole positions with calipers** and adjust `fixingRadius`/`fixingRadius2` in `ASCopter_tuned.scad` if needed — it's a two-number edit, not a redesign.

## Print Settings

Same general approach as the rest of the build:

```
Material: PETG (arms/plate are structural)
Layer height: 0.2mm
Infill: 15-20%, gyroid pattern
Supports: Not expected to be needed (flat plate design)
```

## How to Modify Further

Open `ASCopter_tuned.scad` in OpenSCAD (installed at `/Applications/OpenSCAD.app`). All tunable variables are at the top of the file — this is a good file for Benjamin to poke at once he's comfortable with the electronics, since changing a number and re-rendering is immediate visual feedback for learning parametric design.

---

*Superseded content: earlier drafts of this file discussed a 5" TBS Source One frame from before the sub-250g pivot — see git history if needed. Current build target remains the sub-250g 3" build described in [SUB_250G_FPV_BUILD.md](SUB_250G_FPV_BUILD.md).*
