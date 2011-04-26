include <configuration.scad>
use <gregs-wade-v3.scad>
use <gregs-wadebits.scad>


union ()
{
	wade(hotend_mount=1);

	translate([78,-10,15.25]) 
	rotate([0,-90,0])
	wadeidler();

	translate([-50,35,0])
	WadesL();

	translate([-10,55,0])
	WadesS();
}