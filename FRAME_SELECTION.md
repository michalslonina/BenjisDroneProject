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

Current values (this table has been corrected twice since the frame was first tuned — see the propeller collision note below for why):

| Parameter | Original default | Tuned value | Why |
|---|---|---|---|
| `motorType` | 13 (brushed) | **20** (1104 preset) | Closest match to our 1103 8000KV motors |
| `quadWidth` | 65mm | **110mm** | Left-right motor spacing; gives 33.8mm prop-tip clearance for 3" (76.2mm) props, widened later to fit the FC mounting pad (below) |
| `quadLength` | 65mm | **90mm** | Front-to-back (same-side) motor spacing; gives 13.8mm prop-tip clearance — see correction below |
| `mainBodyWidth` | 25mm | **36mm** | Matches F4V3S Plus flight controller mounting pattern with wall margin either side |
| `bodyDepth` | 2mm | 2mm (unchanged) | Thin plate keeps weight minimal |

**Verified weight:** Computed actual solid volume from the rendered STL → **~15.6g at 100% solid PETG**, realistically **~8-11g printed** with normal wall count + infill. That's dramatically lighter than the GoFlyPro 3" frame estimate (38g) we'd budgeted for earlier — this buys back real weight margin against the 250g limit.

### ⚠️ Corrected: propellers were overlapping (found via the assembly view)

`quadLength` was originally set to 70mm using the wrong math: I checked `quadWidth` (left-right motor spacing) against the propeller diameter correctly, but for `quadLength` I checked the frame's *total plate length* (90mm, including the rounded end caps) against the propeller diameter instead of the actual *motor-to-motor spacing*, which is `quadLength` itself (70mm) — 6.2mm short of the 76.2mm prop diameter. The front and rear propeller on each arm would have physically overlapped.

This wasn't caught until building `cad/assembly/full_assembly.scad` (see `cad/MOUNTING.md`) and looking at the top-down view with propeller placeholders included — the two circles visibly overlapped. Fixed by changing `quadLength` to 90mm, matching the margin `quadWidth` already had. **Lesson: check every motor-pair distance against the prop diameter, not just one axis, and check motor-to-motor distance specifically, not the plate's outer dimensions.**

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

## Component Mounting

The frame now has real cutouts for the flight controller stack (30.5×30.5mm pattern) and battery straps — see **[cad/MOUNTING.md](cad/MOUNTING.md)** for the full writeup, including the camera mount bracket we added and what's still unverified until real components are in hand.

---

*Superseded content: earlier drafts of this file discussed a 5" TBS Source One frame from before the sub-250g pivot — see git history if needed. Current build target remains the sub-250g 3" build described in [SUB_250G_FPV_BUILD.md](SUB_250G_FPV_BUILD.md).*
