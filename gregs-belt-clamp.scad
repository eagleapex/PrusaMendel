//difference()
//{
//cube([28,14,6],center=true);
//for (i=[-1,1])
//{
//translate([i*7,0,0])
//{
//	translate([0,0,0.5])
//	cylinder(r1=1.5,r2=4.5,h=3,$fn=16);
//	cylinder(r=1.5,h=8,center=true,$fn=16);
//}
//}
//}

include<configuration.scad>

belt_thickness=1.5;
tooth_height=1.5;
tooth_spacing=5;

module gregs_x_belt_clamp ()


gregs_y_belt_clamp();

module gregs_y_belt_clamp ()
{
	thickness=2.5;
	hole_separation=15;
	mount_hole_d=6;
	tension_hole_d=4.8;
	belt_width=6;
	belt_slot_height=belt_thickness+tooth_height;
	clamp_width=2*thickness+mount_hole_d;
	clamp_height=belt_slot_height+thickness+tension_hole_d+thickness+tooth_height;
	clamp_length=hole_separation+mount_hole_d+2*thickness;

	rotate([90,0,0])
	translate([0,clamp_width/2,0])
	difference()
	{
		translate([0,0,clamp_height/2])
		cube([clamp_length,clamp_width,clamp_height],center=true);
	
		translate([0,0,belt_slot_height/2-1])
		cube([belt_width,clamp_width+2,belt_slot_height+2],
			center=true);
	
		translate([0,0,belt_slot_height+thickness+tension_hole_d/2])
		rotate([90,0,0])
		cylinder(r=tension_hole_d/2,h=clamp_width+2,center=true,$fn=16);
	
		for (i=[-1:1])
		{
			translate([0,i*tooth_spacing,clamp_height-tooth_height/2+1])
			cube([belt_width,tooth_spacing/2,tooth_height+2],center=true);
		}
	
		for (i=[-1,1])
		{
			translate([i*hole_separation/2,0,-1])
			rotate(360/16)
			cylinder(r=mount_hole_d/2,h=clamp_height+2,$fn=8);
		}
	}
	
	top_thickness=thickness+tooth_height;
	
	translate([0,clamp_width/2+2,0])
	difference()
	{
		translate([0,0,top_thickness/2])
		difference()
		{
		cube([clamp_length,clamp_width,top_thickness],true);
		for (i=[-1,1])
		{
			translate([i*hole_separation/2,0,0])
			cylinder(r=mount_hole_d/2,h=top_thickness+2,center=true,$fn=16);
		}
		}
	
		for (i=[-1:1])
		translate([0,i*tooth_spacing,top_thickness-tooth_height/2+1])
		cube([belt_width,tooth_spacing/2,tooth_height+2],center=true);
	}
	
	translate([0,3*clamp_width/2+4,0])
	difference()
	{
		translate([0,0,top_thickness/2])
		difference()
		{
		cube([clamp_length,clamp_width,top_thickness],true);
		for (i=[-1,1])
		{
			translate([i*hole_separation/2,0,0])
			cylinder(r=mount_hole_d/2,h=top_thickness+2,center=true,$fn=16);
		}
		}
	}
}
