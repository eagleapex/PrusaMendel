// PRUSA Mendel  
// X-end prototype for
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
corection = 1.17; 
use <bushing.scad>
use <teardrop.scad>

axis_diameter_real=4;
axis_diameter_larger=4.5;
add_strength=true;
xend_height=15.8;
xend_length=40;
solid_end_width=3;
slot_width=1;

pad_height=5.2;
pad_width=7;
pad_connector_height=3.3;
bushing_support_width=17;
rod_support_width=10;

module xend_side(closed_end=true,curved_sides=false)
{
	translate([25,0,0])
	difference ()
	{
		union()
		{
			if (curved_sides)
			{
				for (i=[0:1])
				rotate(90) 
				rotate([180*i,0,0])
				teardrop(r=xend_height/2,h=xend_length);
			}
			else
			{
				difference ()
				{
					translate([0,xend_length/2,0])
					cube([xend_height,xend_length,xend_height],center=true);
	
					for (i=[0:1])
					translate([0,xend_length/2,0])
					rotate(i*180)
					{
						translate([-12,0,2]) 
						rotate([0,25,0]) 
						cube([10,xend_length+2,20],center=true);
	
						translate([-13,0,0]) rotate([0,-10,0]) 
						cube([10,xend_length+2,20],center=true);
					}
				}
			}

			translate([-26,xend_length-bushing_support_width,-xend_height/2])
			cube([26,bushing_support_width,xend_height]);

			translate([-26,0,-xend_height/2])
			cube([26,rod_support_width,xend_height]);
		}

		difference ()
		{
			union ()
			{
			translate([0,-1,0])
			rotate(90)
			teardropcentering(
				axis_diameter_larger,
				closed_end?xend_length-solid_end_width+1:xend_length+2);

			translate([axis_diameter_larger,0,0])
			rotate([0,8,0])
			translate([-axis_diameter_larger,solid_end_width,-xend_height/2-1])
			cube([axis_diameter_larger,
				xend_length-2*solid_end_width,
				xend_height/2+1]);

			translate([-axis_diameter_larger,0,0])
			rotate([0,-8,0])
			translate([0,solid_end_width,-xend_height/2-1])
			cube([axis_diameter_larger,
				xend_length-2*solid_end_width,
				xend_height/2+1]);


			if (closed_end)
			{
				translate([0,xend_length-solid_end_width+1.5,0])
				rotate([90,0,0])
				cylinder(r=m3_nut_diameter/2, h=3,$fn=6);

				translate([0,xend_length+1,0])
				rotate([90,0,0])
				cylinder(r=m3_diameter/2-0.2, h=solid_end_width+2,$fn=6);
			}

			}

			translate([-axis_diameter_larger-1,solid_end_width+slot_width,-xend_height/2])
			cube([axis_diameter_larger,
				xend_length-2*solid_end_width-2*slot_width,
				pad_connector_height]);

			difference()
			{
				translate([-pad_width/2,solid_end_width+slot_width,-xend_height/2])
				cube([pad_width,
					xend_length-2*solid_end_width-2*slot_width,
					pad_height]);
	
				translate([axis_diameter_larger,0,0])
				rotate([0,8,0])
				translate([-slot_width,solid_end_width,-xend_height/2-1])
				cube([slot_width,xend_length-2*solid_end_width,xend_height/2+1]);
			}
		}

		if (add_strength)
		{
			for (i=[0:5])
			translate([-axis_diameter_larger+2,5+2.5+5*i,-axis_diameter_larger]) 
			cylinder(h=7,r=0.4,$fn=6,center=true);

			for (i=[0:6])
			translate([-axis_diameter_larger-2,5+5*i,-axis_diameter_larger])
			cylinder(h=7,r=0.4,$fn=6,center=true);
		}

		if (!closed_end)
		{
			translate([0,xend_length-1.5-solid_end_width,0])
			cylinder(r=3/2, h=xend_height+2,$fn=10,center=true);
		}
	}
}

module xend(closed_end=true,curved_sides=false)
{
	translate([0,9.5,0])bushing(true,13);
	translate([0,4.8,0.5])cube(size = [8,2,1],center=true);
	translate([0,4.8,12.5])cube(size = [8,2,1],center=true);
	translate([0,9.5,48])bushing(true,13);
	translate([0,4.8,48+0.5])cube(size = [8,2,1],center=true);
	translate([0,4.8,48+12.5])cube(size = [8,2,1],center=true);
	translate([0,9.5,32])
	{
		difference()
		{
			bushing(true,16);
			translate([0,3,2]) 
			rotate([45,0,0])
			cube([16,30,16],center=true);
		}
	}

	difference()
	{
		union ()
		{
			translate(v = [0,-25,xend_height/2])
			{
				xend_side(closed_end=closed_end,curved_sides=curved_sides);
				mirror([1,0,0]) 
				xend_side(closed_end=closed_end,curved_sides=curved_sides);
			}	

			// Slider.
			translate([0,6.5,30]) 
			cube([15.5+2*thin_wall,17,60],center=true);

			//Nut Trap
			translate([0,-20,0]) 
			cylinder(h=40,r=m8_nut_diameter/2+thin_wall*corection,$fn=6);
		}

		// Slider cutout.
		translate([0,10,32.5]) 
		cube([17,17,70],center=true);

		//Rod hole.
		difference()
		{
			translate([0,-20,39.5]) 
			cylinder(h=90,r=m8_nut_diameter/2,$fn=6,center=true);
			translate([0,-20,8.5]) 
			cylinder(h=4,r=m8_nut_diameter/2+thin_wall,$fn=6,center=true);
		}
		translate([0,-20,52]) 
		cylinder(h=90,r=m8_diameter/2,$fn=9,center=true);
	}
}

module xendcorners(dia1, dia2, dia3, dia4, height=0)
{
	translate([0,35,24.5]) 
	union()
	{ 
		//round corners
		translate([33.1,-60.1,-25]) rotate([0,0,90]) roundcorner(dia1);
		translate([33.1,-19.9,-25]) rotate([0,0,-180]) roundcorner(dia2);
		translate([-33.1,-60.1,-25]) rotate([0,0,0]) roundcorner(dia3);
		translate([-33.1,-19.9,-25]) rotate([0,0,-90]) roundcorner(dia4);
	}
}
//xendcorners(5,5,5,5,0);

xend(closed_end=false,curved_sides=false);
