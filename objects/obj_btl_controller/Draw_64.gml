if room = Room2
{
draw_set_font(fnt_font)
draw_text(x, y, "mouse distance : " + string(-point_distance(obj_ball.x, obj_ball.y, mouse_x, mouse_y)/15))
draw_text(x, y+16, "ball speed : " + string(obj_ball.speed))
if mouse_check_button(mb_left)
{
	draw_text_color(x, y+32, "*click*", c_yellow, c_yellow, c_yellow, c_yellow, 1)
}
draw_text(x, y+48, "ball friction : " + string(obj_ball.friction))

		} //else {


		//}