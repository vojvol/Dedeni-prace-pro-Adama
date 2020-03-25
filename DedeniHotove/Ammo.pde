class Ammo {
  float x;
  float y;
  int d;
  boolean shot; //Vystřelen
  Ammo() {
    shot = false;
    d = 5;
  }
  void run(){
    display();
    move();
  }
  void move() {
    if (shot == false) {
      x = mov.x;
      y = mov.y;
    } else {
      if (x <=width) {
        x+=10;
      }else{
        shot = false;
      }
    }
  }
  void display(){
    fill(255, 255, 0);
    circle(x,y,d);
  }
}
