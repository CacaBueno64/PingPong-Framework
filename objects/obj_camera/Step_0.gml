scr_cam_control();

if(mouse_wheel_up()){
    dist+=-1;
}

if(mouse_wheel_down()){
    dist+=+1;
    if(dist<0){dist=0;}
}

