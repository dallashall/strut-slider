include<bearing.scad>

module slider(railGapW = 21.25, railTineHeight = 7, bearingDiam = 22, bearingHeight = 8){
  rotate([90, 0, 0]){
    color([60 / 255, 60 / 255, 60 / 255]){
      cube(size = [railGapW, railTineHeight + bearingDiam * 2, bearingDiam * 3], center = true);
    }
    translate([railGapW / 2 + bearingHeight / 2, 0, 0]){
      rotate([0, 90, 0]){
        bearing();
      }
    }

  }
}
slider();