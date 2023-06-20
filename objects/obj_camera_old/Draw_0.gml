draw_clear(c_black)

// You can set the camera projection(s) at any point
var camera = camera_get_active()
camera_set_view_mat(camera, matrix_build_lookat(obj_character.x, obj_character.y + 180, z, obj_character.x, obj_character.y, 10, 0, 0, 1))
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(-60, -window_get_width() / window_get_height(), 1, 32000))
camera_apply(camera)

// Anything drawn has to be drawn after the camera projections are set
//with (obj_gameobject) event_perform(ev_draw, 0)

gpu_set_zwriteenable(false)
matrix_set(matrix_world, matrix_build(x, y, 10, 0, 0, 0, 10, 10, 10))
vertex_submit(dtw, pr_trianglelist, sprite_get_texture(mr02b03t15, 0))
matrix_set(matrix_world, matrix_build_identity())
gpu_set_zwriteenable(true)

gpu_set_alphatestenable(true)
gpu_set_alphatestref(1)

shader_set(shd_test)