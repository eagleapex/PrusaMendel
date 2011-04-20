// PRUSA Mendel  
// X-end with NEMA 17 motor mount
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
corection = 1.17; 

/**
 * @name X end motor
 * @category Printed
 * @using 2 bushing
 * @using 8 m3x10
 * @using 4 m3nut
 * @using 4 m3washer
 * @using 1 m8spring
 * @using 2 m8nut
 */  

module teardrop (r=8,h=20)
{
	rotate([-270,0,90])
	linear_extrude(height=h)
	{
		circle(r=r);
		polygon(points=[[0,0],[r*cos(30),r*sin(30)],[0.5*r,r],[-0.5*r,r],[-r*cos(30),r*sin(30)]],
				paths=[[0,1,2,3,4]]);
	}
}

endstop_thickness=4;
endstop_w=10;
endstop_l=14;
endstop_h=10;

module xendmotor()
{
	translate(v = [0,17,24.5]) 
	union()
	{
		difference()
		{
			union()
			{
				translate(v = -[0,17,24.5]) 
				positioned_motor_mount ();

				//translate(v = [0, -25, 0]) cube(size = [70,70,5], center = true);
				translate(v = [-25, -40, -16.6])cube(size = [20,40,15.8], center = true);
				translate(v = [25, -40, -16.6])cube(size = [20,40,15.8], center = true);

				// Endstop mount
				translate(v = -[0,17,24.5]) 
				translate([-35-2,-43,15.75])
				difference()
				{
					translate([2,0,0])
					cube([endstop_w+endstop_thickness-2,
						endstop_l+endstop_thickness,
						endstop_h+endstop_thickness]);
					translate([-1,-1,endstop_thickness])
					cube([endstop_w+1,
						endstop_l+1,
						endstop_h+1]);

					translate([endstop_w-1,endstop_l-1-m3_diameter/2,m3_diameter/2+1+endstop_thickness])
					rotate([0,90,0])
					rotate(360/16)
					{
					cylinder(r=m3_diameter/2,h=endstop_thickness+2,$fn=8);
					translate([0,0,endstop_thickness+2-3])
					cylinder(r=m3_nut_diameter/2,h=3,$fn=6);
					}
				}
			}
			
			
			//nut traps
			
			translate(v = [-25, -29, -19.7]) 
			cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
			translate(v = [-25, -29, -20]) 
			cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
			translate(v = [25, -29, -19.7]) 
			cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
			translate(v = [25, -29, -20]) 
			cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
			
			translate(v = [-25, -50, -19.7]) 
			cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
			translate(v = [-25, -50, -20]) 
			cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
			translate(v = [25, -50, -19.7]) 
			cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
			translate(v = [25, -50, -20]) 
			cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
			
			//round corners
			translate(v = [35.1, -60.1, -25]) rotate(a=[0,0,90]) render()
			roundcorner(round_corner_diameter);
			translate(v = [-35.1, -60.1, -25]) rotate(a=[0,0,0]) render()
			roundcorner(round_corner_diameter);
			translate(v = [-35.1, -19.9, -25]) rotate(a=[0,0,-90]) render()
			roundcorner(round_corner_diameter);
			
			//holes for axis
			translate(v = [-25, -18-42-1, -16.7]) rotate(a=[0,0,90]) 
			teardrop (h=42,r=m8_diameter/2);
		
			translate(v = [25, -18-42-1, -16.7]) rotate(a=[0,0,90]) 
			teardrop (h=56.5,r=m8_diameter/2);
		
			//slider cutouts
			translate(v = [0, -25, 15]) 
			difference()
			{
				translate(v = [0, -0, -14.5])cube(size = [23,23,50], center = true);
			}
			//nut trap
			translate(v = [0, -55, 15]) 
			{
				difference()
				{
					translate(v = [0, -0, -15])
					cylinder(h = 50, r=m8_nut_diameter/2+thin_wall, $fn=6, center=true);
				}
			}
			translate(v = -[0,17,24.5]) 
			positioned_motor_mount_holes ();


			render()
			translate(v = -[0,17,24.5]+[-5,-29,-2.5+6-5]) 
			translate(top_corner)
			difference()
			{
				cube([6,30,6]);
				rotate([-90,0,0])
				translate([0,0,-1])
				cylinder(r=5,h=32);
			}
		}
		
		//slider
		translate(v = [0, -25, 15]) 
		difference()
		{
			union()
			{
				translate(v = [0, -3.5, -7]) 
				cube(size = [17+2*thin_wall,17,65], center = true);
			
				translate(v = [0, -3.5, -31.6]) 
				cube(size = [33,17,15.8], center = true);
			}
			translate(v = [0, -0, -7])cube(size = [17,17,70], center = true);
		}
		
		//nut trap
		translate(v = [0, -55, 15]) 
		{
			difference()
			{
				union()
				{
					difference()
					{
						union()
						{
							translate(v = [0, -0, -19.5])
							cylinder(h = 40, 
								r=m8_nut_diameter/2+thin_wall*corection, 
								$fn=6, center=true);
							translate(v = [0, 0, -31.6]) 
							cube(size = [35,10,15.8], center = true);			
						}
						cylinder(h = 90, r=m8_nut_diameter/2, 
							$fn=6, center=true);
					}
					translate(v = [0, 0, -31]) 
					cylinder(h=4,r=m8_nut_diameter/2+thin_wall, 
						$fn=6, center=true);
				}
				translate(v = [0, 0, 12.5]) 
				cylinder(h = 90, r=m8_diameter/2, $fn=9, center=true);
			}
		}
	
