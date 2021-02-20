int maxsize=600;
int max=100;
int scale=50;
float updatescale=1.5;
int[] x,y;
int[] vx,vy;
int[] nearx,neary;

float theta(int x1,int y1,int x2,int y2){
  if(x2-x1==0){
    if(y2-y1>=0){
      return PI/2;
    }else{
      return -PI/2;
    }
  }
  return atan2(y2-y1,x2-x1);
}
int vector(float t){
  if(t>=-PI/4&&t<PI/4){
    return 0;
  }else if(t>=PI/4&&t<3*PI/4){
    return 1;
  }else if(t>=3*PI/4&&t<5*PI/4){
    return 2;
  }else{
    return 3;
  }
}
void setup(){
  size(600,600);
  background(255);
  x=new int[max];
  y=new int[max];
  vx=new int[max];
  vy=new int[max];
  nearx=new int[max];
  neary=new int[max];
  for(int i=0;i<max;i++){
    x[i]=(int)random(0,maxsize);
    y[i]=(int)random(0,maxsize);
  }
  for(int i=0;i<max-1;i++){
    nearx[i]=x[i+1];
    neary[i]=y[i+1];
  }
  nearx[max-1]=x[0];
  neary[max-1]=y[0];
}
void draw(){
  
  int sx=0,sy=0;
  for(int i=0;i<max;i++){
    sx+=x[i];
    sy+=y[i];
  }
  
  int avex,avey;
  avex=sx/max;
  avey=sy/max;
  
  sx=sy=0;
  for(int i=0;i<max;i++){
    sx+=vx[i];
    sy+=vy[i];
  }
  
  int avevx,avevy;
  avevx=sx/max;
  avevy=sy/max;
  
  float s=0;
  for(int i=0;i<max;i++){
    for(int j=0;j<max;j++){
      if(i==j){
        j++;
        if(j>=max){
          break;
        }
      }
      s=dist(x[i],y[i],x[j],y[j]);
      if(s<dist(x[i],y[i],nearx[i],neary[i])){
        nearx[i]=x[j];
        neary[i]=y[j];
      }
    }
  }
  
  for(int i=0;i<max;i++){
    vx[i]+=(avex+avevx-nearx[i])/scale;
    vy[i]+=(avey+avevy-neary[i])/scale;
    vx[i]/=updatescale;
    vy[i]/=updatescale;
    /*
    float t=theta(x[i],y[i],avex,avey);
    switch(vector(t)){
      case 0:
        vx[i]=1;
        vy[i]=0;
        break;
      case 1:
        vx[i]=0;
        vy[i]=1;
        break;
      case 2:
        vx[i]=-1;
        vy[i]=0;
        break;
      case 3:
        vx[i]=0;
        vy[i]=-1;
        break;
    }
    */
  }
  
  for(int i=0;i<max;i++){
    if(vx[i]==0&&vy[i]==0){
      vx[i]=(int)random(-10,10);
      vy[i]=(int)random(-10,10);
    }
  }
  
  for(int i=0;i<max;i++){
    x[i]+=vx[i];
    y[i]+=vy[i];
  }
  
  
  
  background(255);
  for(int i=0;i<max;i++){
    circle(x[i],y[i],10);
  }
  
}
