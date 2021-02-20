int ox=300,oy=300;
float x=0,y=0,cx,cy;
int n=0,nmax=100;

void setup(){
  size(600,600);
  background(255);
  cx=random(-2,2);
  cy=random(-2,2);
}

double absc(float x,float y){
  return sqrt(x*x+y*y);
}
void draw(){
  if(n<nmax&&absc(x,y)<2){
    x=x*x-y*y+cx;
    y=2*x*y+cy;
    n++;
  }else{
    n=0;
    x=0;
    y=0;
    cx=random(-2,2);
    cy=random(-2,2);
  }
  
  point(x*150+300,y*150+300);
}
