use <obiscad/bcube.scad>

X = 0;
Y = 1;
Z = 2;

//----------------- USER parameters ------------------
base_side = 52;
base_th = 3;
base_cr = 2;
base_cres = 4;

ear_lx = 23.8;
ear_lz = 7.4;

foot_th = 6;
foot_size = [foot_th, 20, ear_lz];

foot_drill_diam = 3.2;

//-- Distance between the center of the two
//-- foot drills
foot_drill_dx = 6.6 + foot_drill_diam;

//---- DATA calculation
base_size = [base_side, base_side, base_th];

//-- Distance in x between the two feet
feet_dx = ear_lx - 2 * foot_th;

//-- Feet location coordinates
foot_pos = [foot_size[X]/2 + feet_dx/2,
            0,
            foot_size[Z]/2 + base_size[Z]/2];

//-- captive Nuts
nut_h = 3;
nut_radius = 6.6/2;            
            
extra = 5;            

module foot()
{

  nut_co = nut_h + extra;

  difference() {
    //-- Main foot body
    cube(foot_size, center = true);
    
    //-- Foot drills
    translate([0, foot_drill_dx/2, 0])
    rotate([0, 90, 0])
    cylinder(r = foot_drill_diam/2, h = foot_size[X] + extra, center = true);

    translate([0, -foot_drill_dx/2, 0])
    rotate([0, 90, 0])
    cylinder(r = foot_drill_diam/2, h = foot_size[X] + extra, center = true);
    
    //-- Embebed nuts
    translate([nut_co/2 + foot_size[X]/2 - nut_h,
               foot_drill_dx/2,
                0])
     rotate([0,90,0])
     rotate([0,0,90])
     cylinder(r = nut_radius, h = nut_co, center = true, $fn=6);
 
     translate([nut_co/2 + foot_size[X]/2 - nut_h,
               -foot_drill_dx/2,
                0])
     rotate([0,90,0])
     rotate([0,0,90])
     cylinder(r = nut_radius, h = nut_co, center = true, $fn=6);
    
  }  
}
 
//foot(); 


 
//--------- PART building -----------------

//-- The base
bcube(base_size, cr = base_cr, cres = base_cres);

//-- The feet

//-- Right foot
translate(foot_pos)
rotate([0,0,180])
foot();

//-- Left foot
translate([-foot_pos[X], foot_pos[Y], foot_pos[Z]])
foot();





