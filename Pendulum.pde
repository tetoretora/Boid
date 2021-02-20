class Pendulum{
  float len1,len2;
  float m1,m2;
  float th1,th2;
  float vth1,vth2;
  float x1,y1,x2,y2;
  float t;
  float delt;
  float g;
  
  Pendulum(){
    len1=len2=75;
    m1=m2=1;
    th1=PI;
    th2=3*PI/2;
    vth1=vth2=0;
    
    x1=len1*cos(th1);
    y1=len1*sin(th1);
    x2=len1*cos(th1)+len2*cos(th2);
    y2=len1*sin(th1)+len2*cos(th2);
    
    t=0;
    delt=0.1;
    g=9.8;
  }
  
  void updateMe(){
    float c=cos(th1-th2);
    float s=sin(th1-th2);
    float m12=m1+m2;
    
    vth1=vth1+delt*(g*(sin(th2)*c-m12/m2*sin(th1))-(len1*pow(vth1,2)*c+len2*pow(vth2,2))*s)/(len1*(m12/m2-pow(c,2)));
    vth2=vth2+delt*(g*m12/m2*(c*sin(th1)-sin(th2))+(m12/m2*len1*pow(vth1,2)+len2*pow(vth2,2)*c)*s)/(len2*(m12/m2-pow(c,2)));
    
    th1=th1+delt*vth1;
    th2=th2+delt*vth2;
    
    x1=len1*sin(th1);
    y1=len1*cos(th1);
    x2=len1*sin(th1)+len2*sin(th2);
    y2=len1*cos(th1)+len2*cos(th2);
  }
  
  void drawMe(){
    line(width/2,height/2,width/2+x1,height/2+y1);
    line(width/2+x1,height/2+y1,width/2+x2,height/2+y2);
    circle(width/2+x1,height/2+y1,5);
    circle(width/2+x2,height/2+y2,5);
  }
}
