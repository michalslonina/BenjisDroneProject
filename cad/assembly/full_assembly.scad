// Full drone assembly -- visualization only
//
// Combines the real frame + camera mount STLs with placeholder geometry for
// parts we don't have real models for yet (motors, propellers, FC/PDB/VTX
// stack, battery, camera body). Placeholder dimensions are best estimates --
// see the "ESTIMATE" comments below. Swap them for real models as parts
// arrive and get measured.
//
// Open this in OpenSCAD: /Applications/OpenSCAD.app

$fn = 40;

// ---------------------------------------------------------------------
// Frame geometry constants -- MUST match cad/frame/ASCopter_tuned.scad.
// Duplicated here (not include'd) because the frame file's own geometry
// runs at include-time and we only want its computed positions, not a
// second copy of the frame rendered from source.
// ---------------------------------------------------------------------
quadWidth = 110;
quadLength = 90; // FIXED from 70 -- see cad/frame/ASCopter_tuned.scad. 70mm gave adjacent
// (same-side) props only 70mm center spacing against a 76.2mm prop diameter: a 6.2mm
// overlap that was never checked, only the left-right (quadWidth) spacing was verified.
mountRadius = 10;
bodyDepth = 2;
fcMountSpacing = 30.5;
fcPadMargin = 3; // MUST match ASCopter_tuned.scad's fcPadMargin
batteryZoneCenterY = 13;
propDia = 76.2;

body_shift_y = -(quadLength/2 + mountRadius);
fc_pad_world = [quadWidth/2, (quadLength+2*mountRadius)/2 + body_shift_y];
fc_pad_half = fcMountSpacing/2 + fcPadMargin;
frame_edge_y = (quadLength+2*mountRadius) + body_shift_y; // world Y of the plate's far edge (the arm end, +Y side)
motor_world = [
    [0, quadLength + -(quadLength/2)],
    [0, 0 + -(quadLength/2)],
    [quadWidth, quadLength + -(quadLength/2)],
    [quadWidth, 0 + -(quadLength/2)],
];

// Battery center is COMPUTED to clear the FC pad, not guessed -- an earlier version
// reused the real frame's strap-slot center (batteryZoneCenterY) directly for the
// placeholder box's center, without checking the box's own length against the pad.
// That put 16.25mm of the battery box inside the FC pad's footprint.
battery_length = 60; // see battery_placeholder() below for the real-world range this represents
battery_gap_from_pad = 3;
battery_zone_world = [quadWidth/2, fc_pad_world.y - fc_pad_half - battery_gap_from_pad - battery_length/2];

// ---------------------------------------------------------------------
// Real parts
// ---------------------------------------------------------------------
module frame() {
    color("gold")
    import("../frame/ASCopter_tuned.stl");
}

// Base bounding-box height is 8.0mm (measured from the STL) -- the plate sits
// directly on top of it, so this stacking height isn't a separate guess.
cam_base_h = 8.0;
cam_plate_h = 13.5;
cam_mount_top_z = cam_base_h + cam_plate_h; // height above pos.z where the plate's top surface sits

module camera_mount(pos, facing_angle) {
    translate(pos)
    rotate([0, 0, facing_angle]) {
        color("darkslategray")
        import("../body/Cam_Mount_Base.stl");
        color("dimgray")
        translate([0, 0, cam_base_h])
        import("../body/Cam_Mount_Plate.stl");
    }
}

// Places the camera body so its bottom face sits ON the mount's top surface and
// tilts around that contact edge -- not floating at an independently-guessed
// height. An earlier version placed the camera cube at a Z picked to "look about
// right," which put roughly half the cube buried inside the mount body instead of
// resting on it, and read as visually disconnected in the rendered views.
module camera_assembly(pos, facing_angle, tilt_deg) {
    camera_mount(pos, facing_angle);
    translate([pos.x, pos.y, pos.z + cam_mount_top_z])
    rotate([0, 0, facing_angle])
    rotate([tilt_deg, 0, 0])
    translate([0, 0, 14]) // camera_placeholder()'s own half-height, so it pivots on its bottom face
    camera_placeholder();
}

// ---------------------------------------------------------------------
// Placeholders -- real models don't exist yet, dimensions are estimates
// ---------------------------------------------------------------------

