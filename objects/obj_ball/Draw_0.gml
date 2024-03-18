//Update depth before drawing self
depth = -bbox_bottom + z * 2

//the shadow
draw_sprite(spr_shball, 0, x, y)

//the ball with z axis
draw_sprite(spr_ball, 0, x, (y - z) - 3)

//placeholder line between the ball and the target
if instance_exists(obj_balltarget) && bounce = true
{
	draw_line_width_color(x, y, obj_balltarget.x, obj_balltarget.y, 4, c_yellow, c_yellow)
}