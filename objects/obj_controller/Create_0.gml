application_surface_draw_enable(false)
surface_resize(application_surface, 512, 288)

//initialize 3D
gpu_set_ztestenable(true)
gpu_set_zwriteenable(true)
vertex_format_begin()
vertex_format_add_position_3d()
vertex_format_add_normal()
vertex_format_add_color()
vertex_format_add_texcoord()
vertex_format = vertex_format_end()

Z = 320
Y = 416
Zrot = 0

instance_create_depth(x, y, depth, obj_mouse)
instance_create_depth(200, 150, 1, obj_character)
instance_create_depth(x, y, depth, obj_dir_arrow)

font_setup()

//drawing the player, it's just a square composed of two triangles


/*vbuffer = vertex_create_buffer()

vertex_begin(vbuffer, vertex_format)
vertex_add_point(vbuffer,  0,  0, 1,      0, 0, 1,        0, 0,       c_white, 1)
vertex_add_point(vbuffer, 64,  0, 1,      0, 0, 1,        2, 0,       c_white, 1)
vertex_add_point(vbuffer, 64, 64, 1,      0, 0, 1,        2, 2,       c_white, 1)
								  
vertex_add_point(vbuffer, 64,  64, 1,      0, 0, 1,        2, 2,      c_white, 1)
vertex_add_point(vbuffer,  0,  64, 1,      0, 0, 1,        0, 2,      c_white, 1)
vertex_add_point(vbuffer,  0,   0, 1,      0, 0, 1,        0, 0,      c_white, 1)

vertex_end(vbuffer) //always end*/