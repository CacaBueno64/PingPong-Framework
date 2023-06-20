{

var mir;
mir = 1;

  draw_set_alpha(1);
  draw_set_color(c_white);


var h;
h = cam_height_z;

var target;
target = obj_model;

d3d_set_projection(target.x+(cx*dist),target.y+(cy*dist),target.z+(cz*dist)+h,target.x,target.y,target.z+h,xup,yup,zup);


}




