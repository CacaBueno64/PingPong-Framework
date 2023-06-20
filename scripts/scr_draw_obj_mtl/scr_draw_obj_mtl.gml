/// @description scr_draw_obj_mtl(model_array,scalex,scaley,scalez,rotatex,rotatey,rotatez)
/// @param model_array
/// @param scalex
/// @param scaley
/// @param scalez
/// @param rotatex
/// @param rotatey
/// @param rotatez
function scr_draw_obj_mtl() {

	model = argument[0];

	var i;
	var objtexlistname = 0;
	var mtltexlistname; 
	lngth = array_length_1d(model[0])
	lngth2 =  array_length_1d(model[1])
	texturearray = model[1];
	modelM = model[0]

	   for (i = 0; i < lngth; i += 1)
	       {

	                if first = true
	                {
	                     objtexlistname = ds_list_find_value(texture_list_obj,i);
                     
	                     var fnd = false
                      
                      
	                      for (i2 = 0; i2 < lngth2; i2++)
	                      {
	                      mtltexlistname = ds_list_find_value(texture_list_mtl,i2);
	                          if mtltexlistname == objtexlistname
	                          {
	                              fnd = true
	                              temptexname = texturearray[i2];
	                              texturearrayM[i] = temptexname
	                          }
                      
                      
	                      }
	                      if fnd = false
	                      {
	                          temptexname = -1
	                          texturearrayM[i] = temptexname
	                      }
	             }
         
	            texture_set_repeat(1);

          
	            d3d_transform_set_identity();
	            d3d_transform_add_rotation_x(argument[4]);
	            d3d_transform_add_rotation_y(argument[5]);
	            d3d_transform_add_rotation_z(argument[6]);
	            d3d_transform_add_scaling(argument[1],argument[2],argument[3]);
	            d3d_transform_add_translation(x,y,z+4);
         
	           d3d_model_draw(modelM[i],0,0,0,texturearrayM[i]);
           
	           d3d_transform_set_identity();

          
	       }
       
	if first == true
	{
	    texturearray = 0    
	    first = false;
	}
       
 




}
