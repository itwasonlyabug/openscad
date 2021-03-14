$fa = 1;
$fs = 0.4;

leg_width=20;
leg_length=20;
leg_height=700;

top_width=400;
top_length=1000;
top_thickness=30;

support_width=20;
support_length=20;
//support_height=top_length;

module square_tube(tube_width=50, tube_length=50, tube_height=700, wall_thickness=16){
    
    inside_width = tube_width-wall_thickness;
    inside_length = tube_length-wall_thickness;
    
    translate([0,0,tube_height/2]){
    difference(){
      cube([tube_width, tube_length, tube_height], center=true);
        
      translate([0,0,-0.5])
        
        scale([1,1,1.10])
        
        cube([inside_width,inside_length,tube_height], center=true);
    }}
}

module flat_surface(surface_width=400, surface_length=1000,surface_thickness=20, surface_height){
  translate([0,0,surface_height])
  cube([surface_width, surface_length, surface_thickness],center=true);    
    
}
// Table Legs
short_side=(top_width/2)-(leg_width/2);
long_side=(top_length/2)-(leg_length/2);

// Back
translate ([-short_side,long_side,0])
  square_tube(tube_width=leg_width, tube_length=leg_length, tube_height=leg_height);

translate ([-short_side,-long_side,0])
  square_tube(tube_width=leg_width, tube_length=leg_length, tube_height=leg_height);

// Front
translate ([short_side,long_side,0])
  square_tube(tube_width=leg_width, tube_length=leg_length, tube_height=leg_height);

translate([short_side,-long_side,0])
  square_tube(tube_width=leg_width, tube_length=leg_length, tube_height=leg_height);
  
// Table Surface
flat_surface(surface_width=top_width, surface_length=top_length, surface_height=leg_height+(top_thickness/2), surface_thickness=top_thickness);

// Supports
// Front
rotate([90,0,0]){
translate([top_width/2-support_width/2,top_width/2,(-top_length/2)+(leg_length)])
  square_tube(tube_width=support_width, tube_length=support_length, tube_height=top_length-(2*leg_length));
  
// Back
translate([-(top_width/2-support_width/2),top_width/2,(-top_length/2)+(leg_length)])
  square_tube(tube_width=support_width, tube_length=support_length, tube_height=top_length-(2*leg_length));}
  
// Side
rotate([90,0,90]){
translate([-top_length/2+leg_width/2,top_width/2,(-top_width/2)+(leg_width)])
  square_tube(tube_width=support_width, tube_length=support_length, tube_height=top_width-(2*leg_width));

// Side 2
translate([top_length/2-leg_width/2,top_width/2,(-top_width/2)+(leg_width)])
  square_tube(tube_width=support_width, tube_length=support_length, tube_height=top_width-(2*leg_width));}


// Supports Under Top
// Front
rotate([90,0,0]){
translate([top_width/2-support_width/2,top_width/2,(-top_length/2)+(leg_length)])
  square_tube(tube_width=support_width, tube_length=support_length, tube_height=leg_height);
  
// Back
translate([-(top_width/2-support_width/2),top_width/2,(-top_length/2)+(leg_length)])
  square_tube(tube_width=support_width, tube_length=support_length, tube_height=top_length-(2*leg_length));}
  
// Side
rotate([90,0,90]){
translate([-top_length/2+leg_width/2,top_width/2,(-top_width/2)+(leg_width)])
  square_tube(tube_width=support_width, tube_length=support_length, tube_height=top_width-(2*leg_width));

// Side 2
translate([top_length/2-leg_width/2,top_width/2,(-top_width/2)+(leg_width)])
  square_tube(tube_width=support_width, tube_length=support_length, tube_height=top_width-(2*leg_width));}