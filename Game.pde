class Game {
    int origin_x, origin_y;
    int grid_width, grid_height;
    int dim;
    
    int [][] grid;
    color[][] color_grid;
    
    Piece actual_piece;
    
    Game (int ox, int oy, int w, int h) {
        origin_x = ox;
        origin_y = oy;
        grid_width = w;
        grid_height = h;
        dim = grid_width / 10;
        
        grid = new int[20][10];
        for (int i = 0; i < 20; i++) {
            for (int j = 0; j < 10; j++) {
                grid[i][j] = 0;
            }
        }       
        
        color_grid = new color[20][10];
        for (int i = 0; i < 20; i++) {
            for (int j = 0; j < 10; j++) {
                color_grid[i][j] = colors[7];
            }
        }
        
        init_piece ((int)random (7));
    }
    
    void show () {
        push ();
        
        stroke (0);
        strokeWeight (3);
        fill (255);
        translate (origin_x, origin_y);
        rect (0, 0, grid_width, grid_height);
        
        strokeWeight (1);
        for (int i = 0; i < 20; i++) {
            for (int j = 0; j < 10; j++) {
                fill (color_grid[i][j]);
                rect (j * dim, i * dim, dim, dim);
            }
        }
        
        pop ();
    }
    
    void init_piece (int id) {
        // init piece
        if (id == 3) {
            actual_piece = new Piece (4, 0, id);
        } else {
            actual_piece = new Piece (3, 0, id);
        }
        
        // todo: check collision
        
        // draw
        for (int i = 0; i < actual_piece.n; i++) {
            for (int j = 0; j < actual_piece.n; j++) {
                if (actual_piece.blocks[i][j] == 1) {
                    grid[i + actual_piece.pos_y][j + actual_piece.pos_x] = 1;
                    color_grid[i + actual_piece.pos_y][j + actual_piece.pos_x] = actual_piece.col;
                }
            }
        }
    }
    
    void clear_previous () {
        for (int i = 0; i < actual_piece.n; i++) {
            for (int j = 0; j < actual_piece.n; j++) {
                if (actual_piece.blocks[i][j] == 1) {
                    grid[i + actual_piece.pos_y][j + actual_piece.pos_x] = 0;
                    color_grid[i + actual_piece.pos_y][j + actual_piece.pos_x] = colors[7];
                }
            }
        }
    }
    
    void apply_changes () {
        for (int i = 0; i < actual_piece.n; i++) {
            for (int j = 0; j < actual_piece.n; j++) {
                if (actual_piece.blocks[i][j] == 1) {
                    grid[i + actual_piece.pos_y][j + actual_piece.pos_x] = 1;
                    color_grid[i + actual_piece.pos_y][j + actual_piece.pos_x] = actual_piece.col;
                }
            }
        }
    }
    
    void shift_down () {
        clear_previous ();
        
        // todo: check collision
        
        // shift down
        actual_piece.pos_y++;
        
        apply_changes ();
    }
    
    void shift_horizontal (int dir) {
        clear_previous ();
        
        // todo: check collision
        
        // shift
        actual_piece.pos_x += dir;
        
        apply_changes ();
    }
    
    void rotate_piece (int dir) {
        clear_previous ();
        
        //todo: chek collision
        
        // rotate piece
        if (dir == 1) {
            actual_piece.rotate_cl ();
        } else {
            actual_piece.rotate_acl();
        }
        
        apply_changes ();
    }
}
