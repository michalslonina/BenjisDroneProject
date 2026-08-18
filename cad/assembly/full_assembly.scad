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
quadLength = 70;
mountRadius = 10;
bodyDepth = 2;
fcMountSpacing = 30.5;
batteryZoneCenterY = 13;

body_shift_y = -(quadLength/2 + mountRadius);
fc_pad_world = [quadWidth/2, (quadLength+2*mountRadius)/2 + body_shift_y];
battery_zone_world = [quadWidth/2, batteryZoneCenterY + body_shift_y];
frame_edge_y = (quadLength+2*mountRadius) + body_shift_y; // world Y of the plate's far edge (the arm end, +Y side)
motor_world = [
    [0, quadLength + -(quadLength/2)],
    [0, 0 + -(quadLength/2)],
    [quadWidth, quadLength + -(quadLength/2)],
    [quadWidth, 0 + -(quadLength/2)],
];

// ---------------------------------------------------------------------
// Real parts
// ---------------------------------------------------------------------
module frame() {
    color("gold")
    import("../frame/ASCopter_tuned.stl");
}

module camera_mount(pos, facing_angle) {
    translate(pos)
    rotate([0, 0, facing_angle]) {
        color("darkslategray")
        import("../body/Cam_Mount_Base.stl");
        color("dimgray")
        translate([0, 0, 8]) // ESTIMATE: base-to-plate stacking height, verify by test fit
        import("../body/Cam_Mount_Plate.stl");
    }
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
    cylinder(d=76.2, h=1.2, center=true);
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
// Using 60mm as a middle-of-the-road estimate -- VERIFY against the actual battery.
// Even the SHORTEST real pack (52mm) is longer than the ~27mm front zone this
// frame has available, so the battery WILL overhang the frame's edge on this
// small a build -- that's normal for micro frames this size, not a bug.
module battery_placeholder(pos) {
    color("orange")
    translate([pos.x, pos.y, bodyDepth + 14/2])
    cube([25, 60, 14], center=true); // width(X) x length(Y) x height(Z)
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
camera_mount([quadWidth/2, camera_y, bodyDepth], -90);
translate([quadWidth/2, camera_y, bodyDepth + 15])
rotate([20, 0, 0])
camera_placeholder();
