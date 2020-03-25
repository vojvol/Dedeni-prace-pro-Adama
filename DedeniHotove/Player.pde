class Player {
  float x;
  float y;
  int d;
  boolean dead;
  Player() {
    d = 20;
    dead = false;
    x = 50;
  }
  void run() {
    move();
    display();
  }
  void display() {
    fill(51, 153, 255);
    circle(x, y, d);
  }
  void move() {
    if (dead != true) {
      y = mouseY;
    }
  }
}
