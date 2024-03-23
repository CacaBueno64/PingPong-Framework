draw_self()
//draw_sprite_stretched(spr_obstaclecheck, 0, x, y, 4, point_distance(x, y, obj_linetargetend.x, obj_linetargetend.y))
//draw_sprite_ext(spr_obstaclecheck, 0, x, y, 2, point_distance(x, y, obj_linetargetend.x, obj_linetargetend.y), direction-90, c_white, 1)
draw_sprite_general(spr_obstaclecheck, 0, 0, 0, 2, point_distance(x, y, obj_linetargetend.x, obj_linetargetend.y), x, y, 2, 2, direction+90, c_white, c_white, c_white, c_white, 1)