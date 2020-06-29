$fs=0.01;
$fa=1;

thick=3;
radius_corner=6.35;    // 1/4"
radius_thumb=2;        // 1/8"
radius_hole=20.6375/2; // 7/8"
inset_thumb=6.35;      // 1/4"
inset_hole=12.7;       // 1/2"
width=50.8;            // 2"

d=width/2-radius_corner;

difference() {
     hull() {
          translate([-d, radius_corner, 0]) cylinder(h=thick, r=radius_corner);
          translate([d, radius_corner, 0]) cylinder(h=thick, r=radius_corner);
          translate([-d, width-radius_corner, 0]) cylinder(h=thick, r=radius_corner);
          translate([d, width-radius_corner, 0]) cylinder(h=thick, r=radius_corner);
     }
     // large hole
     translate([0, inset_hole, -1]) cylinder(h=thick+2, r=radius_hole);
     // thumbscrew hole
     translate([0, width-inset_thumb, -1]) cylinder(h=thick+2, r=radius_thumb);
}
