/// @description scr_load_model_obj_mtl(obj_file,mtl_file)
/// @param obj_file
/// @param mtl_file
function scr_load_model_obj_mtl() {
	/*
	    scr_load_model_obj(model_file,material_file[optional]);

	    argument0: Path to the obj file (.obj)
	    argument1: (optional): Path to the materialfile (.mtl) 
    
	    returns: 3D model array
    
	    Make sure that the imported model only consists of triangles!
	*/



	texturearrayM =0
	first = true


	var v_listX,v_listY,v_listZ,vt_listX,vt_listY,vn_listX,vn_listY,vn_listZ;

	var matFileName,matFile;


	var material_set;
	if (argument_count == 1){//if the 2nd argument was not set
	    material_set = false;
	}else{
	    material_set = true;
	    matFileName = argument[1];//directory of the material file
	    }



	var vertexColor;
	vertexColor = c_white;

	texture_list_obj = ds_list_create();
	//texture_list_name = ds_list_create();

	v_listX = ds_list_create();
	v_listY = ds_list_create();
	v_listZ = ds_list_create();

	vt_listX = ds_list_create();
	vt_listY = ds_list_create();
	vt_listZ = ds_list_create();

	vn_listX = ds_list_create();
	vn_listY = ds_list_create();
	vn_listZ = ds_list_create();



	var row,nx,ny,nz,tx,ty,sx,vx,vy,vz;


	matFile = file_text_open_read(matFileName);

	                    while (file_text_eof(matFile)==false){
	                        row = file_text_read_string(matFile);
                        
	                        if (string_char_at(row,1) != "#"){ //if not comment
                    
	                            switch (string_char_at(row,1)){
                                
	                                case "n":
                                
	                                    if(string_copy(row,2,5) == "ewmtl"){
                                    
	                                        row=string_delete(row,1,string_pos(" ",row));
	                                        vertexColorNameMat=string(string_copy(row,1,string_length(row))); //Colorname in Materialfile
                                        
	                                         if (ds_list_find_index(texture_list_obj, vertexColorNameMat) = -1)
	                                            {
	                                                      ds_list_add(texture_list_obj,vertexColorNameMat)                                  
	                                            }
                                            
	                                    }                
                                
                                
	                                break;
	                            }
                            
	                        }
	                        file_text_readln(matFile);
                    
	                    }
	file_text_close(matFile);



	// add verts
	var file;
	file = file_text_open_read(argument[0]);


	  while (file_text_eof(file)==false){
	    row = file_text_read_string(file);
    
	    if (string_char_at(row,1) != "#"){ //if the first character is not a comment

	        switch (string_char_at(row,1)){
	case "v":
            
	            switch (string_char_at(row,2)){
	                case "n":
	                    row=string_delete(row,1,string_pos(" ",row));
	                    nx=real(string_copy(row,1,string_pos(" ",row)));
	                    row=string_delete(row,1,string_pos(" ",row));
	                    ny=real(string_copy(row,1,string_pos(" ",row)));  //-1*
	                    row=string_delete(row,1,string_pos(" ",row));
	                    nz=real(string_copy(row,1,string_length(row)));
                    
	                    ds_list_add(vn_listX,nx);
	                    ds_list_add(vn_listY,ny);
	                    ds_list_add(vn_listZ,nz);   
	                break;
                
	                case "t":
	                    row=string_delete(row,1,string_pos(" ",row));
	                    tx=real(string_copy(row,1,string_pos(" ",row)));
	                    row=string_delete(row,1,string_pos(" ",row));
	                    ty=1-real(string_copy(row,1,string_length(row)));  //1-
                    
	                    ds_list_add(vt_listX,tx);
	                    ds_list_add(vt_listY,ty); 
	                break;
                
                
	                default:
	                    row=string_delete(row,1,string_pos(" ",row));
	                    vx=real(string_copy(row,1,string_pos(" ",row)));
	                    row=string_delete(row,1,string_pos(" ",row));
	                    vy=real(string_copy(row,1,string_pos(" ",row)));// *-1
	                    row=string_delete(row,1,string_pos(" ",row));
	                    vz=real(string_copy(row,1,string_length(row)));
                    
	                    ds_list_add(v_listX,vx);
	                    ds_list_add(v_listY,vy);
	                    ds_list_add(v_listZ,vz);
	                break;
                
	            }
            
	            break;
            
            
	            case "s":
	                row=string_delete(row,1,string_pos(" ",row));
	                sx=string(string_copy(row,1,string_pos(" ",row)));
	                if (sx != "off"){
                
	                }
            
	            break;
	}
	    file_text_readln(file);

	}


    
	}
	   file_text_close(file); 

   
	var model;
	var modelprog = 0
	 var found = false;
	var i;

	model[0] = d3d_model_create()
	d3d_model_primitive_begin(model[0],pr_trianglelist);
	d3d_model_primitive_end(model[0]);


	for (i = 0; i < ds_list_size(texture_list_obj); i += 1)
	    {
	    file = file_text_open_read(argument[0]);
   
    
    
    
    
	         currentmat = ds_list_find_value(texture_list_obj, i)
    
	          if modelprog==1
	                         {
	                         d3d_model_primitive_end(model[i-1]);                  
	                        }
                                
	                        model[i] = d3d_model_create()
	                        d3d_model_primitive_begin(model[i],pr_trianglelist);
	                         modelprog =1
                    
         
	         while (file_text_eof(file)==false){
	        row = file_text_read_string(file);
        
        
	        if (string_char_at(row,1) != "#"){ //if the first character is not a comment
	                switch (string_char_at(row,1))
	                {
	                case "u":
	                if (material_set == true){
	                if(string_copy(row,2,5) == "semtl")
	                    {
                    
	                     var vertexColorName,matFile;
                
	                    row=string_delete(row,1,string_pos(" ",row));
	                    vertexColorName=string(string_copy(row,1,string_length(row))); //Materialname in modelfile
                         
	                    matFile = file_text_open_read(matFileName);
                    
	                    while (file_text_eof(matFile)==false){
	                        row2 = file_text_read_string(matFile);
                        
	                        if (string_char_at(row2,1) != "#"){ //if not comment
                    
	                            switch (string_char_at(row2,1)){
                                
	                                case "n":
                                
	                                    if(string_copy(row2,2,5) == "ewmtl"){
                                    
	                                        row2=string_delete(row2,1,string_pos(" ",row2));
	                                       vertexColorNameMat=string(string_copy(row2,1,string_length(row2))); //Colorname in Materialfile
	                                    }                
                                
                                
	                                break;
                                
                                
	                                case "K":
                                
	                                switch (string_char_at(row2,2)){
	                                    case "d":
                                    
	                                        if (vertexColorName == vertexColorNameMat){//if colorname in modelfile and materialfile are equal
                                    
	                                            row2=string_delete(row2,1,string_pos(" ",row2));
	                                            r=real(string_copy(row2,1,string_pos(" ",row2)));
	                                            row2=string_delete(row2,1,string_pos(" ",row2));
	                                            g=real(string_copy(row2,1,string_pos(" ",row2)));
	                                            row2=string_delete(row2,1,string_pos(" ",row2));
	                                            b=real(string_copy(row2,1,string_length(row2)));
                                            
	                                            r = 255*r;
	                                            g = 255*g;
	                                            b = 255*b;
                                            
	                                            vertexColor = make_color_rgb(r,g,b); //c_white//
	                                        }        
	                                    break;
                                    
	                                }
                                
	                                break;
	                            }
                            
	                        }
	                        file_text_readln(matFile);
                    
	                    }
                 
	                         file_text_close(matFile)
	                         }
                    
	                    }
                
                
	                break;
                
	                case "f":
	            var f;
	            if currentmat == vertexColorName
	            {
	            row=string_delete(row,1,string_pos(" ",row));
	            f[0]=string(string_copy(row,1,string_pos(" ",row)));
	            row=string_delete(row,1,string_pos(" ",row));
	            f[2]=string(string_copy(row,1,string_pos(" ",row)));
	            row=string_delete(row,1,string_pos(" ",row));
	            f[1]=string(string_copy(row,1,string_length(row)));
            
	                var p,z,e1,e2,e3;
	                p=0;
	                repeat(3){
	                    z = f[p];
                    
	                    z=string_delete(z,0,string_pos("/",z));
	                    e1=string(string_copy(z,1,string_pos("/",z)-1));
	                    z=string_delete(z,1,string_pos("/",z));
	                    e2=string(string_copy(z,1,string_pos("/",z)-1));
	                    z=string_delete(z,1,string_pos("/",z));
	                    e3=string(string_copy(z,1,string_length(z)));
                    
	                    p+=+1;
                    
                    
	                    e1 = real(e1)-1;
	                    e3 = real(e3)-1;
	                    e2 = real(e2)-1;
                    

	                 d3d_model_vertex_normal_texture_colour(model[i],ds_list_find_value(v_listX,e1),ds_list_find_value(v_listY,e1),ds_list_find_value(v_listZ,e1),ds_list_find_value(vn_listX,e3),ds_list_find_value(vn_listY,e3),ds_list_find_value(vn_listZ,e3),ds_list_find_value(vt_listX,e2),ds_list_find_value(vt_listY,e2),vertexColor,1);         
	                }
	                }
                
            
            
	            break;
                
                
        
	        }
    
    
   
	        file_text_readln(file);

	        }


     
	    }
	      file_text_close(file); 

	}
	d3d_model_primitive_end(model[i-1]);


	ds_list_destroy(v_listX);
	ds_list_destroy(v_listY);
	ds_list_destroy(v_listZ);
	ds_list_destroy(vt_listX);
	ds_list_destroy(vt_listY);
	ds_list_destroy(vn_listX);
	ds_list_destroy(vn_listY);
	ds_list_destroy(vn_listZ);
	//ds_list_destroy(texture_list_obj);

	return model;





}
