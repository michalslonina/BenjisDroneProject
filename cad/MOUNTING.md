# Component Mounting — Frame, Camera, VTx, Battery, Flight Controller

## What we checked

Before this, the frame (`cad/frame/`) was a bare motor-mount plate — no dedicated
holes or brackets existed anywhere in the project for the flight controller stack,
camera, VTx, or battery. The docs (BOM.md, MASTER_BUILD_GUIDE.md) *mentioned*
printing a "camera mount" and "battery strap" but no actual design ever existed.
This is now fixed for FC + battery (built into the frame itself) and camera
(dedicated bracket added). VTx rides on the FC mount — see below for why.

**See the whole thing assembled:** `cad/assembly/full_assembly.scad` combines the
real frame + camera mount STLs with placeholder geometry (motors, propellers,
FC/PDB/VTX stack, battery, camera body) so you can see the full layout in one
file. Open it in OpenSCAD. Rendering it is what caught a real problem below.

## Orthogonal views (color-coded by component)

| View | File | Shows |
|---|---|---|
| Top | `cad/assembly/assembly_top.png` | Prop clearance, overall footprint |
| Front | `cad/assembly/assembly_front.png` | Left-right motor spread, stack height |
| Side | `cad/assembly/assembly_side.png` | Front-to-back length, battery overhang, camera tilt |

Color legend: frame = gold, motors = black, propellers = translucent blue,
PDB = firebrick red, FC = forest green, VTX = navy, standoffs = silver,
battery = orange, camera mount = dark gray.

**Fit check result:** this took two rounds. The first round (below, items 1-2)
looked thorough at the time but missed three real problems that a second,
more careful pass caught — noted here so the same mistakes aren't repeated.

**Round 2 — caught by actually eyeballing the rendered views closely, not just
checking the specific thing I'd just changed:**

3. **Propellers were genuinely colliding**, not just close — a real bug in
   `cad/frame/ASCopter_tuned.scad` itself, not the visualization. `quadLength`
   (70mm) was checked against the prop diameter using the wrong distance (the
   plate's total length, not the actual motor-to-motor spacing, which IS
   `quadLength`). Real motor spacing was 70mm against a 76.2mm prop diameter —
   a 6.2mm overlap. Fixed by changing `quadLength` to 90mm in the real frame
   file (see FRAME_SELECTION.md for the corrected table) and re-rendering the
   actual printable STL, not just the assembly view.
4. **The camera looked disconnected from its mount** — the camera placeholder
   cube was positioned at a Z height picked to "look about right" rather than
   computed from the mount's actual stacked height, so it partially overlapped
   the mount body instead of resting on top of it. Fixed by computing
   `cam_mount_top_z` from the mount's real measured part heights and placing
   the camera's pivot exactly on that surface (`camera_assembly()` in
   `full_assembly.scad`), then verifying contact with a tight zoomed render.
5. **The battery collided with the FC/PDB/VTX stack** — 16.25mm of overlap.
   The battery placeholder had been centered on the real frame's strap-slot
   position (`batteryZoneCenterY`, a small feature meant for a thin strap, not
   the battery's own center), without checking the battery box's full 60mm
   length against the FC pad boundary. Fixed by computing the battery's center
   directly from the FC pad's edge plus a clearance gap, instead of reusing
   the strap-slot coordinate.

**Round 1 — the two things checked before this round, both fine on
re-verification:**

1. The camera mount's first two placements (3mm past the motor center, then
   20mm past the frame edge) both still overlapped the arm and/or the FC stack
   standoffs — visible directly in the top and side renders as overlapping
   geometry. The mount's actual shape (an asymmetric clamp) reaches further
   toward the frame than its bounding box suggested. Fixed by pushing it 30mm
   past the frame edge (this distance held up in round 2 as well).
2. A low-res top-view thumbnail made the camera mount look like it was
   overlapping the propeller disc — checked with the actual numbers (mount
   footprint vs. prop swept radius) and a zoomed re-render: there's ~10-30mm
   of real clearance. Still holds after the quadLength fix.

**Takeaway:** verifying "the thing I just changed" isn't the same as verifying
the whole assembly. Round 1 confirmed the camera mount didn't hit the frame or
the propellers, but never checked propeller-vs-propeller, camera-vs-mount
attachment, or battery-vs-stack — three different pairs of parts nobody had
looked at together yet.

## Flight Controller / PDB / VTx — built into the frame

The F4V3S Plus bundle is sold as a "flytower" stack: FC, PDB, and VTx are separate
boards that bolt together vertically on 4 standoffs, all sharing the same
**30.5×30.5mm** hole pattern (confirmed via board specs: ~36×36mm board, 30.5mm
mount spacing). Because they stack on common standoffs, only the *bottom* of the
stack needs new holes cut into the frame — we don't need a separate VTx mount.

