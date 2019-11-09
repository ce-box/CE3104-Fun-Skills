/* ------------------------------------------------------------
 * File: sketchFlags.pde
 * Developed by: María José Zamora - Esteban Alvarado
 * Project: FunSkills - [Game]
 * version: 2.0
 * last edited:  Esteban Alvarado:: 29/10/2019 | 10.30
 *
 * Description: Flags Game Basic GUI
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

import java.util.Map;

// Color sequences 
HashMap<Integer,String> colorDict = new HashMap<Integer,String>();
ArrayList<Integer> colorSeq = new ArrayList<Integer>();
ArrayList<Flag> flagList = new ArrayList<Flag>();

// According to its status is the screen that runs
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen
int gameScreen = 0;

int color_amt = 4;

// Quantization of attempts
int attempts = 0;
int successes = 0;
int score = 0;


// GUI Variables
PatternBox box;
PFont fontArialBold;

/* ------------------------------------------------------
 *                PROCESSING MAIN FUNCTIONS
 * -----------------------------------------------------*/

void setup() {
  size(800,600);

  guiSetup();

  // First the dictionary is initialized, 
  // then the flags are instantiated.
  initDict();
  initList();

  generateRandomSequence();
  decodeSequence();
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


void guiSetup(){

  fontArialBold = createFont("Arial Bold", 16);
  box = new PatternBox(250,100);
  
}


void initScreen(){
  background(0);
  textAlign(CENTER);
  text("Click to Start", width/2, height/2);
 
}


void gameScreen(){
  background(255);

  textFont(fontArialBold);
  fill(0);
  text("Success:"+successes,50,20);
  text("Attemps:"+attempts,200,20);
  text("Score:"+score,550,20);

  box.setPattern(colorSeq);
  box.drawBox();
  
  drawFlags();

  if(colorSeq.size() == 0){
    gameScreen = 2;
  }
}

void gameOverScreen() {
  background(44, 62, 80);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(12);
  text("Your Score", width/2, height/2 - 120);
  textSize(130);
  text(score, width/2, height/2);
  textSize(15);
  text("Click to Restart", width/2, height-30);
}

/* ------------------------------------------------------
 *                     INPUT EVENTS
 * -----------------------------------------------------*/

/** 
 * @brief - For this example the entry is the mouse. This function must 
 *  be adapted to the kinect inputs
 */
void mousePressed(){

  //  
  if(gameScreen == 0){
    startGame();
  }

  if(gameScreen == 1){
    validateFlags();
  }

  if(gameScreen == 2){
    gameScreen = 0;
    reset();
  }
}

/* ------------------------------------------------------
 *                  SCREEN CHANGERS
 * -----------------------------------------------------*/

/** 
 * @brief - Sets the necessary variables to start the game
 */ 
void startGame(){
  gameScreen = 1;
}


/** 
 * @brief - Return all values ​​to their initial conditions
 */
void reset(){

  generateRandomSequence();
  decodeSequence();

  score = 0;
  attempts = 0;
  successes = 0;
}

/* ------------------------------------------------------
 *                     VALIDATIONS
 * -----------------------------------------------------*/

/** 
 * @brief - checks if the color of the flag matches the 
 *          first of the sequence
 */ 
boolean checkFlag(Flag flag){
  String currentColor = colorDict.get(colorSeq.get(0));
  String selectedColor = flag.getColor();
  return currentColor == selectedColor;
}


/**
 * @brief - Check if the cursor is on a flag, then verify that 
 *          the flag is the one you are looking for 
 */
void validateFlags(){
  
  for(Flag flag: flagList){
    
    if(flag.flagOver){ 
      if(checkFlag(flag)){
        println("Correct!");
        colorSeq.remove(0);
        successes++;
        score += 10;
      } 
      else{
        println("Bad Answer!");
        attempts++;
      }
    }
  }
}

/* ------------------------------------------------------
 *                    DRAWING FUNCTIONS
 * -----------------------------------------------------*/

/**
 * @brief - Maintains a loop that is drawing and 
 *          updating the flags
 */
void drawFlags(){

  for(Flag flag : flagList){
    flag.update(mouseX,mouseY);
    flag.drawFlag();
  }
}


/* -----------------------------------
 *           UTIL FUNCTIONS
 * -----------------------------------*/

/**
 * @brief - Enter the colors to the dictionary
 */
void initDict(){
  colorDict.put(0,"red");
  colorDict.put(4,"orange");
  colorDict.put(3,"yellow");
  colorDict.put(1,"green");
  colorDict.put(2,"blue");
}

/** 
 * @brief Create the flags that will be used during the game
 */
void initList(){
  Flag flag;
  int posX = 0;
  for(int x = 0; x < 5; x++){
    String flagColor = colorDict.get(x);
    flag = new Flag(posX,height/2 - 50,flagColor);
    flagList.add(flag);
    posX += 155;
  }
}

/**
 * @brief -Function that randomly generates an 
 *         incremental color pattern
 */
void generateRandomSequence(){

  for(int cnt = 0; cnt<color_amt;cnt++){
    int r_num = int(random(0, 4)); // Btw 0-4
    colorSeq.add(r_num);
  }
}

/**
 * @brief -This function decodes the random number 
 *         pattern list generated
 */
void decodeSequence(){
  for(int x:colorSeq){
    println("color: ",colorDict.get(x));
  }
  println("---");
}
