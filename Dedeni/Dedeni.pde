int x;
int y;
void setup(){
  size(640,320);
  x = width/2;
  y = height/2;
}
void draw(){
  text("Ahoj Adame",x,y);
  x+=1;
  y-=1;
}
