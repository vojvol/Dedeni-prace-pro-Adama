ArrayList<Enemy> enemy; //Nepřátelé
int kills; //Počet zabitých nepřátel
boolean loading; //Načtení nové vlny

Player mov;
Ammo ammo;
void setup() {
  size(640, 320);
  background(51, 204, 51);
  mov = new Player();
  ammo = new Ammo();
  enemy = new ArrayList<Enemy>();
  loading = true;
  kills = 0;
  stroke(0);
}
void draw() {
  background(51, 204, 51);
  fill(102, 51, 0);
  rect(35,0,30,height);
  fill(0);
  if (loading == true) {
    int rand = (int)random(3,8); //Počet nepřátel
    for (int i = rand-1; i >= 0; i--) {
      int randomcount = (int) random(0,7); //Typ nepřátel
      if(randomcount<=3) enemy.add(new Enemy(random(0, height)));
      else if(randomcount>3&&randomcount<=5) enemy.add(new LightEnemy(random(0, height)));
      else if(randomcount> 5) enemy.add(new HeavyEnemy(random(0, height)));
    }
    loading = false;
  } else {
    text("Zabil jsi: " + kills + " nepřátel.",10,20);
    for (int i = enemy.size()-1; i >= 0; i--) {
      Enemy e= enemy.get(i);
      e.run();
      if (e.isDead()) {
        enemy.remove(i);
        kills++;
      }
    }
    if(enemy.isEmpty()){
      loading = true;
    }
    mov.run();
    ammo.run();
    if(mov.dead == true){
      text("Jsi mrtev.",width/2,height/2);
      exit();
    }
  }
}
void mouseClicked(){
  ammo.shot = true;
}
