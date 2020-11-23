class RocketEnemy extends Enemy {//NOT WORKING
  float shotx;
  float shoty;
  boolean shot;
  int shotd;
  float shotspeed;
  int i;
  RocketEnemy(float randy) {
    super(randy);
    speed =1;
    hp = 1;
    fillcolor = color(255, 0, 0);
    shot = false;
    shotd = 5;
    shotx = x;
    shoty = randy;
    shotspeed = 2;
    i = 0;
  }
  void run() {
    super.run() ;
    shoot();
  }
  void display() {
    super.display();
    if (shot) {
      if (!isDead()) {
        fill(0, 0, 0);
        circle(shotx, shoty, shotd);
      }
    }
  }
  void move() {
    super.move();
    float kill = dist(shotx, shoty, mov.x, mov.y); //Pokud se dotkne hráče, hráč je mrtev
    if (kill < (shotd/2+ mov.d/2)) {
      mov.dead = true;
    }
    if (mov.y == y || mov.y < y+d && mov.y > y-d) {
      float waittime = 50;
      if (i<waittime) {
        i++;
        print("\n"+i);
      } else {
        i = 0;
        y = (int)random(y-50, y+50);
        if (y>=height-30||x<=70) y = height/2;
      }
    } else i=0;
  }
  void shoot() {
    if (!shot) {
      if (x < width-20) {
        shotx = x;
        shoty = y;
        shot = true;
      } else {
        shotx = x;
        shoty = y;
      }
    } else if (shot) {
      if (!isDead()) {
        if (mov.x<shotx) {
          shotx-=shotspeed;
        }
        if (mov.y<shoty) {
          shoty-=shotspeed;
        }
        if (mov.x>shotx) {
          shotx+=shotspeed;
        }
        if (mov.y>shoty) {
          shoty+=shotspeed;
        }
      }
    }
  }
}
