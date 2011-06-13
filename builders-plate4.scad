include <configuration.scad>
use <x-end-motor.scad>
use <x-end-idler.scad>
use <gregs-x-carriage.scad>


union ()
{
	xendmotor(curved_sides=true,closed_end=true);
	
	translate([-10,33,0]) 
	rotate(180)
	xendidler(curved_sides=true,closed_end=false);
}