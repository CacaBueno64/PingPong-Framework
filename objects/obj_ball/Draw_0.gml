//Update depth before drawing self
depth = -bbox_bottom + z * 2;

//My shadow
draw_sprite(spr_shball, 0, x, y);

//The player, with z axis
draw_sprite(spr_ball, 0, x, y + z);