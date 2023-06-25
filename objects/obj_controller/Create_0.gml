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
format = vertex_format_end()
Z = 320
Y = 416

instance_create_depth(x, y, depth, obj_mouse)
instance_create_depth(x, y, 2, obj_character)
instance_create_depth(x, y, depth, obj_dir_arrow)

font_setup()

