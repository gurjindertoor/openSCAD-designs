$fn=32;

m3_diameter = 3.2;
m3_head_diameter = 5.5;
m3_head_height = 2.5;
m3_hole_depth = 5.5;

module m3_screw_hole() {
    translate([0, 0, -m3_head_height])
    cylinder(h = m3_head_height, d1 = m3_diameter, d2 = m3_diameter);
    cylinder(h = m3_hole_depth, d = m3_diameter);
}


union(){
    // cube 1 with hole
    rotate([0, 0, 90]) {
        translate([0, -19, 0]) {
            color("red") {
                difference() {
                    cube([22, 18, 3]);
                    translate([11, 9, -1]) {
                        m3_screw_hole();
                    }
                }
            }
        }
        
        // cube 2 with hole
    translate([0, -80, 0]){
        color("red") {
            difference() {
                cube([22, 18, 3]);
                translate([11, 9, -1]) {
                    m3_screw_hole();
                }
            }
        }
    }
    }


    // cube 3 (yellow)
    rotate([0, 0, 90]) {
        translate([0, -19, 1]){
            rotate([90, 0, 0]) {
                translate([0, -1, 0]) {
                    cube([22, 22.5, 3]);
                }
            }
        }
    }

    // cube 4 (yellow)
    rotate([0, 0, 90]) {
        translate([0, -59, 1]){
            rotate([90, 0, 0]) {
                translate([0, -1, 0]) {
                    cube([22, 22.5, 3]);
                }
            }
        }
    }

    // cube 5 (blue)
    rotate([0, 0, 90]) {
        translate([0, -59, 19.5]){
            color("blue"){
                cube([22, 37, 3]);
            }
        }
    }
}


/*
// battery (green)
translate([22, -22, 0]){
    color("green"){
        cube([37, 68, 19]);
    }
}
*/