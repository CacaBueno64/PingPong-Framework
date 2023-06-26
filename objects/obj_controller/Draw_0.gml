draw_clear(c_black)

//camera_setup()

//for transparent textures, don't disable it
gpu_set_alphatestenable(true)
gpu_set_alphatestref(1)
shader_set(shd_shader)

/*//drawing the square at the screen
gpu_set_zwriteenable(false);
matrix_set(matrix_world, matrix_build(obj_character.x-32, obj_character.y-64, 1, 0, 0, direction, 1, 1, 1));
vertex_submit(vbuffer, pr_trianglelist, sprite_get_texture(spr_body1_raimon_idle, 0))
matrix_set(matrix_world, matrix_build_identity());
gpu_set_zwriteenable(true);
*/

