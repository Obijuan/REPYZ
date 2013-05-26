horn_diam = 21;
horn_th = 2.2;

shaft_diam = 8;
shaft_th = 3;
shaft_drill = 3;

top_th = 1;
top_diam1 = 8;
top_diam2 = 6; 

extra = 10;

difference() {

  //-- MAin body
  union() {
  
    //-- Rounded horn
    cylinder(r = horn_diam/2, h = horn_th, center = true, $fn = 100);

    //-- Top part
    translate([0,0, top_th/2 + horn_th/2])
    cylinder(r2 = top_diam2/2, r1 = top_diam1/2, h = 1, center = true, $fn = 50);

    //-- Shaft
    translate([0,0,-horn_th/2 - shaft_th/2])
    cylinder(r = shaft_diam/2, h = shaft_th, center = true, $fn = 50);

  }
  
  //-- Drill
  cylinder(r = shaft_drill/2, h = shaft_th + horn_th + top_th + extra, center = true, $fn =20);

}


