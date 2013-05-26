X = 0;
Y = 1;
Z = 2;


len = 7.3;
diam = 2.5;

head_diam = 5.3;
head_th = 1.8;

extra = 5;

cross_size = [2.3, 0.7, extra];

module cross()
{
  cube(cross_size, center = true);

  rotate([0,0,90])
    cube(cross_size, center = true);
}

module head()
{

  difference() {
    cylinder(r=head_diam/2, h = head_th, center = true, $fn=50);
    
    translate([0,0, cross_size[Z]/2])
      cross();
 }     

}


cylinder(r=diam/2, h = len, center = true, $fn=30);
translate([0,0,head_th/2 + len/2 -0.1])
head();
