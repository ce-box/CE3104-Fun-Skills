Object[][] game_Dic={{"Sahid",1},{"edgardo",2},{"esteban",3},{"jessica",4},{"maria",5},{"jose",6},{"erick",7},{"mauro",8},{"andres",9},
{"Sahid",1},{"edgardo",2},{"esteban",3},{"jessica",4},{"maria",5},{"jose",6},{"erick",7},{"mauro",8},{"andres",9},
{"Sahid",1},{"edgardo",2},{"esteban",3},{"jessica",4},{"maria",5},{"jose",6},{"erick",7}};
int player_X=750;
int player_Y=275;
ArrayList<String> words_Found = new ArrayList<String>();
int[][] vertexs_Array;
Object[][] word_Web = new Object[5][5];



void setup() {
  size(1000,800); 
  background(255);
  stroke(0);
  strokeWeight(2);
  fill(255);
}

void draw() {
  fill(255);
  draw_Mat();
  draw_Player();
  pushMatrix(); 
  web(5,5);  
  smooth();
  popMatrix();
  found_Words();
  for_Asign_Word(5,5);
  word_Player_Collision(player_X,player_Y);
}

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
  fill(#b5cd38);
  noStroke();
  ellipse(player_X,player_Y,15,15);
  stroke(0);
}

void columns(int n){   
   noFill();
  int seg_Column = 125/n;
  float angle = TWO_PI / n;
  translate(0,0);
  while(seg_Column<255 && n!=0) {
    noFill();
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx =  cos(a) * seg_Column;
      float sy =  sin(a) * seg_Column;
      vertex(sx, sy);
    }   
    seg_Column+=125/n;
    n--;
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
}


void keyPressed(){
  switch(keyCode){
    case(UP):
    println("UP");
    player_Y-=20;
    case(DOWN):
    player_Y+=20;
    case(RIGHT):
    player_X+=20;
    case(LEFT):
    player_X-=20;
  }
}

void for_Asign_Word(int lines, int columns){
  int index=0;
  for (int i=0; i<lines; i++){
    for (int j=0; j<columns;j++){ 
      word_Web[i][j]=game_Dic[index];
      index++;
      println(index);
      println(word_Web[i][j]);
    }
  }  
}


void word_Player_Collision(int x, int y){  
  for (int i=0; i<vertexs_Array.length;i++){
    if(x==vertexs_Array[i][0] && y==vertexs_Array[i][1]){
      words_Found.add(word_Web[i].toString());
    }
  }
}

void draw_Mat(){
  line(750,150,750,400);
  line(625,275,875,275);
}
