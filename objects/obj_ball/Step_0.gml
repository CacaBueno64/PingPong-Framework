
if mouse_check_button_pressed(mb_left) {
	
	if instance_exists(obj_linetargetend) {
		instance_destroy(obj_linetargetend)
		instance_destroy(obj_linetarget)
		instance_destroy(obj_linetarget1)
		instance_destroy(obj_linetarget2)
		instance_destroy(obj_linetarget3)
		instance_destroy(obj_linetarget4)
		instance_destroy(obj_linetarget5)
		instance_destroy(obj_linetarget6)
	}
	
	instance_create_layer(mouse_x, mouse_y, "Instances", obj_linetargetend)
	//instance_create_layer(x, y, "Instances", obj_obstaclecheck)
	instance_create_layer(x, y, "Instances", obj_linetarget)
	
	//obj_obstaclecheck.direction = point_direction(x, y, obj_linetargetend.x, obj_linetargetend.y)
	
	direction = point_direction(x, y, mouse_x, mouse_y)
	shootdistance = point_distance(x, y, mouse_x, mouse_y)
	shootdistance = clamp(shootdistance, 0, 256)
	linedistancex = (lengthdir_x(shootdistance, direction)) / 6
	linedistancey = (lengthdir_y(shootdistance, direction)) / 6
	
	height = point_distance(x, y, mouse_x, mouse_y) / 6
	height = clamp(height, 0, 48)
	
	//values, fresh from my ass
	zh1 = height * 0.5
	zh2 = height * 0.87
	zh3 = height
	zh4 = height * 0.87
	zh5 = height * 0.5
	zh6 = 0
	
	instance_create_layer(x + (linedistancex),		y + (linedistancey	   - zh1),	"Instances", obj_linetarget1)
	instance_create_layer(x + (linedistancex * 2),	y + (linedistancey * 2 - zh2),	"Instances", obj_linetarget2)
	instance_create_layer(x + (linedistancex * 3),	y + (linedistancey * 3 - zh3),	"Instances", obj_linetarget3)
	instance_create_layer(x + (linedistancex * 4),	y + (linedistancey * 4 - zh4),	"Instances", obj_linetarget4)
	instance_create_layer(x + (linedistancex * 5),	y + (linedistancey * 5 - zh5),	"Instances", obj_linetarget5)
	instance_create_layer(x + (linedistancex * 6),	y + (linedistancey * 6 - zh6),	"Instances", obj_linetarget6)
	
	//move the ball
	
	
}