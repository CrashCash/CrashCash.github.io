// print with 10% rectilinear infill

$fa=3;
$fs=0.25;

thick=3;
width=50;
corner_radius=8;
hole_dia=20.6375;
hole_inset=15;
thumb_dia=5;
thumb_inset=6.5;

d=width/2-corner_radius;

difference() {
  hull() {
    translate([-d, corner_radius, 0])
      cylinder(h=thick, r=corner_radius);
    translate([d, corner_radius, 0])
      cylinder(h=thick, r=corner_radius);
    translate([-d, width-corner_radius, 0])
      cylinder(h=thick, r=corner_radius);
    translate([d, width-corner_radius, 0])
      cylinder(h=thick, r=corner_radius);
  }
  // large hole
  translate([0, hole_inset, -1]) {
    cylinder(h=thick+2, d=hole_dia);
  }
  // thumbscrew hole
  translate([0, width-thumb_inset, -1]) {
    cylinder(h=thick+2, d=thumb_dia);
  }
}
