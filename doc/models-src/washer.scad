washer_diam = 8.4;
washer_th = 1.4;
washer_odiam = 15.9;

difference() {
  cylinder(r = washer_odiam/2, h = washer_th, center = true, $fn = 100);
  cylinder(r = washer_diam/2,  h = washer_th+10, center = true, $fn = 80);
}

