include<rail.scad>
include<bearing.scad>
include<slider.scad>

module bearings(railTineHeight = 7, bearingDiam = 22, bearingHeight = 8, bearingShaftSize = 8){
  translate([0, bearingDiam / 2 + railTineHeight / 2, bearingDiam]){
    rotate([0, 90, 0]){
      bearing(bearingShaftSize, bearingDiam, bearingHeight);
    }
  }
  translate([0, bearingDiam / 2 + railTineHeight / 2, -bearingDiam]){
    rotate([0, 90, 0]){
      bearing(bearingShaftSize, bearingDiam, bearingHeight);
    }
  }
  translate([0, -bearingHeight - railTineHeight, 0]){
    rotate([0, 90, 0]){
      bearing(bearingShaftSize, bearingDiam, bearingHeight);
    }
  }
}

module assembly(railGapW = 21.25, railTineHeight = 7, bearingDiam = 22, bearingHeight = 8, bearingShaftSize = 8){
  rotate([90, 0, 0]){
    translate([railGapW / 2 + bearingHeight / 2 + 0.5, 0, 0]){
      bearings(railTineHeight, bearingDiam, bearingHeight, bearingShaftSize);
    }
    translate([-(railGapW / 2 + bearingHeight / 2 + 0.5), 0, 0]){
      bearings(railTineHeight, bearingDiam, bearingHeight, bearingShaftSize);
    }
  }
  slider();
  translate([0, 0, -railHeight + 0.5 * railTineHeight]) {
    rail();
  }
}

assembly();