application_surface_draw_enable(false)
surface_resize(application_surface, 1600, 900)

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_color();
vertex_format_add_texcoord();
format = vertex_format_end();

pitch = 0;
direction = 0;
z = 180;

//var barrel = instance_create_depth(500, 500, depth, GameObject);
//barrel.model = load_model("barrel.d3d");

//var rock = instance_create_depth(200, 200, depth, GameObject);
//rock.model = load_model("rock_c.d3d");

dtw = load_obj("mr02b03m02.obj");
