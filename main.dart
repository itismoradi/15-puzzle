//15 puzzle console game
import 'dart:io';
import 'dart:math';

bool gameOver = false;

class Board{
    List table = [ 
        [ -1,  -2,  -3,  -4],
        [ -5,  -6,  -7,  -8],
        [ -9, -10, -11, -12],
        [-13, -14, -15, -16]
    ];

    Command command = Command.UP;

    bool isRepeated(int number){
        for (int i = 0; i < 4; i++) {   //row traversal
            for (int j = 0; j < 4; j++) {   //column traversal
                if(table[i][j] == number){
                    return true;
                }
            }
        }

        return false;
    }
}

enum Command {
    UP,
    DOWN,
    RIGHT,
    LEFT
}

main(){
    Board board = new Board();
    setup(board);

    while (gameOver == false) {
        display(board);
        board.command = input();
        logic(board);
    }
}

// only call in start of game
void setup(Board board){
    print('===== 15 puzzle =====');

    // Generate rendom order of cells numbers
    var randomEngine = Random();
    int r;  // Generated random number

    for (int i = 0; i < 4; i++) {   //row traversal
        for (int j = 0; j < 4; j++) {   //column traversal
            do {  
                //Avoid inserting duplicate element in cell numbers
                r = randomEngine.nextInt(16) + 1;
            }
            while (board.isRepeated(r));

            board.table[i][j] = r;
        }
    }
}

void display(Board board){
    print('---------------------'); 

    for (var i = 0; i < 4; i++){
        //print a cell wall
        stdout.write('| ');
        //print 4 cells in any row
        for (var j = 0; j < 4; j++) {
            int cellNumber = board.table[i][j];

            if(cellNumber == 16){   // Empty cell
                stdout.write('  '); 
            }
            else{
                if(cellNumber < 10){
                    stdout.write(' ');
            }

            stdout.write(cellNumber);
            }
            
            stdout.write(' | ');
        }

        print('\n---------------------');
    }
}

Command input(){
    String? key = stdin.readLineSync();
    Command command = Command.UP;

    if(key == 'w' || key == 'W'){
        command = Command.UP;
    }
    else if(key == 's' || key == 'S'){
        command = Command.DOWN;
    }
    else if(key == 'd' || key == 'D'){
        command = Command.RIGHT;
    }
    else if(key == 'a' || key == 'A'){
        command = Command.LEFT;
    }

    return command;
}

void logic(Board board){
    gameOver = true;
}