// Ausxmods Pulley by Greg Frost (http://www.thingiverse.com/thing:7218).
// Based on Belt pulley http://www.thingiverse.com/thing:3104 by GilesBathgate.
// GPLV3

include <configuration.scad>

/**
 *@name Pulley
 *@using 1 m3nut
 *@using 1 m3x10
 */
module pulley()
{
	module spur()
	{
		linear_extrude(height=20) 
		polygon([[-1.5,-0.8],[-1.5,0.8],[0.35,0.55],[0.35,-0.55]],[[0,1,2,3,0]]);
	}
	
	 difference()
	 {	 
	 	union()
	 	{
	 		//base
	 		rotate_extrude($fn=30)
	 		{
	 				square([9,8]);
	 				square([10,7]);
	 				translate([9,7]) circle(1);
	 		}
	    	
		    	//shaft
		    	cylinder(r=motor_shaft-0.8,h=20, $fn=8);
		    	
		    	//spurs
		#    	for(i=[1:8]) rotate([0,0,i*(360/8)])
		    	translate([5.6,0,0])spur();
		}
	
	   	//shaft hole
		translate([0,0,-1])cylinder(r=motor_shaft/2+0.1-0.25,h=22,$fn=15);
	
		//captive nut and grub holes
//		for(j=[1:1]) rotate([0,0,j*(360/3)])
//		translate([0,20,4])rotate([90,0,0])
//		union()
//		{
//			//entrance
//			translate([0,-3,15]) cube([8.6,7,3],center=true);
//			//nut
//			translate([0,0,13.6]) rotate([0,0,30])cylinder(r=4.22,h=2.8,$fn=6);
//			//grub hole
//			translate([0,0,9]) cylinder(r=1.9,h=10);
//		}
	}
}

// Show the original pulley as a shadow.
//translate([0,0,-1])
//%import_stl("pulley.stl");

module ausxmods()
{
	translate([0,0,-17/2+3])
	difference()
	{
		pulley();
		translate([0,0,-3])
		cube([27,27,17],true);

		translate([0,0,27])
		cube([27,27,17],true);
	}
}

ausxmods ();