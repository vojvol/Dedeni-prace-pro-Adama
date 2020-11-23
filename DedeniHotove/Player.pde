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
    if(easymode) line(x,y,mouseX,y);
  }
  void move() {
    if (dead != true) {
      y = mouseY;
      if(y <= 50) y = 60;
      if(y>= height-20) y = height-20;
    }
  }
}
