import java.util.ArrayList; 

public class Spiderweb<T>{  
  ArrayList web_Vertexs = new ArrayList();
  ArrayList<String> game_Dic = new ArrayList(Arrays.asList("Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba"));
  ArrayList<Integer> game_Score = new ArrayList(Arrays.asList(1,2,3,4,5,6,7,8));
  
  public Spiderweb(int lines,int columns, ArrayList<String> game_Dic, ArrayList<Integer> game_Score){
    this.game_Dic=game_Dic;
    this.game_Score=game_Score;
    web(lines,columns);
  
  }
 
  
  void columns(int n){
    int i=0;
    ArrayList<String> tmp =new ArrayList<String>();
    ArrayList<ArrayList> line =new ArrayList(1);
    noFill();
    int seg_Column = 125/n;
    float angle = TWO_PI / n;
    while(seg_Column<255 && n!=0) {
      noFill();
      beginShape();
      for (float a = 0; a < TWO_PI; a += angle) {//Crea circulos cada  vez mas grandes
        float sx =  cos(a) * seg_Column;
        float sy =  sin(a) * seg_Column;
        vertex(sx, sy); 
        tmp.add(""+sx);
        tmp.add(""+sy); 
        tmp.add(game_Dic.get(i).toString()); 
        tmp.add(game_Score.get(i).toString());
        line.add(tmp);
        i++;
      }
      seg_Column+=(125/n)*(n/2);
      n--;
      i++;
      web_Vertexs.add(line);
      smooth();
     endShape(CLOSE);
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
