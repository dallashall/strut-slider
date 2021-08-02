use<slider.scad>
module sliderTop() {
  difference() {
    sliderSplit();
    translate([0, 0, -100 - 8]) {
      cube(size=[200, 200, 200], center=true);
    }
  }
}

sliderTop();
