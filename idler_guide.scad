// PRUSA Mendel  
// GNU GPL v2
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @name Bar clamp
 * @category Printed
 * @using 2 m8nut
 * @using 2 m8washer
 */ 

b608_diameter=22;
b608_height=9;
wall_height=5;
z_thickness=1.4;
thickness=1;
outer_radius=b608_diameter/2+wall_height+thickness;
membrane=0.6;

module idler_guide()
{
	difference()
	{
		union()
		{
			cylinder(r=outer_radius,h=z_thickness);
			cylinder(r=b608_diameter/2+thickness,h=b608_height);
			translate([0,0,b608_height-z_thickness])
			cylinder(r=outer_radius,h=z_thickness);
		}
		translate([0,0,-1])
		cylinder(r=b608_diameter/2,h=b608_height+2);
	}
}

module top_support()
{
	render()
	intersection ()
	{
		difference()
		{
			cylinder(r=outer_radius+4,h=b608_height-z_thickness+membrane);
			translate([0,0,-membrane])
			cylinder(r=outer_radius+1,h=b608_height-z_thickness+membrane);
			translate([0,0,-1])
			cylinder(r=b608_diameter/2,h=b608_height+2);
		}
		translate([-(outer_radius+4),-outer_radius,-1]) 
		cube([2*(outer_radius+4),outer_radius*2,b608_height-z_thickness+membrane+2]);
	}
}

idler_guide();
top_support ();