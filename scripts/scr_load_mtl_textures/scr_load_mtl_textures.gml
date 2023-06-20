/// @description scr_load_mtl_textures(obj_file,mtl_file,texture_resolution,texture_subfolder)
/// @param obj_file
/// @param mtl_file
/// @param texture_resolution
/// @param texture_subfolder
function scr_load_mtl_textures() {
	/*


	    argument0: Path to the obj file (.obj)
	    argument1: Path to the materialfile (.mtl) 
	    argument2: texture resolution this scales the individual textures ONLY USE A SQUARE NUMBER
	    argument3: the folder location in your included files that contains the textures
    
	    returns: Texture ready to use for 3d drawing
    
	*/




	var v_listX,v_listY,v_listZ,vt_listX,vt_listY,vn_listX,vn_listY,vn_listZ;

	var matFileName,matFile;
	var tempallow = false

	var material_set;
	if (argument_count == 1){//if the 2nd argument was not set
	    material_set = false;
	}else{
	    material_set = true;
	    matFileName = argument[1];//directory of the material file
	    }


	var texresolution = argument[2];
	texture_list_mtl = ds_list_create();
	texture_list_name_mtl = ds_list_create();
	 var folderdir = argument[3];

	var row,nx,ny,nz,tx,ty,sx,vx,vy,vz;


	var file;
	file = file_text_open_read(argument[0]);
	var tempname;

	while (file_text_eof(file)==false){
	    row = file_text_read_string(file);
    
	    if (string_char_at(row,1) != "#"){ //if the first character is not a comment

	        switch (string_char_at(row,1)){
                                         
	            case "u":
	                if (material_set == true){
	                if(string_copy(row,2,5) == "semtl"){
	                var vertexColorName,matFile;
                
	                    row=string_delete(row,1,string_pos(" ",row));
	                    vertexColorName=string(string_copy(row,1,string_length(row))); //Materialname in modelfile
                 
                    
                    
	                    matFile = file_text_open_read(matFileName);
                    
                    
        
                    
	                    while (file_text_eof(matFile)==false){
	                        row = file_text_read_string(matFile);
	                        row = string_trim(row)
                       
	                        // char1 = string_lettersdigits(row);
	                         char1 = string_char_at(row,1)
	                        if (char1 != "#"){ //if not comment
                          
	                           //STUPID STUFF NEEDED TO FIX MISTYS MTL FILE
	                      if (char1 = chr(9) || char1 = chr(13) || char1 = chr(32))
	                       {
	                       row = string_replace_all(row,char1,"");
	                  //      row = string_delete(row,0,1);
	                       char1 = string_char_at(row,1);
	                       }
                          
                          
	                            switch (char1){
                                
	                                case "n":
                                
	                                    if(string_copy(row,2,5) == "ewmtl"){
	                                    tempallow = false
	                                        row=string_delete(row,1,string_pos(" ",row));
	                                        vertexColorNameMat=string(string_copy(row,1,string_length(row))); //Colorname in Materialfile
                                        
	                                        if (ds_list_find_index(texture_list_mtl, vertexColorNameMat) = -1)
	                                            {
	                                           //           ds_list_add(texture_list,vertexColorNameMat)  
	                                                      tempallow = true                                
	                                            }  
                                        
	                                    }                
                                
                                
	                                break;
                                
                                
                                
	                                case "m":
	                                test = string_copy(row,2,5);
	                                if(test == "ap_Kd") && tempallow{
	                                tempallow=false
	                                   tempname = row
	                                    tempname=string_delete(tempname,1,string_pos("ap_Kd",tempname)+5);
	                                   tempname=string_delete(tempname,1,string_pos("/",tempname));
                                  
	                                   if (ds_list_find_index(texture_list_mtl, vertexColorNameMat) = -1)
	                                          {
	                                                     ds_list_add(texture_list_mtl,vertexColorNameMat)  
	                                                     // tempallow = true                                
	                                          }  
                                   
	                                    ds_list_add(texture_list_name_mtl,tempname) 
                                    
	                                }
                                
	                                break;
                               
	                            }
                            
	                        }
	                        file_text_readln(matFile);
                    
	                    }
                    
	                    file_text_close(matFile);
                    

	                    }
	                }
            
	            break;
            
	        }
        
	    }
	    file_text_readln(file);

	}
	file_text_close(file);


	texture_array_mtl = texture_list_name_mtl


	 var texarraylength = ds_list_size(texture_array_mtl)
	          var texarray; 
	         var i;
	        for (i = 0; i < texarraylength; i += 1)
	        {
	          d3d_end()
	          d3d_set_lighting(false)
	        bck11[i] = background_add(folderdir+"/"+ds_list_find_value(texture_array_mtl,i),0,0);
      
	        d3d_set_projection_ortho(0,0,texresolution,texresolution,0);
	         surf[i] = surface_create(texresolution,texresolution)
	         surface_set_target(surf[i]);
	         draw_clear_alpha(c_black, 0);
                                 
         
	        // draw_background_general(bck11[i], 0, 0,texresolution,texresolution,0,0,-1,-1,0,c_white,c_white,c_white,c_white,1)           
	         draw_background_stretched(bck11[i], 0, 0,texresolution,texresolution);
         
	         surface_reset_target();
	        tempname[i] = surface_get_texture(surf[i]);
        
        
	        texarray[i] = ptr(tempname[i])
	         d3d_set_lighting(true)
       
          
          
	         d3d_start()
	        }
        
         
	         return texarray;
	   surface_free(surf)
	  background_delete(bck11)


	////return texture_array;
	//delete lists
	///////ds_list_destroy(texture_list);
	///////ds_list_destroy(texture_list_name);







}
