//-----------------------------------------------------------------------
//-- REPYZ modules
//-----------------------------------------------------------------------
//-- (c) Juan Gonzalez-Gomez (Obijuan). May-2013
//-- REPYZ modules derives from:
//--
//--  REPY V1 (obijuan) http://www.thingiverse.com/thing:13442
//--  REPY v2, by David Estevez: https://github.com/David-Estevez/REPY-2.0
//-------------------------------------------------------------------------
//-- Released under the GPL license
//-------------------------------------------------------------------------

use <obiscad/bcube.scad>
use <obiscad/bevel.scad>
use <obiscad/attach.scad>

//-- Constants for indexing vector components
X = 0;
Y = 1;
Z = 2;

//------------------------------------------------------------------
//--       USER AREA.  Change the parameters to fit your needs
//------------------------------------------------------------------

//-------------  Base parameters
base_side = 52;
base_th = 3;      //-- Base thickness
base_cr = 3;      //-- Base corner radius
base_cres = 4;    //-- Base corner resolution

//------------ Servo parameters
ear_size = [2.5, 18, 7.4];  //-- Servo ears size

//-- Distance between the top and lower servo ears
ear_dx = 23.8;

//----------- Feet parameters 
foot_th = 6;
foot_ly = 23;           //-- Feet length in the y axis
foot_drill_diam = 3.2;  
foot_drill_h = 1.6;     //-- Drills height form the module base
foot_drill_dx_m = 6.6;  //-- Distance between the two drills

//--------- Captive nuts
nut_h = 3;
nut_radius = 6.6/2;   

//--- SKYMEGA Drills
sky_dd = 15;            //-- Distance
sky_drill_diam = 3.2;   //-- Drill diam

//------------------------------------------------------------------
//--    DATA AREA.  More parameters calculated from the user params
//------------------------------------------------------------------

//---------  BASE
base_size = [base_side, base_side, base_th];


//--------- Feet calculations
foot_size = [foot_th + ear_size[X], foot_ly, ear_size[Z]];

//-- Distance between the center of the two
//-- foot drills
foot_drill_dx = foot_drill_dx_m + foot_drill_diam;

//-- Distance between the two feet (along x axis)
feet_dx = ear_dx - 2 * foot_th;

//-- Feet location coordinates
foot_pos = [foot_size[X]/2 + feet_dx/2,
            0,
            foot_size[Z]/2 + base_size[Z]/2 - 0.01];
            
//-- temp value used for intersections
extra = 5;

//--- Create the skymega drill table
sky_drill_table = [
  [sky_dd, sky_dd, 0],
  [-sky_dd, sky_dd, 0],
  [-sky_dd, -sky_dd, 0],
  [sky_dd, -sky_dd, 0],
];


//--- Center cutouts
co1_size = [feet_dx, foot_size[Y], base_size[Z]+extra];

//-- Feet reinforment (in x direction)
//-- Define the connectors

//-- Reinforments x-direction thickness
rx_th = (foot_size[Y]-ear_size[Y])/2;
rx_pos = [-foot_size[X]/2, ear_size[Y]/2 + rx_th/2, -foot_size[Z]/2];

rx_ec1 = [ [rx_pos[X], rx_pos[Y], rx_pos[Z]], [0,1,0], 0];
rx_en1 = [ rx_ec1[0], [-1,0,1], 0];

rx_ec2 = [ [rx_pos[X], -rx_pos[Y], rx_pos[Z]], [0,-1,0], 0];
rx_en2 = [ rx_ec2[0], [-1,0,1], 0];


//-- Reinforments in the y direction
ry_th = foot_size[X] - ear_size[X];
ry_pos = [ear_size[X]/2, foot_size[Y]/2, -foot_size[Z]/2];

ry_ec1 = [ [ry_pos[X], ry_pos[Y], ry_pos[Z]], [-1,0,0], 0];
ry_en1 = [ ry_ec1[0], [0,1,1], 0];

ry_ec2 = [ [ry_pos[X], -ry_pos[Y], ry_pos[Z]], [1,0,0], 0];
ry_en2 = [ ry_ec2[0], [0,-1,1], 0];


//-- For debuging
*connector(rx_ec1);
*connector(rx_en1);
*connector(ry_ec4);
*connector(ry_en4);

//----------------------------------------------------------------------- 
//-                    PART building
//-----------------------------------------------------------------------

module foot()
{

  nut_co = nut_h + extra;
  
  ear_co_size = [ear_size[X]+extra, ear_size[Y], ear_size[Z]+extra];
  foot_drill_pos = [0, 
               foot_drill_dx/2, 
               -foot_size[Z]/2 + foot_drill_diam/2 + foot_drill_h];

  union() {
  
    //-- Foot
    difference() {
      //-- Main foot body
      cube(foot_size, center = true);
    
      //-- space for the servo ear
      translate([-ear_co_size[X]/2 - foot_size[X]/2 + ear_size[X],
		0,
		0])
      cube(ear_co_size, center = true);
      
      //-- Foot drills
      translate(foot_drill_pos)
      rotate([0, 90, 0])
      cylinder(r = foot_drill_diam/2, h = foot_size[X] + extra, center = true);

      translate([foot_drill_pos[X], -foot_drill_pos[Y], foot_drill_pos[Z]])
      rotate([0, 90, 0])
      cylinder(r = foot_drill_diam/2, h = foot_size[X] + extra, center = true);
      
      //-- Embebed nuts
      translate([nut_co/2 + foot_size[X]/2 - nut_h,
		foot_drill_dx/2,
		  foot_drill_pos[Z]])
      rotate([0,90,0])
      rotate([0,0,90])
      cylinder(r = nut_radius, h = nut_co, center = true, $fn=6);
  
      translate([nut_co/2 + foot_size[X]/2 - nut_h,
		-foot_drill_dx/2,
		  foot_drill_pos[Z]])
      rotate([0,90,0])
      rotate([0,0,90])
      cylinder(r = nut_radius, h = nut_co, center = true, $fn=6);
      
    }
  
    //-- X-reinforments
    bconcave_corner_attach(rx_ec1, rx_en1, l=rx_th, cr=foot_size[Z], cres=0, th=0.1);
    bconcave_corner_attach(rx_ec2, rx_en2, l=rx_th, cr=foot_size[Z], cres=0, th=0.1);

    //-- Y-reinforments
    bconcave_corner_attach(ry_ec1, ry_en1, l=ry_th, cr=foot_size[Z], cres=0, th=0.1);
    bconcave_corner_attach(ry_ec2, ry_en2, l=ry_th, cr=foot_size[Z], cres=0, th=0.1);
  
  }

}

module repyz_body()
{

  difference() {
    //-- The base
    bcube(base_size, cr = base_cr, cres = base_cres);
    
    //-- Skymega drills
    for (drill = sky_drill_table) {
      translate(drill)
	cylinder(r=sky_drill_diam/2, h=base_size[Z]+extra,center=true, $fn=6);
    }
    
    //-- Central cutout
    bcube(co1_size, cr = base_cr, cres = base_cres);

  }  
    
  //-- The feet

  //-- Right foot
  translate(foot_pos)
  rotate([0,0,180])
  foot();

  //-- Left foot
  translate([-foot_pos[X], foot_pos[Y], foot_pos[Z]])
  foot();
}


//----------------------------------------------------
//--    MAIN  
//----------------------------------------------------
repyz_body();


