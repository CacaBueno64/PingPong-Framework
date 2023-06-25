if mouse_check_button_pressed(mb_left)
{
	xpos = mouse_x
	ypos = mouse_y
}

if obj_mouse.click == 1 && (mouse_x != xpos || mouse_y != ypos)
{
	chara_direction = point_direction(xpos, ypos, mouse_x, mouse_y)
	chara_speed = clamp(point_distance(xpos, ypos, mouse_x, mouse_y)*0.05, 0, 3)
} else {
	chara_direction = 0
	chara_speed = 0
}