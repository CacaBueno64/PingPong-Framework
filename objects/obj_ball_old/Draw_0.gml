/*//Update depth before drawing self
depth = -bbox_bottom + z * 2

//the shadow
draw_sprite(spr_shball, 0, x, y)

//the ball with z axis
draw_sprite(spr_ball, 0, x, (y - z) - 3)

