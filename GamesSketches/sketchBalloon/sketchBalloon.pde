import processing.video.*;

float ballSpeedHorizon = 5;
int racketBounceRate = 20;
int gameScreen = 0;
float ballX, ballY;
int ballSize = 100;
int ballColor = color(0);
float gravity = 0.1;
float ballSpeedVert = 0;
float airfriction = 0.001;
float friction = 0.1;
color racketColor = color(0);
float racketWidth = 100;
float racketHeight = 10;
int maxHealth = 100;
float health = 100;
float healthDecrease = 1;
int healthBarWidth = 60;
Capture cam;
/********* SETUP BLOCK *********/

void setup() {
  ballX=width/4;
  ballY=height/5;
  cam = new Capture(this, 640, 480);
  cam.start();
}

public void settings() {
  size(500, 480);
}


/********* DRAW BLOCK *********/

void draw() {
  if (cam.available()){
    cam.read();
  }
  image(cam,0,0);
  gameScreen();
}


/********* SCREEN CONTENTS *********/

void initScreen() {
  background(0);
  textAlign(CENTER);
  text("Click to start", height/2, width/2);
}
void gameScreen() {
  drawBall();
  applyGravity();
  keepInScreen();
  drawRacket();
  watchRacketBounce();
  applyHorizontalSpeed();
  drawHealthBar();
  
}

void drawRacket(){
  fill(racketColor);
  rectMode(CENTER);
  rect(mouseX, mouseY, racketWidth, racketHeight);
}

void drawBall() {
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);
}

void applyGravity() {
  ballSpeedVert += gravity;
  ballY += ballSpeedVert;
  ballSpeedVert -= (ballSpeedVert * airfriction);
}
void makeBounceBottom(float surface) {
  ballY = surface-(ballSize/2);
  ballSpeedVert*=-1;
  ballSpeedVert -= (ballSpeedVert * friction);
}
void makeBounceTop(float surface) {
  ballY = surface+(ballSize/2);
  ballSpeedVert*=-1;
  ballSpeedVert -= (ballSpeedVert * friction);
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
  if (ballX-(ballSize/2) < 0){
    makeBounceLeft(0);
  }
  if (ballX+(ballSize/2) > width){
    makeBounceRight(width);
  }
}

void watchRacketBounce() {
  float overhead = mouseY - pmouseY;
  if ((ballX+(ballSize/2) > mouseX-(racketWidth/2)) && (ballX-(ballSize/2) < mouseX+(racketWidth/2))) {
    if (dist(ballX, ballY, ballX, mouseY)<=(ballSize/2)+abs(overhead)) {
      makeBounceBottom(mouseY);
      ballSpeedHorizon = (ballX - mouseX)/5;
      // racket moving up
      if (overhead<0) {
        ballY+=overhead;
        ballSpeedVert+=overhead;
      }
    }
  }
}

void applyHorizontalSpeed(){
  ballX += ballSpeedHorizon;
  ballSpeedHorizon -= (ballSpeedHorizon * airfriction);
}

void makeBounceLeft(float surface){
  ballX = surface+(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}

void makeBounceRight(float surface){
  ballX = surface-(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}

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
}

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
}



/********* OTHER FUNCTIONS *********/

// This method sets the necessary variables to start the game  
void startGame() {
  gameScreen=1;
}
