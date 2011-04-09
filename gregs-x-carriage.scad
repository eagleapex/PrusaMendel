// PRUSA Mendel  
// X-carriage
// Used for sliding on X axis
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * Slides on the x-axis with extruder.
 * @name X carriage
 * @category Printed
 * @using 4 m3x10
 * @using 4 m3washer
 * @using 4 m3nut
 * @using 4 bushing
 */ 



module xcarriage()
{
	translate(v = [0,0,2.5]) union(){difference(){
	union()
	{
		//Base block
			cube(size = [70,70,5], center = true);
		//Nut holder base - extruder
			translate(v = [0, 0, 1]) cube(size = [12,70,7], center = true);
			translate(v = [0, -6, 1]) cube(size = [70,12,7], center = true);

		//Nut holder base - belt clamps
		translate(v = [33-(7.5/2), -18, 1]) cube(size = [45-7.5,15,7], center = true);
		translate(v = [33+45/2-7.5, -18, 1]) cylinder(h = 7, r=7.5, $fn=18, center=true);
		translate(v = [33-(7.5/2), 18, 1]) cube(size = [45-7.5,15,7], center = true);
		translate(v = [33+45/2-7.5, 18, 1]) cylinder(h = 7, r=7.5, $fn=18, center=true);

		//Bushing holder
		translate(v = [-25, 30, 5])cube(size = [26,10,15], center = true);
		translate(v = [-25, -30, 5])cube(size = [26,10,15], center = true);
		translate(v = [25, -30, 5])cube(size = [26,10,15], center = true);
		translate(v = [25, 30, 5])cube(size = [26,10,15], center = true);
		
		// fan holder
		translate(v = [-25, 20, 2])  cube(size = [20,10,9], center = true);
		translate(v = [-25, -20, 2]) cube(size = [20,10,9], center = true);

	}
	translate([0,42])cylinder(r=14,h=10,center=true,$fn=6);
	//main cutout
	translate(v = [-12.5,0,0]) cube(size = [5,50,10], center = true);

	translate(v = [25, 30.4, 12]) rotate(a=[90,0,0]) 
	cylinder(h = 11, r=18/2, $fn=12, center=true);
	translate(v = [25, 30.4, 7.5])cube(size = [18,11,9], center = true);
	translate(v = [-25, 30.4, 12]) rotate(a=[90,0,0]) 
	cylinder(h = 11, r=18/2, $fn=12, center=true);
	translate(v = [-25, 30.4, 7.5])cube(size = [18,11,9], center = true);
	translate(v = [25, -30.4, 12]) rotate(a=[90,0,0]) 
	cylinder(h = 11, r=18/2, $fn=12, center=true);
	translate(v = [25, -30.4, 7.5])cube(size = [18,11,9], center = true);
	translate(v = [-25, -30.4, 12]) rotate(a=[90,0,0]) 
	cylinder(h = 11, r=18/2, $fn=12, center=true);
	translate(v = [-25, -30.4, 7.5])cube(size = [18,11,9], center = true);

	// holes for connecting extruder
	translate(v = [0, 0, 0]) 
	{
		
		translate(v = [0, -31, 2]) cylinder(h = 10, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [0, -31, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
		translate(v = [0, 19, ]) cylinder(h = 20, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [0, 19, 5]) cylinder(h = 9, r=4.5, $fn=6, center=true);
		
		// Hotend hole
		translate(v = [0, -6, 0]) cylinder(h = 20, r=21, $fn=20, center=true);

		

#		translate(v = [-25, -6, 2]) cylinder(h = 10, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [-25, -6, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
		translate(v = [25, -6, ]) cylinder(h = 20, r=m4_diameter/2, $fn=9, center=true);
#		translate(v = [25, -6, 5]) cylinder(h = 9, r=4.5, $fn=6, center=true);
		
		
		
	}

	//belt clamp holes
	translate(v = [30, -18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
	translate(v = [30, -18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);
	translate(v = [48, -18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
	translate(v = [48, -18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);

	translate(v = [30, 18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
	translate(v = [30, 18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);
	translate(v = [48, 18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
	translate(v = [48, 18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);


	translate(v = [-25, -20, 2.5]) rotate(a=[0,90,0]) 
	cylinder(h = 30, r=m4_diameter/2, $fn=10, center=true);

	translate(v = [-25, 20, 2.5]) rotate(a=[0,90,0]) 
	cylinder(h = 30, r=m4_diameter/2, $fn=10, center=true);
	}}
}

//%xcarriage();

holder_separation=18;

gregs_x_carriage();

module gregs_x_carriage()
{
	difference()
	{
		union ()
		{
			linear_extrude(height=lm8uu_support_thickness)
			{
			barbell (
				[25,holder_separation/2],
				[25,-holder_separation/2],
				lm8uu_holder_width/2,lm8uu_holder_width/2,12,12);
		

			barbell (
				[25-lm8uu_holder_width/2,holder_separation/2+lm8uu_holder_length-8],
				[-25-13.5+belt_clamp_hole_separation/2,1*(lm8uu_holder_length/2+belt_clamp_width/2)],
				8,belt_clamp_width/2,130,130);

			barbell (
				[25-lm8uu_holder_width/2,-holder_separation/2-lm8uu_holder_length+8],
				[-25-13.5+belt_clamp_hole_separation/2,-1*(lm8uu_holder_length/2+belt_clamp_width/2)],
				8,belt_clamp_width/2,130,130);

color([0,0,1])
			polygon(points=[
				[-25-lm8uu_holder_width/2,1*(lm8uu_holder_length/2+belt_clamp_width/2)],
				[-25-lm8uu_holder_width/2,-1*(lm8uu_holder_length/2+belt_clamp_width/2)],
				[25-lm8uu_holder_width/2+8,-holder_separation/2-lm8uu_holder_length+8],
				[25-lm8uu_holder_width/2+8,holder_separation/2+lm8uu_holder_length-8]],
				paths=[[0,1,2,3]]);
				
			}
//			render()
			difference()
			{
				cylinder(r=25+m4_diameter,h=6);
				translate([25-lm8uu_holder_width/2+lm8uu_support_thickness,-lm8uu_holder_length,-1])
				cube([lm8uu_holder_width,2*lm8uu_holder_length,8]);
				translate([-25-lm8uu_holder_width/2,-lm8uu_holder_length/2,-1])
				cube([lm8uu_holder_width,lm8uu_holder_length,8]);
			}
		}
	
		for (i=[0:1])
		rotate(180*i)
		for (hole=[-1:1])
		rotate(hole*22)
		translate([0,25,-1])
		cylinder(r=m4_diameter/2,h=lm8uu_support_thickness*2+2,$fs=1);
	
		translate([0,0,-1])
		cylinder(r=21,h=lm8uu_support_thickness*2+2);


		for (i=[-1,1])
		translate([-25-13.5,i*(lm8uu_holder_length/2+belt_clamp_width/2)])
		belt_clamp_holes();
	}
	
#	for(i=[-1,1])
	{
		translate([50/2-lm8uu_holder_width/2,
			i*(lm8uu_holder_length+holder_separation)/2-lm8uu_holder_length/2,0])
		render()
		lm8uu_bearing_holder();
	}
#	translate([-50/2-lm8uu_holder_width/2,-lm8uu_holder_length/2,0])
	render()
	lm8uu_bearing_holder();

	belt_support_offset=25+17.5;

	for (i=[-1,1])
	translate([-25-13.5,i*(lm8uu_holder_length/2+belt_clamp_width/2)])
	belt_clamp_socket ();
}

clearance=0.7;
lm8uu_diameter=15+clearance;
lm8uu_length=24+clearance;
lm8uu_support_thickness=3.2; 
lm8uu_end_diameter=m8_diameter+1.5;

lm8uu_holder_width=lm8uu_diameter+2*lm8uu_support_thickness;
lm8uu_holder_length=lm8uu_length+2*lm8uu_support_thickness;
lm8uu_holder_height=lm8uu_diameter*0.75+lm8uu_support_thickness;

lm8uu_holder_gap=(lm8uu_holder_length-6*lm8uu_support_thickness)/2;

echo ("lm8uu_holder_width",50-lm8uu_holder_width);

//translate([25,-m4_nut_diameter/2,0])
//cylinder(r=m4_nut_diameter/2,h=10,$fn=6);

screw_hole_r=4/2;

module y_axis_holder()
{
	difference()
	{
		render()
		lm8uu_bearing_holder();
		for (hole=[-1,1])
		{
			translate([lm8uu_holder_width/2,lm8uu_holder_length/2+hole*(lm8uu_support_thickness+lm8uu_holder_gap/2),0])
			{
				cylinder(r1=screw_hole_r,r2=screw_hole_r+(lm8uu_support_thickness+1)/2,h=lm8uu_support_thickness+1);
				translate([0,0,-1])
				cylinder(r=screw_hole_r,h=2);
			}
		}
	}
}

module lm8uu_bearing_holder()
{
	difference()
	{
		cube([lm8uu_holder_width,lm8uu_holder_length,lm8uu_holder_height]);
		translate([lm8uu_holder_width/2,0,lm8uu_holder_width/2])
		rotate([-90,0,0])
		translate([0,0,lm8uu_support_thickness])
		cylinder(r=lm8uu_diameter/2,h=lm8uu_length,$fn=40);

		translate([lm8uu_holder_width/2,0,lm8uu_holder_width/2])
		rotate([-90,0,0])
		translate([0,0,-1])
		{
			cylinder(r=lm8uu_end_diameter/2,h=lm8uu_holder_length+2,$fn=40);
			translate([-lm8uu_end_diameter/2,-lm8uu_end_diameter,0])
			cube([lm8uu_end_diameter,lm8uu_end_diameter,lm8uu_holder_length+2]);
		}

		translate([-1,2*lm8uu_support_thickness,lm8uu_support_thickness])
		cube([lm8uu_holder_width+2,lm8uu_holder_gap,
			lm8uu_holder_height-lm8uu_support_thickness+1]);

		translate([-1,4*lm8uu_support_thickness+lm8uu_holder_gap,
			lm8uu_support_thickness])
		cube([lm8uu_holder_width+2,lm8uu_holder_gap,
			lm8uu_holder_height-lm8uu_support_thickness+1]);
	}
}

belt_clamp_thickness=2;
belt_clamp_hole_separation=10;

belt_clamp_height=m3_diameter+2*belt_clamp_thickness;
belt_clamp_length=belt_clamp_hole_separation+m3_diameter+2*belt_clamp_thickness;
belt_clamp_width=m3_diameter+3*belt_clamp_thickness;

module belt_clamp_socket()
{
	difference()
	{
		translate([0,0,belt_clamp_height/2])
		union()
		{
			cube([belt_clamp_hole_separation,belt_clamp_width,belt_clamp_height],center=true);
			for(i=[-1,1])
			translate([i*belt_clamp_hole_separation/2,0,0])
			cylinder(r=belt_clamp_width/2,h=belt_clamp_height,center=true);
		}
		belt_clamp_holes();
	}
}

belt_clamp_channel();

belt_width=6;
belt_thickness=1.5; 
tooth_height=1.5;
tooth_spacing=5;

belt_clamp_channel_height=belt_thickness+tooth_height+belt_clamp_thickness*2;

module belt_clamp_channel()
{
	difference()
	{
		translate([0,0,belt_clamp_channel_height/2])
		union()
		{
			cube([belt_clamp_hole_separation,belt_clamp_width,belt_clamp_channel_height],center=true);
			for(i=[-1,1])
			translate([i*belt_clamp_hole_separation/2,0,0])
			cylinder(r=belt_clamp_width/2,h=belt_clamp_channel_height,center=true);
		}

		for(i=[-1,1])
		translate([i*belt_clamp_hole_separation/2,0,-1])
		rotate(360/16)
		cylinder(r=m3_diameter/2,h=belt_clamp_channel_height+2,$fn=8);

		translate([-belt_width/2,-belt_clamp_width/2-1,belt_clamp_channel_height-belt_thickness-tooth_height])
		cube([belt_width,belt_clamp_width+2,belt_thickness+tooth_height+1]);
	}
}

module belt_clamp_holes()
{
	translate([0,0,belt_clamp_height/2])
	{
		for(i=[-1,1])
		translate([i*belt_clamp_hole_separation/2,0,0])
		cylinder(r=m3_diameter/2,h=belt_clamp_height+2,center=true,$fn=8);
	
		rotate([90,0,0])
		rotate(360/16)
		cylinder(r=m3_diameter/2-0.3 /*tight*/ ,h=belt_clamp_width+2,center=true,$fn=8);
	}
}

belt_clamp_clamp_height=tooth_height+belt_clamp_thickness*2;

for (i=[-1,1])
translate([0,i*(belt_clamp_width+2),0])
belt_clamp();

module belt_clamp()
{
	difference()
	{
		translate([0,0,belt_clamp_clamp_height/2])
		union()
		{
			cube([belt_clamp_hole_separation,belt_clamp_width,belt_clamp_clamp_height],center=true);
			for(i=[-1,1])
			translate([i*belt_clamp_hole_separation/2,0,0])
			cylinder(r=belt_clamp_width/2,h=belt_clamp_clamp_height,center=true);
		}

		for(i=[-1,1])
		translate([i*belt_clamp_hole_separation/2,0,-1])
		rotate(360/16)
		cylinder(r=m3_diameter/2,h=belt_clamp_clamp_height+2,$fn=8);

		for(i=[-1:1])
		translate([-belt_width/2,-tooth_spacing/4+i*tooth_spacing,belt_clamp_clamp_height-tooth_height])
		cube([belt_width,tooth_spacing/2,tooth_height+1]);
	}
}

module barbell (x1,x2,r1,r2,r3,r4) 
{
	x3=triangulate (x1,x2,r1+r3,r2+r3);
	x4=triangulate (x2,x1,r2+r4,r1+r4);
	render()
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
