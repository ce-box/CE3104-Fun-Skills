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
int gameScreen = 0;

void setup(){
  size(500,500);
}


void draw(){
  
  // Game Screen Selector
  if(gameScreen == 0){
    initScreen();
  } else if(gameScreen == 1){
    gameScreen();
  } else if(gameScreen == 2){
    gameOverScreen();
  }
  
}

/* ------------------------------------------------------
 *                    SCREEN CONTENTS
 * -----------------------------------------------------*/

void initScreen(){

}

void gameScreen(){

}

void gameOverScreen(){

}

/* ------------------------------------------------------
 *                     INPUT EVENTS
 * -----------------------------------------------------*/

/** 
 * @brief - For this example the entry is the mouse. This function must 
 *  be adapted to the kinect inputs
 */
public void mousePressed(){
  if(gameScreen == 0){
    startGame();
  }
}

/* ------------------------------------------------------
 *                    OTHER FUNCTIONS
 * -----------------------------------------------------*/

/** 
 * @brief :Sets the necessary variables to start the game
 */ 
void startGame(){
  gameScreen = 1;
}