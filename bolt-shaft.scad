use<m5.scad>

module boltShaft(bearingShaftSize = 8, bearingHeight = 22){
  $fn = 30;
  rotate([180, 0, 0]){
    translate([0, 0, -bearingHeight]){
      difference(){
        cylinder(d = bearingShaftSize, h = bearingHeight, center = false);
        m5Bolt();
      }
    }
  }

}
boltShaft();