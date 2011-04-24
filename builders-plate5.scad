include <configuration.scad>
use <gregs-x-carriage.scad>
use <gregs-coupling.scad>


union ()
{
	rotate(180)
	gregs_x_carriage();

	for (i=[-1,1]) 
	translate([0,i*(12),0])
	belt_clamp();
	
	belt_clamp_channel();

	for (i=[0:2])
	translate([i*24-30,43,0])
	y_axis_holder();

	for (i=[0:1])
	translate([i*35-15,-58+i*10,0])
	coupling2();
}