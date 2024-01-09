// print with 10% rectilinear infill

$fa=3;
$fs=0.25;
epsilon=0.01;

shell_dia=49.5; // inside diameter of front brake fluid reservoir top
shell_thk=3;    // shell thickness
shell_hgt=8.5;  // height of lip
bolt_off=20;    // bolt offsets
bolt_dia=4.1;   // bolt hole size
bottle_dia=20.6375;

difference() {
  // main body
  cylinder(h=shell_hgt+shell_thk, d=shell_dia+shell_thk);
  translate([0, 0, shell_thk]) {
    cylinder(h=shell_hgt+shell_thk, d=shell_dia);
  }
  // bottle hole
  cylinder(h=shell_thk, d=bottle_dia);
  // bolt hole
  translate([0, bolt_off, 0]) {
    cylinder(h=shell_thk, d=bolt_dia);
  }
  // bolt hole
  translate([0, -bolt_off, 0]) {
    cylinder(h=shell_thk, d=bolt_dia);
  }
}
