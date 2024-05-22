$fn = 100;  // Set the number of fragments for smoother surface

height = 10.5;  // Set the desired height of the bottom half sphere
radius = 12.43;  // Set the radius of the sphere

m3_diameter = 3.2;
m3_head_diameter = 6.5;
m3_hole_depth = height + 3;  // Set the hole depth to the height of the bottom half sphere plus 3 units
m3_head_height = 0.9 * m3_hole_depth;  // Set the screw head height to 3/4 of the hole depth

module m3_screw_hole() {
    translate([0, 0, -m3_hole_depth])
    cylinder(h = m3_hole_depth + height, d = m3_diameter);
    
    translate([0, 0, -m3_hole_depth])
    cylinder(h = m3_head_height, d1 = m3_head_diameter, d2 = m3_head_diameter);
}

difference() {
    intersection() {
        sphere(r = radius);  // Create a sphere with the specified radius
        
        translate([0, 0, -height/2])
        cube([2*radius, 2*radius, height], center=true);  // Create a cube to intersect with the sphere
    }
    
    m3_screw_hole();  // Subtract the M3 screw hole from the bottom half sphere
}