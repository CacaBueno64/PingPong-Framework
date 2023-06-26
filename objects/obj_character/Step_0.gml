speed = obj_dir_arrow.chara_speed
direction = obj_dir_arrow.chara_direction
if keyboard_check(ord("A"))
{
	x = 0
	y = 0
}

var dir = obj_dir_arrow.chara_direction

if dir > 0 and dir <= 22.5
	player_direction = 0
else if dir > 22.5 and dir <= 22.5+45
	player_direction = 1
else if dir > 22.5+45 and dir <= 22.5+90
	player_direction = 2
else if dir > 22.5+90 and dir <= 22.5+90+45
	player_direction = 3
else if dir > 22.5+90+45 and dir <= 22.5+180
	player_direction = 4
else if dir > 22.5+180 and dir <= 22.5+180+45
	player_direction = 5
else if dir > 22.5+180+45 and dir <= 22.5+180+90
	player_direction = 6
else if dir > 22.5+180+90 and dir <= 22.5+180+90+45
	player_direction = 7
else if dir > 22.5+180+90+45 and dir <= 22.5+360
	player_direction = 0

