/* ------------------------------------------------------------
 * File: sketchRaqueta.pde
 * Developed by: María José Zamora Vargas
 * Project: FunSkills - [Game]
 * version: 2.0
 * last edited: María José Zamora Vargas 12::50
 * 
 * Description: Raqueta Game Basic GUI
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/


import processing.video.*;

int rope_Length=15;
float[] x_Rope = new float[rope_Length];
float[] y_Rope = new float[rope_Length];  
float ballSpeedVert = 0;
float gravity = -1;
float airfriction = -0.001;
float friction = 10; 
int segLength = 14;
Balloon playable;
Balloon collision_Balloon;
int gameScreen = 0;
int maxHealth = 100;
float health = 100;
float healthDecrease = 1;
int healthBarWidth = 60;
Capture cam;
/********* SETUP BLOCK *********/

void setup() {
  strokeWeight(9);
  stroke(255, 100);  
  collision_Balloon=new Balloon(0,0);
  collision_Balloon.ballSize=50;
  playable=new Balloon(200,200);
  cam = new Capture(this, 640, 480);
  cam.start();
}

public void settings() {
  size(640, 480);
}


/********* DRAW BLOCK *********/

void draw() {
  if (gameScreen == 0) {
    initScreen();
  }else{
    gameScreen();
  } 
}

void gameScreen(){
  if (cam.available()){
    cam.read();
  }
  image(cam,0,0);
  //playable.applyGravity();
  dragSegment(0,mouseX,mouseY);
    for(int i=0; i<x_Rope.length-1; i++) {
      dragSegment(i+1, x_Rope[i], y_Rope[i]); }    
}



void dragSegment(int i, float xin, float yin) {
    float dx = xin - x_Rope[i];
    float dy = yin - y_Rope[i];
    float angle = atan2(dy, dx);  
    x_Rope[i] = xin - cos(angle) * segLength;
    y_Rope[i] = yin - sin(angle) * segLength;
    segment(x_Rope[i], y_Rope[i], angle);
    playable.setPos(x_Rope[rope_Length-1], y_Rope[rope_Length-1]);    
    collision_Balloon.setPos(x_Rope[0],y_Rope[0]);
  }


  void segment(float x, float y, float a) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    line(0, 0, segLength, 0);
    popMatrix();
  }
  
  void applyRopeGravity(){
    ballSpeedVert += gravity;
    dragSegment(0,mouseX,mouseY);
    for(int i=0; i<x_Rope.length-1; i++) {
      y_Rope[i]+=ballSpeedVert;
      dragSegment(i+1, x_Rope[i], y_Rope[i]); } 
    ballSpeedVert -= (ballSpeedVert * airfriction);
  }
  
  void dow_Cycle(int cont){ //, inc, dec 
    for (int i=0; i<cont; i++){
    playable.ballX-=20;
    playable.ballY+=5;
    }
  }

/********* SCREEN CONTENTS *********/

void initScreen() {
  background(255);
  textAlign(CENTER);
  text("Click to start", height/2, width/2);
}



/**
void drawHealthBar() {
  // Make it borderless:
  noStroke();
  fill(236, 240, 241);
  rectMode(CORNER);
  rect(ballX-(healthBarWidth/2), ballY - 30, healthBarWidth, 5);
  if (health > 60) {
    fill(46, 204, 113);
  } else if (health > 30) {
    fill(230, 126, 34);
  } else {
    fill(231, 76, 60);
  }
  rectMode(CORNER);
  rect(ballX-(healthBarWidth/2), ballY - 30, healthBarWidth*(health/maxHealth), 5);
}
void decreaseHealth(){
  health -= healthDecrease;
  if (health <= 0){
    gameOverScreen();
  }
}**/

void gameOverScreen() {
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(30);
  text("Game Over", height/2, width/2 - 20);
  textSize(15);
  text("Click to Restart", height/2, width/2 + 10);
}

/********* INPUTS *********/

public void mousePressed() {
  // if we are on the initial screen when clicked, start the game
  if (gameScreen==0) {
    startGame();
  }
  playable.movement_Collision();
}



/********* OTHER FUNCTIONS *********/

// This method sets the necessary variables to start the game  
void startGame() {
  gameScreen=1;
}
