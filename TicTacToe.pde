int[][] board = new int[3][3];
int currentPlayer = 1;
boolean gameOver = false;
int winner = 0;

void setup() {
  size(900, 900);
  strokeWeight(10);
}

void draw() {
  background(255);
  drawLines();
  drawXAndO();
  
  if (gameOver) {
    drawLineForWinner();
  }
}

void mousePressed() {
  if (gameOver) return;

  int row = mouseY / 300;
  int col = mouseX / 300;

  if (board[row][col] == 0) {
    board[row][col] = currentPlayer;
    if (hasWon(currentPlayer)) {
      gameOver = true;
      winner = currentPlayer;
    } else if (isBoardFilled()) {
      gameOver = true; // Tie
    } else {
      currentPlayer = (currentPlayer == 1) ? 2 : 1;
    }
  }
}

void drawLines() {
  for (int i = 1; i < 3; i++) {
    line(i * 300, 0, i * 300, height);
    line(0, i * 300, width, i * 300);
  }
}

void drawXAndO() {
  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      int x = col * 300 + 150;
      int y = row * 300 + 150;
      if (board[row][col] == 1) {
        line(x - 100, y - 100, x + 100, y + 100);
        line(x - 100, y + 100, x + 100, y - 100);
      } else if (board[row][col] == 2) {
        noFill();
        ellipse(x, y, 200, 200);
      }
    }
  }
}

boolean hasWon(int player) {
  for (int i = 0; i < 3; i++) {
    if ((board[i][0] == player && board[i][1] == player && board[i][2] == player) ||
        (board[0][i] == player && board[1][i] == player && board[2][i] == player)) {
      return true;
    }
  }
  if ((board[0][0] == player && board[1][1] == player && board[2][2] == player) ||
      (board[0][2] == player && board[1][1] == player && board[2][0] == player)) {
    return true;
  }
  return false;
}

boolean isBoardFilled() {
  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      if (board[row][col] == 0) return false;
    }
  }
  return true;
}

void drawLineForWinner() {
  stroke(255, 0, 0);
  for (int i = 0; i < 3; i++) {
    if (board[i][0] == winner && board[i][1] == winner && board[i][2] == winner) {
      line(0, i * 300 + 150, width, i * 300 + 150);
      stroke(0, 0, 0);
      return;
    }
    if (board[0][i] == winner && board[1][i] == winner && board[2][i] == winner) {
      line(i * 300 + 150, 0, i * 300 + 150, height);
      stroke(0, 0, 0);
      return;
    }
  }
  if (board[0][0] == winner && board[1][1] == winner && board[2][2] == winner) {
    line(0, 0, width, height);
    stroke(0, 0, 0);
  } else if (board[0][2] == winner && board[1][1] == winner && board[2][0] == winner) {
    line(width, 0, 0, height);
    stroke(0, 0, 0);
  }
}
