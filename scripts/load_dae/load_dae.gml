//loads dae file model
function load_file_dae(_fileaddress)
{
	var _n, _i;
	
	//checks
	if file_exists(_fileaddress)= false
	{ show_message("load_file_dae file doesnt exist: '"+string(_fileaddress)+"'"); return false; }
		
	// Open the file
	var _file = file_text_open_read(_fileaddress);

	// Create the vertex buffer
	var _vbuffer = vertex_create_buffer();
	vertex_begin(_vbuffer, global.vbuffer_format);

	// Create the lists of position/normal/texture data

	var vertex_x = ds_list_create();
	var vertex_y = ds_list_create();
	var vertex_z = ds_list_create();

	var vertex_nx = ds_list_create();
	var vertex_ny = ds_list_create();
	var vertex_nz = ds_list_create();

	var vertex_u = ds_list_create();
	var vertex_v = ds_list_create();
		
	var vertex_r = ds_list_create();
	var vertex_g = ds_list_create();
	var vertex_b = ds_list_create();
	var vertex_a = ds_list_create();

	// Read each line in the file
	var _reading_pos = false;
	var _reading_norm = false;
	var _reading_col = false;
	var _reading_uv = false;
	var _elements;
	while(not file_text_eof(_file))
	{
		var _line = file_text_read_string(_file);
		file_text_readln(_file);
			
		//ending section
		if string_count("</float_array>",_line)>0
		{ 
			//show_debug_message("ended section")					
			_reading_pos = false; 
			_reading_norm = false;
			_reading_col = false;
			_reading_uv = false;
			continue;
		}
			
		//vertices positions
		if string_count("<float_array",_line)>0 && string_count("POSITION-array",_line)>0
		{ _reading_pos = true; continue;}
		if _reading_pos = true
		{
			_elements = string_parse(_line," ",true,true);
			ds_list_add(vertex_x,_elements[0]);
			ds_list_add(vertex_y,_elements[1]);
			ds_list_add(vertex_z,_elements[2]);
			//show_debug_message("position: "+string(_elements[0])+";"+string(_elements[1])+";"+string(_elements[2]) )				
		}
			
		//vertices normals
		if string_count("<float_array",_line)>0 && string_count("Normal0-array",_line)>0
		{ _reading_norm = true; continue;}
		if _reading_norm = true
		{
			_elements = string_parse(_line," ",true,true);
			ds_list_add(vertex_nx,_elements[0]);
			ds_list_add(vertex_ny,_elements[1]);
			ds_list_add(vertex_nz,_elements[2]);
			//show_debug_message("normals: "+string(_elements[0])+";"+string(_elements[1])+";"+string(_elements[2]) )			
		}
			
		//vertices color
		if string_count("<float_array",_line)>0 && string_count("VERTEX_COLOR0-array",_line)>0
		{ _reading_col = true; continue;}
		if _reading_col = true
		{
			_elements = string_parse(_line," ",true,true);
			ds_list_add(vertex_r,_elements[0]*255);
			ds_list_add(vertex_g,_elements[1]*255);
			ds_list_add(vertex_b,_elements[2]*255);
			ds_list_add(vertex_a,_elements[3]*255);
			//show_debug_message("colors: "+string(_elements[0])+";"+string(_elements[1])+";"+string(_elements[2])+";"+string(_elements[3])  );			
		}
			
		//vertices uv
		if string_count("<float_array",_line)>0 && string_count("UV0-array",_line)>0
		{ _reading_uv = true; continue;}
		if _reading_uv = true
		{
			_elements = string_parse(_line," ",true,true);
			ds_list_add(vertex_u,_elements[0]);
			ds_list_add(vertex_v,_elements[1]);
			//show_debug_message("uv: "+string(_elements[0])+";"+string(_elements[1]) )			
		}


			
		//triangles list string
		var _trig_str = "";
		if string_count("<p>",_line)>0 && string_count("</p>",_line)>0
		{
			var _pos1 = string_pos("<p>",_line)+3;
			var _pos2 = string_pos("</p>",_line);
			_trig_str = string_copy(_line,_pos1,_pos2-_pos1);
		}
		
		
		//write vertex buffer
		if _trig_str != ""
		{
			
			//fast parsing of triangles string (digits separated by spaces)
				var _elements = array_create( string_count(" ",_trig_str)  ,0);
				var _buffer = buffer_create(0,buffer_grow,1);
				buffer_write(_buffer,buffer_string,_trig_str);
				

				var _val;
				var _element = "";
				
				buffer_seek(_buffer, buffer_seek_start, 0);

				_n = 0;
				repeat(buffer_get_size(_buffer))
				{
					_val = buffer_read(_buffer,buffer_u8);				
					if _val = 32 && _element != "" //space (separator)
					{
						//add element
						_elements[_n]= real(_element);
						_n ++;	
	
						//next element
						_element = "";
					}
					if _val >= 48 && _val <= 57
					{ _element += string(_val-48);}
				}
				//last element
				if _element != ""
				{ _elements[_n]= real(_element); }
	
				//done
				buffer_delete(_buffer);
			

			//inspect elements and write final vertex buffer
			var _nb_vars = string_count("<input",_line);//nb of indexes per triangle vertex. usually min 4: pos,normal,uv,color
			for(_n=0;_n<array_length(_elements);_n+= _nb_vars)
			{
				_i = _elements[_n];
				_x = vertex_x[|_i]; _y = vertex_y[|_i]; _z = vertex_z[|_i];
				
				_i = _elements[_n+1];
				_nx = vertex_nx[|_i]; _ny = vertex_ny[|_i]; _nz = vertex_nz[|_i];
				
				_i = _elements[_n+2];
				_u = vertex_u[|_i]; _v = vertex_v[|_i];

				_i = _elements[_n+3];
				_r = vertex_r[|_i]; _g = vertex_g[|_i]; _b = vertex_b[|_i]; _a = vertex_a[|_i];


				//add triangle vertice
				vertex_position_3d(_vbuffer, _x, _y, _z);
				vertex_normal(_vbuffer, _nx, _ny, _nz);
				vertex_color(_vbuffer, make_color_rgb(_r,_g,_b), _a);
				vertex_texcoord(_vbuffer, _u, _v);	
				
			}

		}
			
	} 

	//end the vertex buffer
	vertex_end(_vbuffer);

	//cleanup
	file_text_close(_file);
	ds_list_destroy(vertex_x);
	ds_list_destroy(vertex_y);
	ds_list_destroy(vertex_z);
	ds_list_destroy(vertex_nx);
	ds_list_destroy(vertex_ny);
	ds_list_destroy(vertex_nz);
	ds_list_destroy(vertex_u);
	ds_list_destroy(vertex_v);
	ds_list_destroy(vertex_r);
	ds_list_destroy(vertex_g);
	ds_list_destroy(vertex_b);
	ds_list_destroy(vertex_a);
	
//export in ymesh
//save_ymesh(_vbuffer,_fileaddress)


	//result: return vbuffer as a normal buffer
	var _model_buffer = buffer_create_from_vertex_buffer(_vbuffer,buffer_grow,1);
	vertex_delete_buffer(_vbuffer);
	return _model_buffer;
}

