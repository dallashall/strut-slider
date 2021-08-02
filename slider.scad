use<m5.scad>
module boltHoles(railGapW = 21.25, bearingDiam = 22, bearingShaftSize = 8){
  translate([2, 0, -(bearingDiam / 2 + bearingShaftSize / 2)]){
    rotate([0, 90, 0]){
      m5NutInsert();
      // cylinder(r = bearingShaftSize / 2, h = railGapW + 2, center = true);
    }
  }
  translate([-2, 0, -(bearingDiam / 2 + bearingShaftSize / 2)]){
    rotate([180, 90, 0]){
      m5NutInsert();
      // cylinder(r = bearingShaftSize / 2, h = railGapW + 2, center = true);
    }
  }
  translate([0, bearingDiam, (bearingDiam / 2 + bearingShaftSize / 2)]){
    rotate([0, 90, 0]){
      cylinder(r = bearingShaftSize / 2, h = railGapW + 2, center = true);
    }
  }
  translate([0, -bearingDiam, (bearingDiam / 2 + bearingShaftSize / 2)]){
    rotate([0, 90, 0]){
      cylinder(r = bearingShaftSize / 2, h = railGapW + 2, center = true);
    }
  }
}

module bearingSupports(railGapW = 21.25, bearingDiam = 22, bearingShaftSize = 8){
  difference(){
    translate([0, 0, 0]){
      translate([0, 0, -(bearingDiam / 2 + bearingShaftSize / 2)]){
        rotate([0, 90, 0]){
          cylinder(r = bearingShaftSize / 2 + 2, h = railGapW, center = true);
        }
      }
      translate([0, bearingDiam, (bearingDiam / 2 + bearingShaftSize / 2)]){
        rotate([0, 90, 0]){
          cylinder(r = bearingShaftSize / 2 + 2, h = railGapW, center = true);
        }
      }
      translate([0, -bearingDiam, (bearingDiam / 2 + bearingShaftSize / 2)]){
        rotate([0, 90, 0]){
          cylinder(r = bearingShaftSize / 2 + 2, h = railGapW, center = true);
        }
      }
    }
    boltHoles(railGapW, bearingDiam, bearingShaftSize);

  }
}

module sliderBracket(railGapW = 21.25, bearingDiam = 22){
  translate([-railGapW / 2, 0, 0]){
    rotate([90, 180, 90]){
      difference(){
        difference(){
          linear_extrude(railGapW){
            polygon([
                [-bearingDiam / 2, 0],
                [-bearingDiam / 2, -bearingDiam / 2],
                [bearingDiam / 2, -bearingDiam / 2],
                [bearingDiam / 2, bearingDiam]
              ]);
          }
          translate([0, 10, railGapW / 2]){
            rotate([90, 0, 0]){
              cylinder(r = 9, h = 20, center = true);
            }
          }
        }
        translate([0, 0, railGapW / 2]){
          rotate([90, 0, 0]){
            cylinder(r = 5, h = 50, center = true);
          }
        }
      }
    }
  }
}

module slider(railGapW = 21.25, railTineHeight = 7, bearingDiam = 22, bearingHeight = 8, bearingShaftSize = 8){

  color([60 / 255, 60 / 255, 60 / 255]){
    union(){
      union(){
        difference(){
          rotate([90, 0, 0]){
            cube(size = [railGapW - 4, railTineHeight + bearingDiam * 2 + 4, bearingDiam * 3.5], center = true);
          }
          boltHoles(railGapW, bearingDiam, bearingShaftSize);
        }
        bearingSupports(railGapW - 2);
      }

      translate([0, 0, 0]){
        translate([0, 2 * bearingDiam + 5.5, 0.75 * bearingDiam]){
          sliderBracket();
        }
        translate([0, -2 * bearingDiam - 5.5, 0.75 * bearingDiam]){
          rotate([0, 0, 180]){
            sliderBracket();
          }
        }
      }
    }
  }
}

module sliderSplit(railGapW = 21.25, railTineHeight = 7, bearingDiam = 22, bearingHeight = 8, bearingShaftSize = 8) {
  $fn=50;
  difference() {
    slider(railGapW = 21.25, railTineHeight = 7, bearingDiam = 22, bearingHeight = 8, bearingShaftSize = 8);
    translate([0, 0, -bearingHeight + 1]) {
      cube(size=[railGapW, bearingDiam * 4, 3], center=true);
    }

    // height adjustment +y side
    translate([0, bearingDiam + bearingShaftSize + 4, 0]) {
      difference() {
        union() {
          cylinder(d=10, h=bearingDiam * 2, center=false);
          cylinder(d=5, h=bearingDiam * 3, center=true);
        }
      }
    }
    translate([0, bearingDiam + bearingShaftSize + 4, -14]) {
      rotate([180, 0, 90]) {
        m5NutInsert();
      }
    }

    // height adjustment -y side
    translate([0, -bearingDiam - bearingShaftSize - 4, 0]) {
      difference() {
        union() {
          cylinder(d=10, h=bearingDiam * 2, center=false);
          cylinder(d=5, h=bearingDiam * 3, center=true);
        }
      }
    }
    translate([0, -bearingDiam - bearingShaftSize - 4, -14]) {
      rotate([180, 0, -90]) {
        m5NutInsert();
      }
    }
  }
}

sliderSplit();