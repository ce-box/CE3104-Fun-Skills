Object[][] array_Words={{"Sahid",1},{"edgardo",2},{"esteban",3},{"jessica",4},{"maria",5},{"jose",6},{"erick",7},{"mauro",8},{"andres",9}};
int web_X=100;
int web_Y=100;
String[][][] asign_Word;



void setup() {
  size(1000,800);  
  textSize(26);
  textAlign(CENTER);
  background(255);
  stroke(0);
  strokeWeight(2);
  fill(255);
}

void draw() {
  fill(0);
  text("words found",700,100);
  fill(255);
  draw_Mat();
  pushMatrix(); 
  web(3,3);  
  smooth();
  popMatrix();
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


void mov_Square(String pos){
  if (pos=="UP"){
    System.out.println("UP");
    fill(0);
    ellipse(725,323,50,50);}/**
  else if (key==DOWN){
    mov_Square("UP");
    mov_Web("UP");}
  if (key==RIGHT){
    mov_Square("RIGHT");
    mov_Web("RIGHT");}
  else if (key==LEFT){
    mov_Square("LEFT");
    mov_Web("LEFT");}**/
}

public void keyPressed(){
  if (key==CODED){
    println(key);
    if (key==UP){
      mov_Square("UP");
      //mov_Web("UP");
    }
    else if (key==DOWN){
      mov_Square("UP");
      //mov_Web("UP");
   }
    if (key==RIGHT){
      mov_Square("RIGHT");
      //mov_Web("RIGHT");
    }
    else if (key==LEFT){
      mov_Square("LEFT");
      //mov_Web("LEFT");
    }
  }
}

void draw_Mat(){
  //rect(X;Y;W;H)  
  rect(625,325,250,100);//HORIZONTAL
  rect(700,250,100,250);
  line(625,325,825,325);
  line(625,425,825,425);
}
