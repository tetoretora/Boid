int _centerx=400,_centery=400;
int _radius=300;
int _max=500;

void setup(){
  background(255);
  size(800,800);
  
  for(int i=0;i<_max;i++){
    for(int j=0;j<_max;j++){
      point(_centerx+_radius*cos(2.0*PI*i/_max),_centery+_radius*sin(2.0*PI*i/_max)*sin(2.0*PI*j/_max));
    }
  }
}
