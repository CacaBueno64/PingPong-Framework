if mouse_check_button_pressed(mb_left)
{
	bounce = true
	move_towards_point(mouse_x, mouse_y, clamp((point_distance(x, y, mouse_x, mouse_y)/14), 0, 3.5))
	zspeed = zjumpspeed 
}

if bounce = true
{
	if keyboard_check_pressed(ord("Z"))
	{
		z = 0
	}

	//x += hspeed
	//y += vspeed
	z += zspeed
	move_bounce_solid(0)
	//zjumpspeed = clamp(zjumpspeed, -4, 0)

	//check if the ball hits the floor
	if z > 0
	{
		zfloor = 0
	} else {
		zfloor = 1
	}

	//bounce the ball
	if zfloor != 1 
	{
	zspeed = -zspeed * bouncedecay
	}

	//apply gravity only if the ball isn't on the ground
	if zfloor = 1
	{	
		zspeed += zgravity
	}
}