include <configuration.scad>
use <z-motor-mount.scad>
use <rod-clamp.scad>


union ()
{
	translate([93,0,0])
	rodclamp();
	
	translate([-38,0,0]) 
	rotate(180)
	rodclamp();

	translate([54,0,8]) 
	zmotormount();

	translate([0,0,8]) 
	rotate(180)
	zmotormount();
}