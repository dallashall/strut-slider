railWidth = 41.6;
railHeight = 41.8;
railThickness = 2.8;

module rail(length = 100){
  color([180 / 255, 170 / 255, 150 / 255]){
    rotate([90, 0, 0]){
      translate([0, 0.5 * railHeight, -length / 2]){
        linear_extrude(height = length){
          union(){
            difference(){
              difference(){
                square(size = [railWidth, railHeight], center = true);
                square(size = [railWidth - (railThickness * 2), railHeight - (railThickness * 2)], center = true);
              }
              translate([0, railWidth / 2, 0]){
                square(size = [21.25, 7], center = true);
              }
            }
            translate([0, (railHeight / 2) - (7 / 2), 0]){
              translate([(21.25 / 2) + 1.4, 0, 0]){
                square(size = [railThickness, 7], center = true);
              }
              translate([-(21.25 / 2) - 1.4, 0, 0]){
                square(size = [railThickness, 7], center = true);
              }
            }
          }
        }
      }
    }
  }
}
// rail();