// 1103 motor: ESTIMATE ~13mm bell diameter, ~15mm body height, 1.5mm shaft
module motor_placeholder() {
    color("black") {
        cylinder(d=13, h=15);
        translate([0, 0, 15]) cylinder(d=1.5, h=8);
    }
}

// Gemfan Hurricane 3016 propeller: 76.2mm (3") diameter, thin for visualization
module propeller_placeholder() {
    color("dodgerblue", alpha=0.4)
    cylinder(d=propDia, h=1.2, center=true);
}

// F4V3S Plus flytower stack: FC + PDB + VTX, ESTIMATE 36x36mm boards,
// 1.6mm thick, stacked on M3 standoffs. VERIFY board spacing when it arrives.
module fc_pdb_vtx_stack(pos) {
    board_size = 36;
    board_t = 1.6;
    standoff_gap = 8; // ESTIMATE
    standoff_d = 3;

    translate([pos.x, pos.y, bodyDepth]) {
        // 4 standoffs running the full stack height
        color("silver")
        for (dx = [-fcMountSpacing/2, fcMountSpacing/2])
            for (dy = [-fcMountSpacing/2, fcMountSpacing/2])
                translate([dx, dy, 0])
                cylinder(d=standoff_d, h=standoff_gap*2 + board_t*3);

        // PDB (bottom board)
        color("firebrick")
        translate([0, 0, 0])
        cube([board_size, board_size, board_t], center=true);

        // FC (middle board)
        color("forestgreen")
        translate([0, 0, standoff_gap + board_t])
        cube([board_size, board_size, board_t], center=true);

        // VTX (top board)
        color("navy")
        translate([0, 0, (standoff_gap + board_t) * 2])
        cube([board_size, board_size, board_t], center=true);
    }
}

// 850mAh 2S battery: real packs run 52-75mm long x 17-31mm wide x 14-15mm tall
// depending on brand/pack style (checked against Tattu/RoaringTop/CNHL specs).
// Using battery_length=60mm as a middle-of-the-road estimate -- VERIFY against
// the actual battery. Even the SHORTEST real pack (52mm) is longer than the
// front zone available before the FC pad, so the battery WILL overhang the
// frame's edge on this small a build -- that's normal for micro frames this
// size, not a bug (battery_zone_world above already accounts for this and
// keeps the box clear of the FC pad).
module battery_placeholder(pos) {
    color("orange")
    translate([pos.x, pos.y, bodyDepth + 14/2])
    cube([25, battery_length, 14], center=true); // width(X) x length(Y) x height(Z)
}

// F4V3S Plus bundle camera: 28x26x28mm per bundle spec
module camera_placeholder() {
    color("dimgray", alpha=0.85)
    cube([28, 26, 28], center=true);
}

// ---------------------------------------------------------------------
// Assembly
// ---------------------------------------------------------------------
frame();

fc_pdb_vtx_stack(fc_pad_world);

battery_placeholder(battery_zone_world);

for (pos = motor_world) {
    translate([pos.x, pos.y, bodyDepth])
    motor_placeholder();

    translate([pos.x, pos.y, bodyDepth + 15 + 6])
    propeller_placeholder();
}

// Camera mount at the OPPOSITE end of the frame from the battery slots --
// deliberately, not incidentally: an early version of this file placed the
// camera at the same end as the battery, and rendering it revealed the two
// would physically collide (a 850mAh pack is longer than the front zone).
//
// It also needs to clear the frame's own edge: the first fix only pushed it
// 3mm past the motor CENTER (still well inside the plate), and orthogonal
// renders showed the mount overlapping both the arm and the FC stack
// standoffs. 20mm past the edge still wasn't enough -- the mount's real
// shape (an asymmetric clamp, not a simple box) reaches further toward the
// frame on one side than its bounding box suggested, and a zoomed render
// still showed contact. Pushed to 30mm clearance, which visibly separates
// in the same zoomed check -- but this is still bounding-box-level
// confidence, not a real test fit. VERIFY once the mount and camera are in
// hand (see cad/MOUNTING.md).
camera_y = frame_edge_y + 30;
camera_assembly([quadWidth/2, camera_y, bodyDepth], -90, 20);
