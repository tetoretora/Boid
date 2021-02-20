class Triangle{
  int x1,y1,x2,y2,x3,y3;
  int level;
  float rnoise,gnoise,bnoise;
  
  Triangle[] tri=new Triangle[0];
  
  Triangle(int lev,int argx1,int argy1,int argx2,int argy2,int argx3,int argy3,float r,float g,float b){
    x1=argx1;
    x2=argx2;
    x3=argx3;
    y1=argy1;
    y2=argy2;
    y3=argy3;
    
    level=lev;
    
    rnoise=noise(r)*255;
    gnoise=noise(g)*255;
    bnoise=noise(b)*255;
    
    if(level<=_maxLevels){
      tri=new Triangle[3];
      
      float s=random(1);
      float t=random(1-s);
      float u=1-s-t;
      
      int dtx=(int)(x1*s+x2*t+x3*u);
      int dty=(int)(y1*s+y2*t+y3*u);
      
      tri[0]=new Triangle(level+1,dtx,dty,x2,y2,x3,y3,rnoise,gnoise,bnoise);
      tri[1]=new Triangle(level+1,x1,y1,dtx,dty,x3,y3,rnoise,gnoise,bnoise);
      tri[2]=new Triangle(level+1,x1,y1,x2,y2,dtx,dty,rnoise,gnoise,bnoise);
    }
  }
  
  void drawMe(){
    if(level==_maxLevels){
      color c=color(random(255),random(255),random(255),200);
      fill(c);
      triangle(x1,y1,x2,y2,x3,y3);
    }
    for(int i=0;i<tri.length;i++){
      tri[i].drawMe();
    }
  }
}
