use<slider.scad>
module sliderBottom() {
  difference() {
    sliderSplit();
    translate([0, 0, 100 - 5.5]) {
      cube(size=[200, 200, 200], center=true);
    }
  }
}

sliderBottom();
