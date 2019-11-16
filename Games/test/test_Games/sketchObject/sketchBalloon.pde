/* ------------------------------------------------------------
 * File: sketchFlags.pde
 * Developed by: María José Zamora Vargas
 * Project: FunSkills - [Game]
 * version: 2.0
 * last edited: María José Zamora Vargas 1::59
 * 
 * Description: Flags Game Basic GUI
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

import processing.video.*;
int gameScreen = 0;

Capture cam;
float airfriction = -0.001;
float friction = 10; 
int distances[]={200,50,100,70,10};
float time_Interval;
float last_Time_Check;

// scoring
int score = 0;

// ball settings
float ballX, ballY; //ALTURA DEL SUELO,distancia desde la derecha
float ballSpeedVert = 0;
int seconds; //Tiempo en que mantiene la pos
float ballSpeedHorizon = 0;
float ballSize = 100;
color ballColor = color(244,67,52);


/********* SETUP BLOCK *********/

void _setup() {
  size(1000,800);
  //set the initial coordinates of the ball
  ballX=width/4;
  ballY=height/5;
  time_Interval = 2000; // 2 SEC
  last_Time_Check = millis();
  cam = new Capture(this, 640, 480);
  cam.start();
  smooth();
}


/********* DRAW BLOCK *********/

void _draw() {
  // Display the contents of the current screen
  if (gameScreen == 0) { 
    initScreen();
  } else if (gameScreen == 1) { 
    gameScreen();
  } else if (gameScreen == 2) { 
    gameOverScreen();
  }
}


/********* SCREEN CONTENTS *********/

void initScreen() {
  background(236, 240, 241);
  textAlign(CENTER);
  fill(52, 73, 94);
  textSize(70);
  text("Balloon. Game 1", width/2, height/2);
  textSize(15); 
  text("Click to start", width/2, height-30);
}
void gameScreen() {
  background(236, 240, 241);
  drawBall();
  movement_Balloon(distances);
  applyHorizontalSpeed();
  keepInScreen();
  printScore();  
  smooth();
}
void gameOverScreen() {
  background(44, 62, 80);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(12);
  if(score!=0){
    text("¡Congratulations!", width/2, height/2 - 120);
  }else{
    text("¡Come on, you got this!", width/2, height/2 - 120);
  }
  textSize(130);
  text(score, width/2, height/2);
  textSize(15);
  text("Click to Restart", width/2, height-30);
}

void startGame() {
  gameScreen=1;
}
void game_Over() {
  gameScreen=2;
  gameOverScreen();
  ballX=width/4;
  ballY=height/5;
}

void _mousePressed(){
  if (gameScreen==0){
  startGame();
  }
  if(gameScreen==2){
    gameScreen=1;
    score=0;
    startGame();
  }
  if(ballX<mouseX && mouseX<ballX+ballSize && ballY<mouseY && mouseY<ballY+ballSize){
    score++;
    gameScreen=2;
    gameOverScreen();
  }
}

void movement_Balloon(int[] pos){ //cambia X
  if(millis()>last_Time_Check + time_Interval){
    last_Time_Check = millis();
    ballX+=20;
    drawBall();
    }
  }


void drawBall() {  
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
}


void score() {
  score++;
}
void printScore() {
  textAlign(CENTER);
  fill(0);
  textSize(30); 
  text(score, height/2, 50);
}

void applyHorizontalSpeed() {
  ballX += ballSpeedHorizon;
  ballSpeedHorizon -= (ballSpeedHorizon * airfriction);
}
// ball falls and hits the floor (or other surface) 
void makeBounceBottom(float surface) {
  ballY = surface-(ballSize/2);
  ballSpeedVert*=-1;
  ballSpeedVert -= (ballSpeedVert * friction);
}
// ball rises and hits the ceiling (or other surface)
void makeBounceTop(float surface) {
  ballY = surface+(ballSize/2);
  ballSpeedVert*=-1;
  ballSpeedVert -= (ballSpeedVert * friction);
}
// ball hits object from left side
void makeBounceLeft(float surface) {
  ballX = surface+(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}
// ball hits object from right side
void makeBounceRight(float surface) {
  ballX = surface-(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}
// keep ball in the screen
void keepInScreen() {
  // ball hits floor
  if (ballY+(ballSize/2) > height) { 
    makeBounceBottom(height);
  }
  // ball hits ceiling
  if (ballY-(ballSize/2) < 0) {
    makeBounceTop(0);
  }
  // ball hits left of the screen
  if (ballX-(ballSize/2) < 0) {
    makeBounceLeft(0);
  }
  // ball hits right of the screen
  if (ballX+(ballSize/2) > width) {
    game_Over();
    makeBounceRight(width);
  }
}
