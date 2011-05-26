// PRUSA Mendel  
// GNU GPL v2
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

cable_clamp ();

module cable_clamp()
{
rotate([90,0,0])
union()
{
	difference()
	{
		cube([10,10,6]);
		
		translate([5.5,5,-1])
		rotate(360/16)
		cylinder(r=1/8*25.4/2+0.1,h=8,$fn=8);

		translate([5.5,5,4])
		cylinder(r=6.2/2,h=3,$fn=6);
	}
	
	translate([-7,0,2])
	rotate([-90,0,0])
	difference()
	{
		cylinder(r=8,h=10);
		translate([0,0,-1])
		cylinder(r=4,h=12);
		translate([-9,2,-1])
		cube([18,12,12]);
	}
}
}