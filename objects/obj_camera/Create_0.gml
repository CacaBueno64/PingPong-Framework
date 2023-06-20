//	initialize 3D
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_color();
vertex_format_add_texcoord();
format = vertex_format_end();

z = 456;
Y = 456;

d3d_light_enable(0,true);
d3d_light_define_direction(0,-0.5,-0.5,-0.5,c_white);
d3d_light_enable(1,true);
d3d_light_define_direction(1,-0.5,+0.5,-0.5,c_white);
d3d_light_enable(3,true);
d3d_light_define_direction(3,+0.5,-0.5,0.5,c_white);
d3d_light_enable(4,true);
d3d_light_define_direction(4,0.5,0.5,0.5,c_white);
//only relevant for the camera object


