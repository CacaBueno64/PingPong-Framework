{
  
  // initialize 3D
  d3d_start();
  d3d_set_hidden(true);
  d3d_set_lighting(true);
  d3d_set_culling(false);
  // interpolate textures
  texture_set_interpolation(true);

  
dist = 3;
z = 0;
zview = 0;
cam_height_z = 0;
sensibility = 400;
mouse_direction = 0;



cx = 0;
cy = 0;
cz = 0;
cc=10;

xup=0;
yup=0;
zup=1;


//setting first position
var zv = 25;
var cm = cos(zv*pi/180);
//cc=1;
cx = cos(45*pi/180)*cc;
cy = -sin(45*pi/180)*cc;
cz = sin(zv*pi/180);


dist = cc;



d3d_light_enable(0,true);
d3d_light_define_direction(0,-0.5,-0.5,-0.5,c_white);
d3d_light_enable(1,true);
d3d_light_define_direction(1,-0.5,+0.5,-0.5,c_gray);
d3d_light_enable(3,true);
d3d_light_define_direction(3,+0.5,-0.5,0.5,c_gray);
d3d_light_enable(4,true);
d3d_light_define_direction(4,0.5,0.5,0.5,c_gray);
//only relevant for the camera object
z=0
}

