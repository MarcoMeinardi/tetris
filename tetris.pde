Game game;


void setup () {
    size (1000, 850);
    game = new Game ();
    
}

void draw () {
    if (game.game_over) {
        noLoop ();
        println ("game over");
    }
    background (255);
    game.show();
}

void keyPressed () {
    if (keyCode == LEFT) {
        game.shift_horizontal (-1);
    } else if (keyCode == RIGHT) {
        game.shift_horizontal ( 1);
    } else if (keyCode == DOWN) {
        if (!game.shift_down ()) {
            game.set_piece ((int) random (7));
        }
    } else if (key == 'z' || key == 'Z') {
        game.rotate_piece (-1);
    } else if (key == 'x' || key == 'X') {
        game.rotate_piece (1);
    } else if (key == ' ') {
        game.hold ();
    }
}
