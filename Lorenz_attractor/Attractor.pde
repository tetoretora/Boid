class Attractor{
  float x,y,z;
  float p,r,b;
  float time;
  
  Attractor(){
    x=-10;
    y=20;
    z=1;
    p=10;
    r=28;
    b=8.0/3;
    time=0.004;
  }
  
  void updateMe(){
    x=-p*x*time+p*y*time+x;
    y=-x*z*time+r*x*time-y*time+y;
    z=x*y*time-b*z*time+z;
  }
  
  void drawMe(){
    point(10*x+400,10*y+400);
  }
}
