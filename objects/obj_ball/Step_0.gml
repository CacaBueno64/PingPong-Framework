//values, fresh from my ass
var shoot_force = point_distance(x, y, mouse_x, mouse_y) * 0.02 
var limit = 4

if /*obj_player.hasball = true &&*/ bounce = false
{
	//shoot
	if mouse_check_button_pressed(mb_left)
	{
		bounce = true
		
		if instance_exists(obj_balltarget)
		{
			instance_destroy(obj_balltarget)
		}
		instance_create_layer(mouse_x, mouse_y, "Instances", obj_balltarget)
		
		move_towards_point(obj_balltarget.x, obj_balltarget.y, clamp(shoot_force, 0, limit))
		
		zspeed = clamp(shoot_force, 0, limit)
		
	}
	
	//ball will follow the player
	//x = obj_player.x
	//y = obj_player.y
}
if (bounce_count == 1) instance_destroy(obj_balltarget)


if bounce = true //ball physics
{
	move_bounce_solid(0) //wall bounce (x,y)

	if (z > 0) zspeed -= zgravity //apply gravity if the ball is in the air

	z += zspeed

	if z < 0
	{
		z = -z //bounce
		bounce_count += 1 //counting bounces
	
		if (zspeed < 0) zspeed = -zspeed * bouncedecay
	
		if zspeed < 0.7 //stop bouncing
		{
			z = 0
			zspeed = 0
			bounce = false
			bounce_count = 0 //stop counting
		}
	}
}



