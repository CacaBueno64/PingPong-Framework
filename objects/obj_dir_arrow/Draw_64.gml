if obj_mouse.click == 1 && (mouse_x != xpos || mouse_y != ypos)
{
	draw_sprite(spr_dir_arrow, 0, xpos, ypos)
	draw_sprite_ext(spr_dir_arrow2, 0, xpos, ypos, 1, point_distance(xpos, ypos, mouse_x, mouse_y)-11, point_direction(xpos, ypos, mouse_x, mouse_y)+90, c_white, 1)
	draw_sprite_ext(spr_dir_arrow3, 0, mouse_x, mouse_y, 1, 1, point_direction(xpos, ypos, mouse_x, mouse_y)-90, c_white, 1)
}
draw_text(0, 0, "direction : " + string(chara_direction))
draw_text(0, 16, "speed : " + string(chara_speed))
//draw_text(0, 32, "xpos : " + string(xpos) + " ypos : " + string(ypos))
draw_text(0, 48, "y : " + string(obj_camera.Y))
draw_text(0, 64, "z : " + string(obj_camera.z))
draw_sprite(spr_mouse, 0, 256/2, 192/2)