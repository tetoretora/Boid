Attractor atr;

void setup(){
  size(800,800);
  background(255);
  
  atr=new Attractor();
}

void draw(){
  atr.updateMe(); //<>//
  atr.drawMe();
}

void mousePressed() {
  saveFrame("####.png");
}
