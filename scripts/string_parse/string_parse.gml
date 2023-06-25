//parse string into an array
function string_parse(_string,_separator,_no_empty,_realvals)
{		
	var _sep_l = string_length(_separator);
	var _n = 0;
	
	if _realvals
	{ var _result = array_create( string_count(_separator,_string)+1 ,0); }
	else
	{ var _result = array_create( string_count(_separator,_string)+1 ,""); }
	

	//simple separator
	//----------------------------------------------
	if _sep_l = 1
	{
		var _c;
		var _element = "";
		var _length = string_length(_string);
		for(var _p=1;_p<=_length;_p++)
		{
			_c = string_char_at(_string,_p);				
			if _c = _separator
			{
				//add element to result
				if _no_empty = false or _element != ""
				{
					if _realvals
					{ _result[_n]= real(_element); }
					else
					{ _result[_n]= _element; }
					_n ++;	
				}
						
				//next element
				_element = "";
			}
			else
			{ _element += _c;}
		}
			
		//last element
		if _element != ""
		{
			if _realvals
			{ _result[_n]= real(_element); }
			else
			{ _result[_n]= _element; }
			_n ++;					
		}
	}
			
	//complex separator
	else
	{
		var _nxtsep;
		while( string_length(_string) > 0) 
		{
		    _nxtsep = string_pos(_separator,_string); //next separator's position
        
		    //parse element
		    if _nxtsep >0
		    {
		        if _nxtsep > 1 or _no_empty = false 
		        {
					if _realvals
					{ _result[_n]= real(string_copy(_string, 1, _nxtsep-1)); }
					else
					{ _result[_n]= string_copy(_string, 1, _nxtsep-1); }
					_n ++;			
		        }            
		        _string = string_copy( _string, _nxtsep +_sep_l, string_length( _string));
		    }
        
		    //none: last element
		    else 
		    {
				if _realvals
				{ _result[_n]= real(_string); }
				else
				{ _result[_n]= _string; }
				_n ++;

		        _string = "";
				break;
		    }
		}
	}

	//done
	return _result;
}
