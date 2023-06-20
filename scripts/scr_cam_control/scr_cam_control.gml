function scr_cam_control() {
	if mouse_check_button(mb_left){
	var m_x,m_y,mausx,mausy;

	m_x = window_get_width()/2;
	m_y = window_get_height()/2;

	mausx = m_x - window_mouse_get_x();
	mausy = m_y - window_mouse_get_y();


	obj_camera.zview += (window_mouse_get_y()-window_get_height()/2)/20;

	if (obj_camera.zview<0){
	obj_camera.zview = obj_camera.zview +360;
	}
	if(obj_camera.zview>360){
	obj_camera.zview = obj_camera.zview -360;
	}

	mouse_direction += +mausx/(obj_camera.sensibility/30);

	if (mouse_direction<0){
	mouse_direction = mouse_direction +360;
	}
	if(mouse_direction>360){
	mouse_direction = mouse_direction -360;
	}


	window_mouse_set(m_x,m_y);

	}


	cc = cos(zview*pi/180);
	//cc=1;
	cx = cos(mouse_direction*pi/180)*cc;
	cy = -sin(mouse_direction*pi/180)*cc;
	cz = sin(zview*pi/180);



	xup=0;
	yup=0;

	zup=1//cos(zview*pi/180);



}
