int sample=300;
int x,y,v;
int[][] nest;

void vect(){
  switch(v){
    case 0:
      y--;
      break;
    case 1:
      x++;
      break;
    case 2:
      y++;
      break;
    case 3:
      x--;
      break;
  }
}

void setup(){
  size(300,300);
  background(255);
  
  x=y=150;
  v=0;
  nest=new int[sample][sample];
}

void draw(){
  
  background(255); //<>//
  
  if(nest[x][y]==0){
    v=(v+1)%4;
    nest[x][y]=1;
    vect();
  }else{
    v=(v+3)%4;
    nest[x][y]=0;
    vect();
  }
  
  for(int i=0;i<sample;i++){
    for(int j=0;j<sample;j++){
      if(nest[i][j]==1){
        point(i,j);
      }
    }
  }
}
