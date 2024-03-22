//check if the player possesses the ball
/*if place_meeting(x, y, obj_ball) && obj_ball.z < 30
{
	hasball = true
} else {
	hasball = false
}*/

////player movements

//check if player is selected
if mouse_check_button(mb_right) && place_meeting(x, y, obj_mouse)
{
	selected = true
} else if mouse_check_button_released(mb_right) {
	selected = false
}

//move the player
if selected = true
{
	//create a target that player will follow
	instance_create_layer(x, y, "Instances", obj_playertarget)
	obj_playertarget.x = mouse_x
	obj_playertarget.y = mouse_y
}

//the player will move towards the target
if instance_exists(obj_playertarget)
{
	move_towards_point(obj_playertarget.x, obj_playertarget.y, player_speed)
}

//if the player touches the target, then destroy the target
if place_meeting(x, y, obj_playertarget)
{
	instance_destroy(obj_playertarget)
	speed = 0
}







