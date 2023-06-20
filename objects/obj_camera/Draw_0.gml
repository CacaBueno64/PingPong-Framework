draw_clear(c_black)
d3d_set_projection(obj_character.x, obj_character.y + Y, z, obj_character.x, obj_character.y, 10, 0, 0, 1);

//for transparent textures, don't disable it
gpu_set_alphatestenable(true)
gpu_set_alphatestref(1)
