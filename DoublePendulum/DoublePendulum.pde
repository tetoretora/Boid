Pendulum p;

void setup(){
  background(255);
  size(300,300);
  
  p=new Pendulum();
}

void draw(){
  //background(255);
  p.updateMe();
  p.drawMe();
  
  saveFrame("#####.png");
}