`cad/frame/ASCopter_tuned.scad` now cuts:
- A 30.5×30.5mm hole pattern (`fcMountSpacing`), centered on the plate, sized for
  M3 screws (`fcMountHoleRadius = 1.6mm` clearance)
- A clean flat pad around those holes (`fcPadMargin`) — the weight-saving hex grid
  is explicitly excluded from this zone so the stack has a solid, flat seat
  instead of resting on a fused/uneven cutout pattern

**⚠️ Verify before printing:** the search result describing the 30.5mm pattern
mentioned "M4 holes," which is unusual for this board class (M3 is standard for
30.5mm-pattern mini stacks). Measure the actual board's screw holes with calipers
when it arrives and adjust `fcMountHoleRadius` if needed.

You'll need 4× M3 nylon standoffs (length depends on stack height — start with
20-25mm, adjust once you have the boards in hand) to actually build the stack up
from the frame.

## Battery — strap slots built into the frame

Two slots (`batteryStrapSlotWidth/Length/Spacing`) are cut into the front zone of
the plate, between the front motor arms and the FC pad. A velcro/hook-and-loop
strap threads up through one slot, over the battery, and down through the other.

**⚠️ Verify before printing:** slot spacing (currently 14mm apart) was sized to
fit the available space on this small plate, not measured against the actual
850mAh 2S battery footprint. Once the battery arrives, check whether the strap
geometry actually holds it securely — the battery may need to sit slightly
forward of the plate's front edge, which is normal on micro builds this size.

## Camera — dedicated bracket added

`cad/body/Cam_Mount_Plate.stl` + `cad/body/Cam_Mount_Base.stl` — a two-piece
"universal" FPV camera mount (originally by MultiRC, Thingiverse thing:1110726),
clamped with a single M3 screw so it fits basically any small FPV camera,
adjustable to any tilt angle.

- Verified via STL bounding box: Plate is 21.5×31.7×13.5mm, Base is
  19.6×12.5×8.0mm — both comfortably smaller than our frame
- Verified weight: ~3.5g combined at 100% solid, realistically ~2-3g printed
- The F4V3S Plus bundle's camera measures 28×26×28mm — the mount's clamp should
  fit this, but **test-fit it before committing to final assembly**; this design
  isn't parametric (no OpenSCAD source was published, only STL), so it can't be
  resized in software if it doesn't fit — only filed/sanded by hand

**⚠️ Not yet solved:** how this bracket physically attaches to the ASCopter frame
(screw, zip-tie, or glue) hasn't been verified — the frame's small 4mm holes
along the plate edges (`mountingPostHoleRadius`) are sized for zip-ties and are
the most likely attachment point, but confirm this once both parts are in hand.

## Summary of what's now in `cad/`

```
cad/
├── frame/
│   ├── ASCopterHframe.scad      — original upstream source
│   ├── ASCopter_tuned.scad      — our tuned version (motor mount, FC pad, battery slots)
│   ├── ASCopter_tuned.stl       — pre-rendered, ready to slice
│   └── frame_preview.png        — top-down render for reference
├── body/
│   ├── Cam_Mount_Plate.stl      — camera mount, frame-side piece
│   └── Cam_Mount_Base.stl       — camera mount, clamp piece
├── assembly/
│   ├── full_assembly.scad       — everything combined, for visualizing the whole build
│   └── assembly_preview.png     — rendered snapshot
└── arms/                         — empty; ASCopter's arms are integral to the frame plate, not separate parts
```

## Found while building the assembly view

Putting everything in one file surfaced a real spatial conflict, not just a
rendering bug: real 850mAh 2S batteries run 52-75mm long (checked against
Tattu/RoaringTop/CNHL specs), but the front zone we carved the battery straps
into is only ~27mm deep. Even the shortest realistic battery overhangs this
frame's edge — that's normal for a build this small, but it means the battery
and the camera mount **cannot go on the same end** of the frame, or they'll
collide. `full_assembly.scad` now places them on opposite ends deliberately.
Keep this in mind if you ever revisit the battery strap slot position in
`ASCopter_tuned.scad` — it needs to stay on the end away from the camera.

## Still open

- VTx mount: assumed to ride on the FC stack standoffs (see above) — confirm once
  the F4V3S Plus bundle arrives and you can see its actual board layout
- Camera mount attachment method to the frame: not yet decided (see above)
- FC mount screw size (M3 assumed, "M4" mentioned in one source): verify with calipers
- Battery strap slot spacing: verify against actual battery footprint, and note
  the battery will overhang the frame edge on the strap side — expected, not a defect
- `full_assembly.scad` uses estimated placeholder dimensions for everything except
  the frame and camera mount (which are real STLs) — swap in real models/measurements
  as parts arrive and get measured with calipers
