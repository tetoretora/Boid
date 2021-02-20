import java.util.Random;
import java.util.Arrays;

class Rule{
  
  int[][] status = new int[256][8];
  int[] rule = new int[256];
  
  Rule(){
    
    Random r = new Random();
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
  
}
