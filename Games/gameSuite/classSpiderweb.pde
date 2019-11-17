import java.util.*; 

public class Spiderweb<T>{  
  public int lines,columns;
  public ArrayList data = new ArrayList();
  ArrayList<String> game_Dic = new ArrayList(Arrays.asList("Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba"));
  ArrayList<Integer> game_Score = new ArrayList(Arrays.asList(1,2,3,4,5,6,7,8));
  
  public Spiderweb(int lines,int columns, ArrayList<String> game_Dic, ArrayList<Integer> game_Score){
    this.lines=lines;
    this.columns=columns;
    this.game_Dic=game_Dic;
    this.game_Score=game_Score;
    web(lines,columns);  
  }
 
  
  void columns(int n){
    int i=0;
    noFill();
    int seg_Column = 125/n;
    float angle = TWO_PI / n;
    while(seg_Column<255 && n!=0) {
      ArrayList circle = new ArrayList();
      noFill();
      beginShape();
      for (float a = 0; a < TWO_PI; a += angle) {//Crea circulos cada  vez mas grandes
        float sx =  cos(a) * seg_Column;
        float sy =  sin(a) * seg_Column;
        vertex(sx, sy); 
        ArrayList tmp = new ArrayList(Arrays.asList(sx,sy,game_Dic.get(i).toString(),game_Score.get(i)));
        circle.add(tmp);
        i++;
      if(i>= game_Dic.size()) break;
          } 
      smooth();
      endShape(CLOSE);
      data.add(circle);
      seg_Column+=(125/n)*(n/2);
      n--;
      i++;
      
     
   }
} 



  void web(int npoints, int n_Columns) {
    translate(250,250);
    int x=0; int y=0; int radius=250;
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle);
      sy = y + sin(a+halfAngle);
      vertex(sx, sy);
    }
    endShape(CLOSE);    
    columns(n_Columns);
    smooth();
    translate(0,0);
  }




}