		//nema17 connector
//		%translate(v = [0, 0, -12]) difference()
//		{
//			union()
//			{
//				translate(v = [21, -22.5, 36.5]) cube(size = [24,5,6], center = true);
//				translate(v = [32.5, 2, 13.5]) cube(size = [5,54,52], center = true);
//				translate(v = [22.5, 2, -11]) cube(size = [20,54,3], center = true);
//			}
//			
//			// some reduction of bottom part 
//			translate(v = [15, 15, -11]) rotate ([0,0,-17]) 
//			cube(size = [20,70,25], center = true);
//			
//			translate(v = [0, 0, -4.7])
//			{
//			#	translate(v = [32.5, 7, 23.5]) rotate(a=[0,90,0]) rotate(a=[0,0,30])
//				cylinder(h = 10, r=12, $fn=20, center=true);
//			
//				translate(v = [30, 7, 23]) rotate(a=[0,90,0])
//				{
//					rotate ([0,0,45]) translate([20,0,0]) 
//					cube(size = [9,3.2,25], center = true);
//					rotate ([0,0,-45]) translate([20,0,0]) 
//					cube(size = [9,3.2,25], center = true);
//					rotate ([0,0,135]) translate([20,0,0]) 
//					cube(size = [9,3.2,25], center = true);
//					rotate ([0,0,-135]) translate([20,0,0]) 
//					cube(size = [9,3.2,25], center = true);
//					
//					rotate ([0,0,135]) translate([32,0,0]) 
//					cube(size = [9,20,25], center = true);
//				}
//			}
//		}
	}

}
xendmotor();

nema17_hole_spacing=1.2*25.4; 
nema17_width=1.7*25.4;
thickness=9;
nema17_support_d=nema17_width-nema17_hole_spacing;
motor_mount_rotation=[0,0,0];
motor_mount_translation=[44-thickness,-10,23.5-4.7-12+24.5];

top_corner=motor_mount_translation+[thickness,nema17_width/2,nema17_width/2];
bridge_length=top_corner[0]-9;
bridge_shear=0.48;

module positioned_motor_mount()
{
difference ()
{
translate(motor_mount_translation)
	union()
{
	rotate([0,90,0])
	motor_mount ();

	translate(-motor_mount_translation)
	{
	translate(top_corner+
		[-bridge_length,-nema17_support_d-bridge_shear*bridge_length,-2.5])
	multmatrix([[1,0,0],[bridge_shear,1,0],[0,0,1]])
	cube([bridge_length,nema17_support_d,6]);
	#
	render()
	translate(top_corner+[-thickness,-nema17_support_d,-nema17_support_d/2])
	intersection()
	{
		translate([0,-bridge_shear*thickness,0])
		multmatrix([[1,0,0],[bridge_shear,1,0],[0,0,1]])
		cube([thickness,nema17_support_d,nema17_support_d/2]);
		cube([thickness,nema17_support_d,nema17_support_d/2]);
	}
	

	}

render()
intersection()
{
	translate([0,-nema17_width/2+nema17_support_d/2,1])
	rotate([0,90,0])
	translate([3.6*1.5*thickness,0,-thickness])
	multmatrix([[1,0,-3.6],[0,1,0],[0,0,2]])
	{
		rotate(90)
		linear_extrude(height=thickness)
		barbell(nema17_support_d/2,
		nema17_support_d/2,20,60,nema17_hole_spacing);
		translate([-20,-nema17_support_d/2,0])
		cube([20,nema17_width,thickness]);
	}

	translate([0,0,-motor_mount_translation[2]+15.8/2])
	cube([thickness*3,nema17_width,15.8],true);
}
}


}
}

module positioned_motor_mount_holes()
{
translate(motor_mount_translation)
	rotate([0,90,0])
	motor_mount_holes ();
}

module motor_mount ()
{
	rotate(motor_mount_rotation)
	{
		for (hole=[1,2])
		rotate([0,0,90*hole])
		linear_extrude(height=thickness)
		translate(-nema17_hole_spacing*[1,1,0]/2)
		barbell (nema17_support_d/2,
		nema17_support_d/2,20,60,nema17_hole_spacing);
		
		% cube([nema17_width,nema17_width,0.1],true);
	}
}

module motor_mount_holes ()
{
	// Motor mount holes. 
	translate([0,0,-1])
	rotate(motor_mount_rotation)
	{
		for (hole=[3:5])
		rotate([0,0,90*hole])
		translate(nema17_hole_spacing*[1,1,0]/2)
		rotate(360/16)
		cylinder(h=thickness+2,r=4.4/2,$fn=8);

		for (hole=[3:5])
		rotate([0,0,90*hole])
		translate(nema17_hole_spacing*[1,1,0]/2)
		translate([0,0,-24])
		cylinder(h=25,r=7/2);
	}
}

module barbell (r1,r2,r3,r4,separation) 
{
	x1=[0,0];
	x2=[separation,0];
	x3=triangulate (x1,x2,r1+r3,r2+r3);
	x4=triangulate (x2,x1,r2+r4,r1+r4);
	# render()
	difference ()
	{
		union()
		{
			translate(x1)
			circle (r=r1);
			translate(x2)
			circle(r=r2);
			polygon (points=[x1,x3,x2,x4]);
		}
		
		translate(x3)
		circle(r=r3,$fa=5);
		translate(x4)
		circle(r=r4,$fa=5);
	}
}

function triangulate (point1, point2, length1, length2) = 
point1 + 
length1*rotated(
atan2(point2[1]-point1[1],point2[0]-point1[0])+
angle(distance(point1,point2),length1,length2));

function distance(point1,point2)=
sqrt((point1[0]-point2[0])*(point1[0]-point2[0])+
(point1[1]-point2[1])*(point1[1]-point2[1]));

function angle(a,b,c) = acos((a*a+b*b-c*c)/(2*a*b)); 

function rotated(a)=[cos(a),sin(a),0];