int _max=10;

void setup(){
  background(255);
  size(512,512);
  
  for(int i=0;i<256;i++){
    for(int j=0;j<256;j++){
      color c=color(i,i,i);
      stroke(c);
      point(i,j);
    }
  }
  for(int i=0;i<256;i++){
    for(int j=0;j<256;j++){
      color c=color(i,j,0);
      stroke(c);
      point(i+256,j);
    }
  }
  for(int i=0;i<256;i++){
    for(int j=0;j<256;j++){
      color c=color(i,0,j);
      stroke(c);
      point(i,j+256);
    }
  }
  for(int i=0;i<256;i++){
    for(int j=0;j<256;j++){
      color c=color(0,i,j);
      stroke(c);
      point(i+256,j+256);
    }
  }
  
  save("colormap.jpg");
}

void mousePressed(){
  save("colormap.jpg");
}
