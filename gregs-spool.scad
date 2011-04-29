
/*
 *  Filament Spool
 *  by Greg Frost.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
*/

use<Libs.scad>

num_balls=9;
ball_diameter=8;
ball_separation=0.5;
bearing_slop=0.5;
bearing_support_thickness=5;
bearing_gap=1.5;
shaft_diameter=8;

dovetail_height=8;
dovetail_width=7;
arm_width=14;
arm_stub_length=12;

ball_facets=30;
bearing_facets=100;
shaft_facets=20;

ball_translation=((ball_diameter+ball_separation)/2)/sin(180/num_balls);
race_inside_height=ball_diameter+bearing_slop;
race_outside_height=race_inside_height+bearing_support_thickness;
race_radius=ball_translation+ball_diameter/2+bearing_slop/2+bearing_support_thickness;
race_inside_radius=ball_translation+ball_diameter/3;

//for(i=[0:num_balls-1])
//rotate(360/num_balls*i)
//translate([ball_translation,0,0])
//sphere(r=ball_diameter/2,$fn=ball_facets);

translate([-40,10])
rotate(30)
for(i=[0:5])
for(j=[0:2])
translate([i*(ball_diameter+2),j*(ball_diameter+2),0])
difference()
{
sphere(r=ball_diameter/2,$fn=ball_facets);
translate([0,0,-ball_diameter/2])
cube([ball_diameter+1,ball_diameter+1,ball_diameter],center=true);
}

race ();
hub();
translate((race_radius+race_inside_radius)/sqrt(2)*[-1,-1,0])
hub();

module race()
{
	translate([0,0,race_outside_height/2])
	difference()
	{
		render();
		difference()
		{
			cylinder(r=race_radius,h=race_outside_height,center=true,$fn=bearing_facets);
			cylinder(r=race_inside_radius,h=race_outside_height+2,center=true,$fn=bearing_facets);
		}
		raceway();
	}

	for(arm=[0:2])
	rotate(arm*360/3)
	translate([0,0,dovetail_height/2])
	difference()
	{
		translate([-race_inside_radius-arm_stub_length/2,0,0])
		cube([arm_stub_length,arm_width,dovetail_height],center=true);
	translate([-race_inside_radius-arm_stub_length,0,0])
	dovetail(height=dovetail_height+2,width=dovetail_width,male=false);
	}
}

module hub()
{
	translate([0,0,race_outside_height/2])
	difference ()
	{
		cylinder(r=race_inside_radius-bearing_gap,h=race_outside_height,center=true,$fn=bearing_facets);
		cylinder(r=shaft_diameter/2,h=race_outside_height+2,center=true,$fn=shaft_facets);
		raceway();
	
		translate([-race_inside_radius,-race_inside_radius,0])
		cube([race_inside_radius*2,race_inside_radius*2,race_outside_height/2+1]);
	}
}

module raceway()
{
	scale([1,1,race_inside_height/ball_diameter])
	{
		rotate(180/bearing_facets)
		rotate_extrude ($fn=bearing_facets)
		{
			translate([ball_translation+bearing_slop/2,0])
			circle(r=ball_diameter/2,$fn=ball_facets);
			translate([ball_translation-bearing_slop/2,0])
			circle(r=ball_diameter/2,$fn=ball_facets);
			translate([ball_translation,0])
			square([bearing_slop,ball_diameter],center=true);
		}
	}
}