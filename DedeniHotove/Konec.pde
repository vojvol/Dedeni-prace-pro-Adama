class End {
  boolean easymodedisplay;
  int killsdisplay;
  int vlnydisplay;
  int update;
  int shotsfired;
  End() {
    easymodedisplay = false;
    update = 0;
    vlnydisplay = 0;
    killsdisplay = 0;
  }
  void run() {
    update();
    display();
  }
  void display() {
    fill(255,0,0);
    textAlign(CENTER);
    textSize(40);
    text("Zemřel jsi", width/2, height/2);
    textSize(20);
    textAlign(LEFT);
    textSize(40);
    fill(255);
    if(easymodedisplay) text("ENEMY OP PLS NERF (easy mód)",10,40);
    fill(0);
    textSize(20);
    int modekill;
    if (killsdisplay == 1) modekill = 1;
    else if (killsdisplay > 1&&killsdisplay<5) modekill = 2;
    else modekill = 3;
    if (modekill == 1) text("Zabil jsi: "+kills+" nepřítele", 10, 60);
    if (modekill == 2) text("Zabil jsi: "+kills+" nepřátele", 10, 60);
    if (modekill == 3) text("Zabil jsi: "+kills+" nepřátel", 10, 60);
    int modevlny;
    if (vlnydisplay == 1) modevlny = 1;
    else if (vlnydisplay > 1&&vlnydisplay<5) modevlny = 2;
    else modevlny = 3;
    if (modevlny == 1) text("Přežil jsi: "+vlnydisplay+" vlnu", 10, 90);
    if (modevlny == 2) text("Přežil jsi: "+vlnydisplay+" vlny", 10, 90);
    if (modevlny == 3) text("Přežil jsi: "+vlnydisplay+" vln", 10, 90);
    text("Vystřelil jsi: " + shotsfired + "-krát",10,110);
  }
  void update() {
    if (update <1) {
      killsdisplay = kills;
      vlnydisplay = vlny-1;
      update++;
    }
  }
}
