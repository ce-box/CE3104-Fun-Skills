Object[][] game_Dic={{"Sahid",1},{"edgardo",2},{"esteban",3},{"jessica",4},{"maria",5},{"jose",6},{"erick",7},{"mauro",8},{"andres",9},
{"Sahid",1},{"edgardo",2},{"esteban",3},{"jessica",4},{"maria",5},{"jose",6},{"erick",7},{"mauro",8},{"andres",9},
{"Sahid",1},{"edgardo",2},{"esteban",3},{"jessica",4},{"maria",5},{"jose",6},{"erick",7}};
int player_Column=1;
int player_Line=2;
int score = 0;
float player_X;
float player_Y;
LinkedList words_Found;
LinkedList web_Vertexs;

void setup() {
  size(1000,800); 
  background(255);
  stroke(0);
  strokeWeight(2);
  fill(255);  
  web_Vertexs = new LinkedList();
  words_Found = new LinkedList();
}

void draw() {    
  pushMatrix(); 
  web(5,5);  
  smooth();
  popMatrix();
  found_Words();
  for_Asign_Word(5,5);
  word_Player_Collision();   
  LinkedList start_Line =(LinkedList) web_Vertexs.getNode(player_Column).getData();
  player_X=(start_Line.getNode(player_Line).getX());
  player_Y=(start_Line.getNode(player_Line).getY());
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

void for_Asign_Word(int lines, int columns){
  int index=0;
  for (int i=0; i<lines; i++){    
  LinkedList new_Line =(LinkedList) web_Vertexs.getNode(i).getData();
    for (int j=0; j<columns;j++){ 
      new_Line.getNode(j).setData(game_Dic[index][0]);
      index++;
    }
  }  
}

void word_Player_Collision(){  
  LinkedList new_Line =(LinkedList)  web_Vertexs.getNode(player_Column).getData();
  for (int i=0; i<new_Line.getSize();i++){    
    if(player_X == new_Line.getNode(i).getX() && player_Y == new_Line.getNode(i).getY()){
      println(new_Line.getNode(i).getData());      
      words_Found.append(new_Line.getNode(i).getData());
      break;
    }
  }
}

void found_Words(){
  stroke(0);
  rect(0, 500, 400, 300, 7);
  int x=70; int y=540;
  for (int i=0;i<words_Found.getSize()-1;i++){
    if (x>330){
      y+=40;
      x=60;}
    strokeWeight(1);
    textSize(16);
    text(words_Found.getNode(i).getData().toString(),x,y);      
    x+=(words_Found.getNode(i).getData().toString().length()*15)+10;
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
  LinkedList temp = new LinkedList();
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
      Node tmp = new Node(sx, sy, 0);
      temp.append(tmp);
    }
    seg_Column+=(125/n)*(n/2);
    n--;
    web_Vertexs.append(temp);
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
  LinkedList line =(LinkedList)  web_Vertexs.getNode(player_Column).getData();
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
