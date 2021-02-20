int n=10;
int len=10;

class Walk{
  int[] x,y;
  
  Walk(){
    x=new int[n];
    y=new int[n];
    x[0]=(int)random(-width,width);
    y[0]=(int)random(-height,height);
    
    for(int i=0;i<n-1;i++){
      x[i+1]=x[i];
      y[i+1]=y[i];
    }
  }
  
  int random1(){
    float x=random(1);
    if(x<0.5) return -1;
    else return 1;
  }
  
  void updateMe(){
    for(int i=n-2;i>=0;i--){
      x[i+1]=x[i];
      y[i+1]=y[i];
    }
    
    x[0]=x[1]+random1()*len;
    y[0]=y[1]+random1()*len;
  }
  
  void drawMe(){
    for(int i=0;i<n-1;i++){
      line(x[i],y[i],x[i+1],y[i+1]);
    }
  }
}
