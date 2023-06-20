var t_start=get_timer();
global.cubemodel = scr_create_obj_mtl("models/maps/riverbank2_1.obj","models/maps/riverbank2_1.mtl",8182,"models/maps/textures");
 var t_end=get_timer();

//TIMER END
  var microseconds=t_end-t_start;
  var milliseconds = microseconds / 1000;
  

///////////////////////   
window_set_caption(string(microseconds) + " Microseconds ,  " + string(milliseconds) + " Milliseconds");

z=0;






