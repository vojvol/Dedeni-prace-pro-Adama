class Enemy {
  color fillcolor; //Výplň
  float x;
  float y;
  int d;
  float speed;
  int hp;
  Enemy(float randy) {
    y = randy;
    x = width;
    speed = 0.5;
    hp = 5;
    d = 10;
    fillcolor = color(255, 0, 102);
  }
  void run(){
    display();
    move();
  }
  void display() {
    fill(fillcolor);
    circle(x, y, d);
    fill(0);
    text(hp,x+10,y);
  }
  void move() {
    float hit = dist(x, y, ammo.x, ammo.y); //Pokud ho zasáhne náboj 
    if (hit < (d/2+ ammo.d/2)) {
      hp -=2;
    }
    float kill = dist(x, y, mov.x, mov.y); //Pokud se dotkne hráče, hráč je mrtev
    if (kill < (d/2+ mov.d/2)) {
      mov.dead = true;
    }
    if(x<=0) mov.dead = true;
    x-=speed;
  }
  boolean isDead() {
    if (hp <= 0) {
      return true;
    } else {
      return false;
    }
  }
}
