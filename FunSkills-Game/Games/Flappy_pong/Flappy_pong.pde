/* ------------------------------------------------------------
 * File: Flappy_pong.pde
 * Developed by: Esteban Alvarado 
 * Project: FunSkills- Game
 * version: 0.1
 * last edited by: Esteban Alvarado:: 14.10.2019
 *
 * Description: This is an example source code for screen 
 * handling, 3D rendering and game logic management. 
 * This is expected to be modified to be the balloon game.
 *
 *
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

// According to its status is the screen that runs
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen
int game_Screen = 0;

// Ball Properties
int ball_X,ball_Y;
int ball_Size = 40;
int ball_Color = color(214, 36, 63);

// Gravity 
float gravity = 0.0981;
float ball_Speed_Vert = 0;
float air_Friction = 0.0001;
float friction = 0.1;

// Bat
color bat_Color = color(0);
float bat_Width = 100;
float bat_Height = 10;
int bat_Bounce_Rate = 20;

void setup(){
  size(500,500,P3D);

  ball_X = width/4;
  ball_Y = height/5;
}


void draw(){
  
  // Game Screen Selector
  if(game_Screen == 0){
    init_Screen();
  } else if(game_Screen == 1){
    game_Screen();
  } else if(game_Screen == 2){
    game_Over_Screen();
  }
  
}

/* ------------------------------------------------------
 *                    SCREEN CONTENTS
 * -----------------------------------------------------*/

void init_Screen(){
  background(0);
  textAlign(CENTER);
  text("Click to Start", height/2, width/2);
}

void game_Screen(){

  background(255);

  draw_Bat();
  draw_Ball();

  apply_Gravity();
  racket_Bounce();
  keep_In_Screen();

}

void game_Over_Screen(){

}

/* ------------------------------------------------------
 *                     INPUT EVENTS
 * -----------------------------------------------------*/

/** 
 * @brief - For this example the entry is the mouse. This function must 
 *  be adapted to the kinect inputs
 */
public void mousePressed(){
  if(game_Screen == 0){
    start_Game();
  }
}

/* ------------------------------------------------------
 *                    OTHER FUNCTIONS
 * -----------------------------------------------------*/

/**
 * @brief :Method in charge of drawing the bat in the 
 *         current positions
 */
void draw_Bat(){

  fill(bat_Color); 
  rectMode(CENTER);
  rect(mouseX,mouseY,bat_Width,bat_Height);
}


/**
 * @brief :Method in charge of drawing the balloon in the 
 *         current positions
 */
void draw_Ball(){

  fill(ball_Color); 
  noStroke();
  
  lights();
  lightSpecular(255, 255, 255);
  specular(255,255,255);
  
  ellipse(ball_X, ball_Y, ball_Size, ball_Size);
}


/**
 * @brief :Simulates the acceleration of gravity by modifying 
 *         the vertical position of the balloon.
 */ 
void apply_Gravity(){

  /* NOTE: 
   * The position is added instead of subtracted due to the 
   * reference axes of the 3D processing processing*/

  ball_Speed_Vert += gravity;
  ball_Y += ball_Speed_Vert;

  ball_Speed_Vert -= (ball_Speed_Vert*air_Friction);
}

void make_Bounce_Bottom(float surface) {
  ball_Y = int(surface-(ball_Size/2));
  ball_Speed_Vert*=-1;
  ball_Speed_Vert -= (ball_Speed_Vert*friction);
}
void make_Bounce_Top(float surface) {
  ball_Y = int(surface+(ball_Size/2));
  ball_Speed_Vert*=-1;
  ball_Speed_Vert -= (ball_Speed_Vert*friction);
}

void racket_Bounce(){
  float overhead = mouseY - pmouseY;

  if((ball_X+(ball_Size/2) > mouseX -(bat_Width/2)) && (ball_X-(ball_Size/2) < mouseX +(bat_Width/2))){
    if(dist(ball_X, ball_Y, ball_X,mouseY) <= (ball_Size/2)+abs(overhead)){
      make_Bounce_Bottom(mouseY);

      if(overhead < 0){
        ball_Y+=overhead;
        ball_Speed_Vert+=overhead;
      }
    }
  }
}

void keep_In_Screen(){
  // ball hits floor
  if (ball_Y+(ball_Size/2) > height) { 
    make_Bounce_Bottom(height);
  }
  // ball hits ceiling
  if (ball_Y-(ball_Size/2) < 0) {
    make_Bounce_Top(0);

  }
}

/** 
 * @brief :Sets the necessary variables to start the game
 */ 
void start_Game(){
  game_Screen = 1;
}