module bearing(shaftSize = 8, outerDiameter = 22, height = 8){
    shaftRadius = shaftSize / 2;
    outerRadius = outerDiameter / 2;
  union(){
    color([100 / 255, 100 / 255, 100 / 255]){
      difference(){
        cylinder(r = outerRadius - 1, h = height - 1, center = true);
        cylinder(r = shaftRadius + 1, h = height, center = true);
      }
    }
    color([200 / 255, 200 / 255, 200 / 255]){

      difference(){
        cylinder(r = outerRadius, h = height, center = true);
        cylinder(r = outerRadius - 2, h = height + 1, center = true);
      }
      difference(){
        cylinder(r = shaftRadius + 2, h = height, center = true);
        cylinder(r = shaftRadius, h = height + 1, center = true);
      }
    }

  }
}
