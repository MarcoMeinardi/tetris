Game game;


void setup () {
    size (1000, 850);
    game = new Game (300, 25, 400, 800);
    
}

void draw () {
    background (255);
    game.show();
}

void keyPressed () {
    if (keyCode == LEFT) {
        game.shift_horizontal (-1);
    } else if (keyCode == RIGHT) {
        game.shift_horizontal ( 1);
    } else if (keyCode == DOWN) {
        game.shift_down ();
    } else if (key == 'z' || key == 'Z') {
        game.rotate_piece (-1);
    } else if (key == 'x' || key == 'X') {
        game.rotate_piece (1);
    }
}
