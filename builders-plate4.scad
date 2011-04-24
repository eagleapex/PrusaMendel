include <configuration.scad>
use <x-end-motor.scad>
use <x-end-idler.scad>
use <gregs-x-carriage.scad>


union ()
{
	xendmotor();
	
	translate([-10,38,0]) 
	rotate(180)
	xendidler();
}