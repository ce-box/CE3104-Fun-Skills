/* ------------------------------------------------------------
 * File: sketchFlags.pde
 * Developed by: María José Zamora Vargas
 * Project: FunSkills - [Game]
 * version: 2.0
 * last edited: Esteban Alvarado:: 11.30
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

int color_amt = 2;

// Quantization of attempts
int attempts = 0;
int successes = 0;


// 
PFont fontArialBold;



void guiSetup(){

  fontArialBold = createFont("Arial Bold", 16);
}

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
    //game_Over_Screen();
  }

}

/* ------------------------------------------------------
 *                    SCREEN CONTENTS
 * -----------------------------------------------------*/


void initScreen(){
  background(0);
  textAlign(CENTER);
  text("Click to Start", height/2, width/2);
}


void gameScreen(){
  background(255);

  textFont(fontArialBold);
  fill(0);
  text("Success:"+successes,50,20);
  text("Attemps:"+attempts,200,20);
  drawFlags();
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

  /* Check if the cursor is on a flag, then verify that the flag 
   * is the one you are looking for */
  for(Flag flag: flagList){
    if(flag.flagOver){ 
      if(checkFlag(flag)){
        println("Correct!");
        colorSeq.remove(0);
        successes++;
      } 
      else{
        println("Bad Answer!");
        attempts++;
      }
    }
  }
}

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
 * @brief - Sets the necessary variables to start the game
 */ 
void startGame(){
  gameScreen = 1;
}


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
 *           OTHER FUNCTIONS
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
