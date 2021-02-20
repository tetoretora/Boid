int _num=10;
int _length=10;
Walk[] _walkArr={};

void setup(){
  size(500,300);
  background(255);
  smooth();
  frameRate(4);
  
  for(int i=0;i<_num;i++){
    Walk thisWalk=new Walk();
    _walkArr=(Walk[])append(_walkArr,thisWalk);
  }
}

void draw(){
  background(255); //<>//
  for(int i=0;i<_walkArr.length;i++){
    Walk thisWalk=_walkArr[i];
    thisWalk.updateMe();
    thisWalk.drawMe();
  }
  
  saveFrame("walk-#####.png");
}

void mouseReleased(){
  for(int i=0;i<_num;i++){
    Walk thisWalk=new Walk();
    _walkArr=(Walk[])append(_walkArr,thisWalk);
  }
}
