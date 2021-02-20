import java.util.Random;

class Midium{
  
  private int[][] neighborhood = {{-1,-1},{-1,0},{-1,1},{0,-1},{0,1},{1,-1},{1,0},{1,1}};
  private int[][] cell = new int[SIZE_MAX][SIZE_MAX];
  private int[][] scell = new int[SIZE_MAX][SIZE_MAX];
  private int[][] status = new int[256][8];
  private int[] rule = new int[256];
  
  Midium(){
    Random r = new Random();
    
    /*
    for (int i=0;i<SIZE_MAX;i++){
      for (int j=0;j<SIZE_MAX;j++){
        cell[i][j]=r.nextInt(2);
      }
    }
    */
    
    cell[50][50]=cell[49][51]=cell[51][49]=cell[50][52]=1;
    
    for(int i=0;i<256;i++){
      rule[i]=r.nextInt(2);
    }
    
    status = tuples();
    
  }
  
  int[][] tuples(){
    
    int[][] tuple = new int[256][8];
    
    for(int i=0;i<256;i++){
      int s=i;
      tuple[i][0]=i%2;
      for(int j=1;j<8;j++){
        s=(s-tuple[i][j-1])/2;
        tuple[i][j]=s%2;
      }
    }
    
    return tuple;
  }
  
  boolean alivep(int[] x){
    for(int i=0;i<256;i++){
      if(Arrays.equals(status[i],x)){
        return rule[i]==1;
      }
    }
    return false;
  }
  
  int[][] read(){
    return cell;
  }
  
  int alive(int x,int y){
    int sum = 0;
    for (int i=0;i<=7;i++){
        sum += cell[(x+neighborhood[i][0]+SIZE_MAX)%SIZE_MAX][(y+neighborhood[i][1]+SIZE_MAX)%SIZE_MAX];
    }
    return sum;
  }
  
  boolean oldrule(int x,boolean b){
    if(x==2){
      return b;
    }else if(x==3){
      return true;
    }else{
    return false;
    }
  }
  
  boolean rule1357(int x){
    return (x==1 || x==3 || x==5 || x==7);
  }
  
  boolean rule2468(int x){
    return (x==2 || x==4 || x==6 || x==8);
  }
  
  boolean rule378(int x,boolean b){
    if(b){
      return true;
    }else if(x==3 || x==7 || x==8){
      return true;
    }
    return false;
  }
  
  boolean rule123(int x,boolean b){
    if(x==1 || x==2 || x==3){
      return b;
    }else{
      return !b;
    }
  }
  
  boolean int2b(int x){
    return x==1;
  }
  
  void next(){
    for(int i=0;i<SIZE_MAX;i++){
      for(int j=0;j<SIZE_MAX;j++){
        if(rule1357(alive(i,j)/*,int2b(cell[i][j])*/)){
          scell[i][j]=1;
        }else{
          scell[i][j]=0;
        }
      }
    }
    
    for(int i=0;i<SIZE_MAX;i++){
      for(int j=0;j<SIZE_MAX;j++){
        cell[i][j]=scell[i][j];
      }
    }
  }
  
  void newnext(){
    for(int i=0;i<SIZE_MAX;i++){
      for(int j=0;j<SIZE_MAX;j++){
        for(int k=0;k<8;k++){
          int[] x = new int[8];
          x[k] = cell[(i+neighborhood[k][0]+SIZE_MAX)%SIZE_MAX][(j+neighborhood[k][1]+SIZE_MAX)%SIZE_MAX];
          
          if(alivep(x)){
            scell[i][j]=1;
          }else{
            scell[i][j]=0;
          }
          
        } 
      }
    }
    
    for(int i=0;i<SIZE_MAX;i++){
      for(int j=0;j<SIZE_MAX;j++){
        cell[i][j]=scell[i][j];
      }
    }
  }
  
  void disp(){
    for(int i=0;i<SIZE_MAX;i++){
      for(int j=0;j<SIZE_MAX;j++){
        if(cell[i][j]==1){
          point(i,j);
        }
      }
    }
  }
  
  void sss(){
    cell[0][0]=0;
  }
  
}
