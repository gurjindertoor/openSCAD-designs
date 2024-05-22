$fn = 32;

m3_diameter = 3.2;
m3_head_diameter = 5.5;
m3_head_height = 2.5;
m3_hole_depth = 5.5;

module m3_screw_hole() {
    translate([0, 0, -m3_head_height])
    cylinder(h = m3_head_height, d1 = m3_diameter, d2 = m3_diameter);
    cylinder(h = m3_hole_depth, d = m3_diameter);
}

// Outer cylinder dimensions
outer_diameter = 3.12;
outer_height = 3.12;

// Inner cylinder dimensions
inner_diameter = 1.87;
inner_height = 3.12;

// M2 thread dimensions
m2_diameter = 2.08;
m2_pitch = 0.416;

module cylinder_with_inner_thread() {
    difference() {
        // Outer cylinder
        cylinder(h = outer_height, d = outer_diameter);
        // Inner cylinder
        translate([0, 0, (outer_height - inner_height) / 2]) {
            difference() {
                cylinder(h = inner_height, d = inner_diameter);
                // M2 threaded hole
                translate([0, 0, inner_height / 2]) {
                    metric_thread(diameter = m2_diameter, pitch = m2_pitch, length = inner_height);
                }
            }
        }
    }
}

// Module for creating metric threads
module metric_thread(diameter, pitch, length) {
    thread_height = pitch * cos(30);
    thread_radius = diameter / 2;
    linear_extrude(height = length, twist = -360 * length / pitch, convexity = 10) {
        translate([thread_radius, 0]) {
            circle(r = thread_height / 2);
        }
    }
}


union() {
    difference() {
        cube([33.50, 51.50, 6.50]);
        translate([2.05, 2.10, 3.50]) {
            cube([29.35, 47.30, 5.00]);
        }
    }
    translate([4, 4, 2.6])
    cylinder_with_inner_thread();

    translate([29, 4, 2.6])
    cylinder_with_inner_thread();

    translate([2.05, 48, 3.5]) {
        cube([29.35, 3.5, 1.04]);
    }
    translate([32.75, 0, 0]) {
        difference() {
            linear_extrude(height = 3.12) {
                polygon(points = [[0, 6.4375], [8.76, 25.75], [0, 45.0625]]);
            }
            translate([3.12, 25.75, 0])
            m3_screw_hole();
        }
    }
    translate([0, 0, 0]) {
        difference() {
            linear_extrude(height = 3.12) {
                polygon(points = [[0, 6.4375], [-8.76, 27.31], [0, 45.0625]]);
            }
            translate([-3.12, 25.75, 0])
            m3_screw_hole();
        }
    }
}