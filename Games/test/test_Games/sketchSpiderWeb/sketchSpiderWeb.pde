import java.util.*; 

ArrayList<String> game_Dic = new ArrayList(Arrays.asList("Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba"));
ArrayList<Integer> game_Score = new ArrayList(Arrays.asList(1,2,3,4,5,6,7,8));
int player_Column=1;
int player_Line=2;
int score = 0;
float player_X;
float player_Y;
ArrayList words_Found;
ArrayList web_Vertexs;

void setup() {
  size(1000,800); 
  background(255);
  stroke(0);
  strokeWeight(2);
  fill(255);  
  web_Vertexs = new ArrayList();
  words_Found = new ArrayList<String>();
}

void draw() {  
  words_Found.add("Sandia");
  pushMatrix(); 
  web(2,2, game_Dic,game_Score);  
  smooth();
  popMatrix();
  found_Words();
  //for_Asign_Word();
  //word_Player_Collision();   
  draw_Player();
  draw_Mat();
  printScore();
}

void printScore() {
  translate(0,0);
  textAlign(CENTER);
  fill(0);
  textSize(30); 
  text("Score: "+score, 600, -150);
}

void for_Asign_Word(){
  int index=0;
  for (int i=0; i<web_Vertexs.size(); i++){    
  ArrayList new_Line = (ArrayList) web_Vertexs.get(i);
    for (int j=0; j<new_Line.size();j++){ 
      new_Line.set(j,game_Dic.get(index));
      index++;
    }
  }  
}

/**
void word_Player_Collision(){  
  ArrayList new_Line = (ArrayList<ArrayList>) web_Vertexs.get(player_Column);
  for (int i=0; i<new_Line.size();i++){    
    if(player_X == new_Line.get(i).get() && player_Y == new_Line.get(i).getY()){     
      //words_Found.append(new_Line.getNode(i).getData());
    }
  }
}**/

void found_Words(){
  stroke(0);
  rect(0, 500, 400, 300, 7);
  int x=70; int y=540;
  for (int i=0;i<words_Found.size()-1;i++){
    if (x>330){
      y+=40;
      x=60;}
    strokeWeight(1);
    textSize(16);
    text(words_Found.get(i).toString(),x,y);      
    x+=(words_Found.get(i).toString().length()*15)+10;
  }
}

void draw_Player(){
  translate(250,250);
  fill(#b5cd38);
  noStroke();
  ellipse(player_X,player_Y,15,15);
  stroke(0);
  translate(0,0);
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


void keyPressed(){ 
  translate(250,250);
  switch(keyCode){
    case(UP):   
  ArrayList line = (ArrayList)  web_Vertexs.get(player_Column);
  player_X=(line.getNode(player_Line+1).getX());
  player_Y=(line.getNode(player_Line+1).getY());
  player_Line++;
    case(DOWN):    
  LinkedList line2 =(LinkedList)  web_Vertexs.getNode(player_Column).getData();    
  player_X=(line2.getNode(player_Line-1).getX());
  player_Y=(line2.getNode(player_Line-1).getY());
  draw_Player();
  player_Line--;
    case(RIGHT):
  LinkedList new_Line =(LinkedList)  web_Vertexs.getNode(player_Column+1).getData();
  player_X=(new_Line.getNode(player_Line).getX());
  player_Y=(new_Line.getNode(player_Line).getY());
  player_Column++;
    case(LEFT):
  LinkedList new_Line2 =(LinkedList)  web_Vertexs.getNode(player_Column-1).getData();
  player_X=(new_Line2.getNode(player_Line).getX());
  player_Y=(new_Line2.getNode(player_Line).getY());
  player_Column--;
  }  
  translate(0,0);
}



void draw_Mat(){
  fill(#b5cd38);
  arc(470, 60, 250, 250, PI-3*QUARTER_PI, PI-QUARTER_PI,PIE);
  arc(470, 40, 250, 250, PI+QUARTER_PI, PI+3*QUARTER_PI,PIE);
  arc(480, 50, 250, 250, PI+3*QUARTER_PI, TWO_PI+QUARTER_PI,PIE);  
  arc(460, 50, 250, 250, PI-QUARTER_PI, PI+QUARTER_PI,PIE);
}
