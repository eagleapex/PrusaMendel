// PRUSA Mendel  
// motor/leadscrew coupling
// Used for connecting motor to leadscrew
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
include <configuration.scad>

/**
 * @name Coupling
 * @category Printed
 * @using 1 m3x25
 * @using 1 m3nut
 * @using 2 m3washer
 */
module coupling()
{
	difference()
	{
		render()
		intersection ()
		{
			union()
			{
				cylinder(h = 30, r=7);
				translate(v = [0, 6, 15]) cube(size = [14,12,30], center = true);
			}
			translate([0,0,-1])
			cylinder(r=12.3,h=32);
		}
		
		// inside diameter
		translate(v = [0, 0, -1])cylinder(h = 16, r=motor_shaft/2, $fn=16);
		translate(v = [0, 0, 14.5])cylinder(h = 16, r=m8_diameter/2, $fn=16);
		
		// screw holes
		for (hole=[-1,1])
		{
		rotate ([0,0,90]) translate(v = [6.5, 15, 15+7.5*hole]) rotate ([90,0,0]) 
		cylinder(h = 30, r=m3_diameter/2, $fn=16);
		rotate ([0,0,90]) translate(v = [6.5, 12-2, 15+7.5*hole]) rotate ([90,0,0]) 
		cylinder(h = 5, r=m3_nut_diameter/2, $fn=6);
		rotate ([0,0,90]) translate(v = [6.5, 12-14-5+2, 15+7.5*hole]) rotate ([90,0,0]) 
		cylinder(h = 5, r=m3_nut_diameter/2+0.1, $fn=16);
		}
				
		//main cut
		translate(v = [0, 10, 14]) cube(size = [2,20,35], center = true);
		
		//difference cut
		intersection ()
		{
		translate(v = [0, 7, 15])  cube(size = [20,8,1], center = true);
		translate([0,0,14])
		cylinder(r=11.5,h=3);
		}
	}
}

//coupling();

coupling2();

/**
 * @name Coupling
 * @category Printed
 * @using 1 m3x25
 * @using 1 m3nut
 * @using 2 m3washer
 */
module coupling2()
{
	difference()
	{
		union()
		{
//		render()
		difference ()
		{
			intersection()
			{
				cylinder($fn=80,r=m8_nut_diameter/2+6.7,h=15);
				cylinder($fn=6,r=m8_nut_diameter/2+8,h=15);
			}
			translate([0,0,-1])
			cylinder(r=m8_nut_diameter/2+1,$fn=6,h=12);

			for (chamfer=[0:5])
			rotate(chamfer*60)
			translate([-10,(m8_nut_diameter/2+8)*cos(30)-5,15-5])
			difference()
			{
				cube([20,6,6]);
				rotate([0,90,0])
				translate([0,0,-1])
				cylinder(r=5,h=22);
			}
		}

		translate([0,0,15])
#		render()
		intersection ()
		{
			translate([0,0,-3])
			union()
			{
				cylinder(h = 18, r=7);
				translate(v = [0, 6, 7.5]) cube(size = [14,12,21], center = true);
			}
			translate([0,0,-1])
			cylinder(r=11.8,h=32);
		}
		}
		
		// inside diameter
		translate(v = [0, 0, 15])cylinder(h = 16, r=motor_shaft/2, $fn=16);
		
		// screw holes
		rotate ([0,0,90]) translate(v = [6, 15, 7.5+15]) rotate ([90,0,0]) 
		rotate(360/16)
		cylinder(h = 30, r=m3_diameter/2, $fn=8);
		rotate ([0,0,90]) translate(v = [6, 12-2, 7.5+15]) rotate ([90,0,0]) 
		cylinder(h = 5, r=m3_nut_diameter/2, $fn=6);
		rotate ([0,0,90]) translate(v = [6, 12-14-5+2, 7.5+15]) rotate ([90,0,0]) 
		cylinder(h = 5, r=m3_nut_diameter/2+0.1, $fn=16);

		//setscrews.
		for (hole=[0:2])
		translate([0,0,6])
		rotate(hole*120)
		rotate([90,0,0])
		translate([0,0,m8_nut_diameter/2*cos(30)])
		{
			rotate(360/16)
			cylinder(r=m3_diameter/2,h=14,$fn=8);
			cylinder(r=m3_nut_diameter/2,h=4,$fn=6);
		}
		//main cut
		translate(v = [0, 10, 8+15]) cube(size = [2,20,16], center = true);
		
		//difference cut
		render()intersection ()
		{
			translate(v = [0, 7, 15.5])  cube(size = [20,8,1], center = true);
			translate([0,0,14.5])
			cylinder(r=11,h=3);
		}
	}
}
