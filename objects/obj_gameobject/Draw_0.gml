// Game Objects are invisible by default
matrix_set(matrix_world, matrix_build(x, y, 0, 0, 0, 0, -0.25, 0.25, 0.25));
vertex_submit(model, pr_trianglelist, text_riverbank);
matrix_set(matrix_world, matrix_build_identity());