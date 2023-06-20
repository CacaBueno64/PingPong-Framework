model = d3d_model_create();
d3d_model_primitive_begin(model,pr_linelist);
d3d_model_vertex_color(model,0,0,0,c_blue,1);
d3d_model_vertex_color(model,0,0,1,c_blue,1);

d3d_model_vertex_color(model,0,0,0,c_red,1);
d3d_model_vertex_color(model,1,0,0,c_red,1);

d3d_model_vertex_color(model,0,0,0,c_green,1);
d3d_model_vertex_color(model,0,1,0,c_green,1);
d3d_model_primitive_end(model);

