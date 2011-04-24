include <configuration.scad>
use <bar-clamp.scad>
use <gregs_ybrac-t.scad>


union ()
{
	translate([89,55,0])
	rotate(180)
	barclamp();
	
	translate([14,35,0]) 
	rotate(90)
	barclamp();

	translate([-4,35,0]) 
	rotate(90)
	barclamp();

	translate([4,32,0]) 
	rotate(180)
	barclamp();

	translate([89,35,0]) 
	rotate(180)
	barclamp();

	translate([89,15,0]) 
	rotate(180)
	barclamp();

	ybract();
}