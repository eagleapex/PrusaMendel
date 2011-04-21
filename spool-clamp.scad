//PRUSAMendel
//Spoolclamp
//Usedforhangingafilamentspool.
//GNUGPLv2
//GregFrost

include<configuration.scad>

use<teardrop.scad>

/**
*@nameSpoolclamp
*@categoryPrinted
*@using2m8nut
*@using2m8washer
*/

module spoolclamp()
{
	outer_diameter=m8_diameter+3.3*2;
	opening_size=m8_diameter-1.5;
	angle=asin(16/50);
	
	difference()
	{
		union()
		{
			translate([-m8_diameter/2,-outer_diameter/2,outer_diameter/2])
			rotate([0,180,0])
			rotate(90)
			teardrop(h=outer_diameter,r=outer_diameter/2,$fn=18);

			translate([m8_diameter/2,0,0])
			rotate(angle)
			{
				cylinder(h=outer_diameter,r=outer_diameter/2,$fn=20);
				translate([0,-outer_diameter/2,0])
				cube([outer_diameter/2,outer_diameter,outer_diameter]);
			}
		}
	
		translate([m8_diameter/2,0,0])
		rotate(angle)
		{
			translate([0,-opening_size/2,-1])
			cube([outer_diameter/2+1,opening_size,outer_diameter+2]);
			translate([0,0,-1])
			cylinder(h=outer_diameter+2,r=m8_diameter/2,$fn=18);
		}

		translate([-m8_diameter/2,-outer_diameter/2-1,outer_diameter/2])
		rotate(90)
		teardrop(r=m8_diameter/2,h=outer_diameter+2);
	}
}

spoolclamp();