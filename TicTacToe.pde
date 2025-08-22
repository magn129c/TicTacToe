char[][] board = new char[3][3];
boolean playerTurn = true;
char winner;

int fieldHeight = 200;
int fieldWidth = 200;

int boardSize = 3;

void setup() {
  size(600, 600);
  
  textSize(50);
  fill(0);

  restartBoard();
}

void draw() {

  background(207);
  initBoard();
  if (winner != ' ' && (winner == 'X' || winner == 'O')) {
    text(winner + " har vundet", 175, 250);
    text("Klik for at spille igen", 100, 400);
  }
}

void restartBoard() {

  for (int i = 0; i < boardSize; i++) {
    for (int j = 0; j < boardSize; j++) {
      board[i][j] = ' ';
    }
  }
  winner = ' ';
}

void mouseReleased() {

  if (winner != 'X' && winner != 'O') {
    int column = mouseX / fieldWidth;
    int row = mouseY / fieldHeight;

    if (column >= 0 && column < boardSize && row >= 0 && row < boardSize) {
      if (playerTurn == true) {
        board[column][row] = 'X';
      } else {
        board[column][row] = 'O';
      }
    }

    winner = checkWinner();
    if (winner == ' ') {
      playerTurn = !playerTurn;
    }
  } else {
    restartBoard();
  }
}

void initBoard() {

  line(width/1.5, height, width/1.5, 0);
  line(width/3, height, width/3, 0);

  line(width, height/boardSize, 0, height/boardSize);
  line(width, height/(boardSize/2f), 0, height/(boardSize/2f));

  int textOffset = 10;

  text(board[0][0], 100 - textOffset, 100 + textOffset);
  text(board[1][0], 300 - textOffset, 100 + textOffset);
  text(board[2][0], 500 - textOffset, 100 + textOffset);

  text(board[0][1], 100 - textOffset, 300 + textOffset);
  text(board[1][1], 300 - textOffset, 300 + textOffset);
  text(board[2][1], 500 - textOffset, 300 + textOffset);

  text(board[0][2], 100 - textOffset, 500 + textOffset);
  text(board[1][2], 300 - textOffset, 500 + textOffset);
  text(board[2][2], 500 - textOffset, 500 + textOffset);
}

char checkWinner() {
  for (int row = 0; row < boardSize; row++) {
    if (board[0][row] != ' ' &&
      board[0][row] == board[1][row] &&
      board[1][row] == board[2][row]) {
      return board[0][row];
    }
  }

  for (int column = 0; column < boardSize; column++) {
    if (board[column][0] != ' ' &&
      board[column][0] == board[column][1] &&
      board[column][1] == board[column][2]) {
      return board[column][0];
    }
  }

  if (board[0][0] != ' ' &&
    board[0][0] == board[1][1] &&
    board[1][1] == board[2][2]) {
    return board[0][0];
  }
  if (board[2][0] != ' ' &&
    board[2][0] == board[1][1] &&
    board[1][1] == board[0][2]) {
    return board[2][0];
  }

  return ' ';
}
