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
  
}

void mousePressed() {
  if (gameOver) return;

  int row = mouseY / 300;
  int col = mouseX / 300;

  if (board[row][col] == 0) {
    board[row][col] = currentPlayer;
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
