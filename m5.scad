module boltHead(){
  $fn = 30;
  cylinder(r1 = 4.9, r2 = 2.5, h = 3.2, center = false);
}

module m5Bolt(length = 20){
  translate([0, 0, 3.2]){
    cylinder(r = 2.5, h = length, center = false, $fn = 30);
  }
  boltHead();
}

module m5Nut(){
  translate([0, 0, 2]){
    union(){
      cube([8, 4.6, 4], center = true);
      rotate([0, 0, 120]){
        cube([8, 4.6, 4], center = true);
      }
      rotate([0, 0, 240]){
        cube([8, 4.6, 4], center = true);
      }
    }
  }
}

module m5NutInsert(depth = 30){
    $fn=30;
    union(){
      m5Nut();
      translate([depth / 2, 0, 2]){
        rotate([90, 90, 0]){
          cube(size = [4, depth, 9.2], center = true);
        }
      }
      cylinder(r=2.5, h=20, center=false);
    }
}

m5Bolt();
// m5Nut();
// m5NutInsert();