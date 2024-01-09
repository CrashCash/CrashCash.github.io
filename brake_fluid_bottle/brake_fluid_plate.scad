// print with 20% rectilinear infill

$fa=3;
$fs=0.25;
epsilon=0.01;

thick=3;   // limited by valve body threads
width=50;
length=60; // limited by size of reservoir
corner_radius=8;
hole_dia=20.6375;
hole_inset=20;
thumb_dia=5;
thumb_inset=10;

dw=width/2-corner_radius;
dl=length/2-corner_radius;

difference() {
  // body
  hull() {
    translate([-dw, corner_radius, 0])
      cylinder(h=thick, r=corner_radius);
    translate([dw, corner_radius, 0])
      cylinder(h=thick, r=corner_radius);
    translate([-dw, length-corner_radius, 0])
      cylinder(h=thick, r=corner_radius);
    translate([dw, length-corner_radius, 0])
      cylinder(h=thick, r=corner_radius);
  }

  // large hole
  translate([0, hole_inset, -1]) {
    cylinder(h=thick+2, d=hole_dia);
  }

  // thumbscrew hole
  translate([0, length-thumb_inset, -1]) {
    cylinder(h=thick+2, d=thumb_dia);
  }
}
