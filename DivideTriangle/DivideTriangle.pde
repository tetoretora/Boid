int _maxLevels=6;

Triangle _tri1,_tri2;

void setup(){
  size(800,800);
  background(255);
  smooth();
  
  _tri1=new Triangle(1,0,0,0,height,width,height,random(255),random(255),random(255));
  _tri1.drawMe();
  _tri2=new Triangle(1,0,0,width,0,width,height,random(255),random(255),random(255));
  _tri2.drawMe(); //<>//
}

void draw(){
}

void mousePressed(){
  save("####.png");
}
