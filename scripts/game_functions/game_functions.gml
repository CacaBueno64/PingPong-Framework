function font_setup(){

	map_string = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyzẞŸᵃᵉÙÚÛÜ¿ÍÏĐÑÒÓÔÕÖØàáâãäœæçèéêëìíîïōñòóôõö❠ùúûüý€ÿÀÁÂÃÄŒÆÇÈÉÊËÌÎÝ¡"
	fnt_font = font_add_sprite_ext(spr_font, map_string, true, 1)
	fnt_font8 = font_add_sprite_ext(spr_font8, map_string, true, 1)
	draw_set_font(fnt_font)
}

function camera_setup(){
	
	var m, cam, mproj
	
	switch room
	{
		case rm_overworld_test:
		{
			var m = matrix_build_lookat(obj_character.x, obj_character.y + Y, Z, obj_character.x, obj_character.y, 10, 0, 0, 1)
			var cam = camera_get_active()
			var mproj = matrix_build_projection_perspective_fov(-16, -window_get_width() / window_get_height(), 1, 32000)
		}
		break
	}
	camera_set_view_mat(cam, m)
	camera_set_proj_mat(cam, mproj)
	camera_apply(cam)
}

function vertex_add_point(vbuffer, xx, yy, zz, nx, ny, nz, utex, vtex, color, alpha)
{
	// Collapse four function calls into a single one
	vertex_position_3d(vbuffer, xx, yy, zz)
	vertex_normal(vbuffer, nx, ny, nz)
	vertex_texcoord(vbuffer, utex, vtex)
	vertex_color(vbuffer, color, alpha)
}


