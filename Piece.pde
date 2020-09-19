class Piece {
    int pos_x, pos_y;
    int id;
    int[][] blocks;
    color col;
    int n;
    
    Piece (int x, int y, int shape) {
        pos_x = x;
        pos_y = y;
        id = shape;
        blocks = shapes[id];
        col = colors[id];
        n = blocks.length;
    }
    
    void rotate_acl () {
        for (int y = 0; y < n / 2; y++) {
            for (int x = y; x < n - y - 1; x++) {
                int save = blocks[y][x];
                
                blocks[y][x] = blocks[x][n - y - 1];
                blocks[x][n - y - 1] = blocks[n - y - 1][n - x - 1];
                blocks[n - y - 1][n - x - 1] = blocks[n - x - 1][y];
                blocks[n - x - 1][y] = save;
            }
        }
    }
    
    void rotate_cl () {
        for (int y = 0; y < n / 2; y++) {
            for (int x = y; x < n - y - 1; x++) {
                int save = blocks[y][x];
                
                blocks[y][x] = blocks[n - x - 1][y];
                blocks[n - x - 1][y] = blocks[n - y - 1][n - x - 1];
                blocks[n - y - 1][n - x - 1] = blocks[x][n - y - 1];
                blocks[x][n - y - 1] = save;
            }
        }
    }
}
