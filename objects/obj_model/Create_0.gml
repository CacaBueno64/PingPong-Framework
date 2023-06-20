    var t_start=get_timer();
global.cubemodel = scr_create_obj_mtl("./fish_h_monsoon_skel.obj","./fish_h_monsoon_skel.mtl",512,"Fish_Tex");
 var t_end=get_timer();

//TIMER END
  var microseconds=t_end-t_start;
  var milliseconds = microseconds / 1000;
  

///////////////////////   
window_set_caption(string(microseconds) + " Microseconds ,  " + string(milliseconds) + " Milliseconds");

z=0;






