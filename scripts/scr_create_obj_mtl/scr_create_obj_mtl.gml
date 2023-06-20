/// @description scr_create_obj_mtl(obj_file,mtl_file,texture_resolution,texture_subfolder)
/// @param obj_file
/// @param mtl_file
/// @param texture_resolution
/// @param texture_subfolder
function scr_create_obj_mtl() {
	var model;

	model[0] = scr_load_model_obj_mtl(argument[0],argument[1]);
	model[1] = scr_load_mtl_textures(argument[0],argument[1],argument[2],argument[3]);

	return model;



}
