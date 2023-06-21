# InazumaGML

Here's a ***WIP*** recreation of nds/3ds inazuma eleven engine written in GML (gamemaker language)

Requirement : last version of gamemaker 
https://gamemaker.io/en/download

to open the project, just open the .ypp file.

if you want to learn more about gml, read the one and only, the saint manual : https://manual.gamemaker.io/

### Setup 3d models

the model **must be** an .obj (triangulated, no squares!!), with a .mtl file and need to be placed in the **"datafiles"** folder
the texture (.png) need to be placed in a subfolder 

- to load a model, you need to type in a create event :

``variable = scr_create_obj_mtl(".obj file directory",".mtl file directory",texture_resolution,"the texture subfolder directory")``

example :

``model = scr_create_obj_mtl("models/maps/riverbank2_1.obj","models/maps/riverbank2_1.mtl",8182,"models/maps/textures")``

- to draw a model, type a draw event :

``scr_draw_obj_mtl(variable, scale_x, scale_y, scale_z, rotate_x, rotate_y, rotate_z, xpos, ypos, zpos)``

example :

``scr_draw_obj_mtl(test_model, 20, 20, 20, -90, 0, 0, 0, 0, 0)``

obj mtl loader source : https://forum.gamemaker.io/index.php?threads/free-3d-obj-mtl-multi-texture-importer.47145/
