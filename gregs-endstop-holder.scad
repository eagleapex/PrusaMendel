// PRUSA Mendel  
// Endstop holder
// Used to attach endstops to 8mm rods
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @name Endstop holder
 * @category Printed
 * @using 1 m3x20
 * @using 1 m3nut
 * @using 2 m3washer
 */
module endstop(){
outer_diameter = m8_diameter/2+3.3;
screw_hole_spacing = 20;
opening_size = m8_diameter-1.5; //openingsize

difference(){
	union(){


		translate([outer_diameter, outer_diameter, 0]) cylinder(h =10, r = outer_diameter, $fn = 20);
		translate([outer_diameter, 0, 0]) cube([13.5,outer_diameter*2,10]);
		translate([-33, 0, 0]) cube([42, 4, 10]);
		translate([-33.2, 0, 0]) cube([17, 4, m3_diameter+4+10.3]);
	}

	translate([9, outer_diameter-opening_size/2, -1]) cube([18,opening_size,12]);
	translate([outer_diameter, outer_diameter, -1]) cylinder(h =12, r = m8_diameter/2, $fn = 18);

	translate([14, 17, 5]) 
	rotate([90, 0, 0]) 
	{
//	translate([0,0,0.5])
	cylinder(h =3, r = m3_nut_diameter/2, $fn = 6);
	cylinder(h =20, r = m3_diameter/2, $fn = 10);
	}

	translate([-4, 17, m3_diameter/2+1]) 
	rotate([90, 0, 0]) 
	{
	cylinder(h =20, r = m3_diameter/2, $fn = 10);
	translate([0,0,12])
	cylinder(h =3, r = m3_nut_diameter/2, $fn = 6);
	}

	translate([-4-22.2, 17, m3_diameter/2+1+10.3]) 
	rotate([90, 0, 0]) 
	{
	translate([0,0,12])
	cylinder(h =3, r = m3_nut_diameter/2, $fn = 6);
	cylinder(h =20, r = m3_diameter/2, $fn = 10);
	}
}
}
endstop();

