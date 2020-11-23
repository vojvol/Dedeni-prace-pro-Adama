ArrayList<Enemy> enemy; //Nepřátelé //<>//
int kills; //Počet zabitých nepřátel
boolean loading; //Načtení nové vlny
int countR;
int vlny;
float okraj;
boolean easymode;
boolean pdead;
Player mov;
Ammo ammo;
End end;
void setup() {
  fullScreen();
  textSize(20);
  //size(640, 320);
  background(51, 204, 51);
  mov = new Player();
  ammo = new Ammo();
  end = new End();
  enemy = new ArrayList<Enemy>();
  loading = true;
  kills = 0;
  stroke(0);
  countR = 0;
  easymode = false;
  pdead = false;
  okraj =  height-60;
}
void draw() {
  background(51, 204, 51);
  if (pdead) {
    if (easymode) end.easymodedisplay = true;
    end.run();
  } else {
    fill(102, 51, 0);
    rect(30, 50, 35, okraj);
    fill(0);
    if (loading == true) {
      vlny +=1;
      int rand = (int)random(3, 8); //Počet nepřátel
      for (int i = rand-1; i >= 0; i--) {
        int randomcount = (int) random(0, 7); //Typ nepřátel
        if (randomcount<=3) enemy.add(new Enemy(random(70, height-30)));
        else if (randomcount>3&&randomcount<=5) enemy.add(new LightEnemy(random(70, height-30)));
        else if (randomcount> 5) enemy.add(new HeavyEnemy(random(70, height-30)));
        if (countR<1) {
          enemy.add(new RocketEnemy(random(70, height-30)));
          countR+=1;
        }
      }
      loading = false;
    } else {
      text("Zabil jsi: " + kills + " nepřátel.\nPočet vln: "+ vlny+".", 10, 20);
      textAlign(CENTER);
      if (easymode) text("EASY\nMÓD\nAKTIVOVÁN", width/2, 20);
      textAlign(LEFT);
      for (int i = enemy.size()-1; i >= 0; i--) {
        Enemy e= enemy.get(i);
        e.run();
        if (e.isDead()) {
          enemy.remove(i);
          kills++;
        }
      }
      if (enemy.isEmpty()) {
        loading = true;
        countR = 0;
      }
      mov.run();
      ammo.run();
      if (mov.dead == true) {
        pdead = true;
      }
    }
  }
}
void mouseClicked() {
  ammo.shot = true;
}
void keyPressed() {
  if (key == 'h'||key == 'H') {
    easymode = true;
  }
}
