import java.util.Random;

int SIZE_MAX = 100;

int[][] cell;
int[][] scell;

Midium m;

void setup(){
  size(100,100);
  background(255);
  
  m = new Midium();
  
}

void draw(){
  
  background(255);
  m.disp(); //<>//
  m.next();
  
}
