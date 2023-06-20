/// @description  @description d3d - set projection 
/// @param xFrom	x of from position
/// @param yFrom	y of from position
/// @param zFrom	z of from position
/// @param xTo		x of to position
/// @param yTo		y of to position
/// @param zTo		z of to position
/// @param xUp		x of up vector
/// @param yUp		y of up vector
/// @param zUp		z of up vector
function d3d_set_projection(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	
	var m = matrix_build_lookat( argument0, argument1, argument2, 
								 argument3, argument4, argument5,
								 argument6, argument7, argument8 );

	var cam = camera_get_active();
	camera_set_view_mat( cam, m );
	if( !global.__d3d ) {
		//apply default ortho projection
		var mproj = matrix_build_projection_ortho(camera_get_view_width(cam),camera_get_view_height(cam),1,32000);
		camera_set_proj_mat( cam, mproj);
	}
	camera_set_proj_mat(cam, matrix_build_projection_perspective_fov(-16, -window_get_width() / window_get_height(), 1, 32000))
	camera_apply(cam);


}
