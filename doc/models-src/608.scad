

diam = 22;
idiam = 8;
th = 7;

extra = 10;

module ring(id, od, th)
{
  difference() {
    cylinder(r = od/2, h = th, center = true, $fn = 100);
    cylinder(r = id/2, h = th + extra, center = true, $fn = 50);
  }
}

difference() {
  ring (id = idiam, od = diam, th = th);

  translate([0,0,3/2 + th/2 -0.5])
    ring(id = 12.5, od = 18, th = 3);

  translate([0,0, -3/2 - th/2 +0.5])
    ring(id = 12.5, od = 18, th = 3);
}