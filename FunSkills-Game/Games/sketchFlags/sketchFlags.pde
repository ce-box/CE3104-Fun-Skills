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
HashMap<Integer,String> color_dict = new HashMap<Integer,String>();
ArrayList<Integer> color_seq = new ArrayList<Integer>();
ArrayList<Flag> flagList = new ArrayList<Flag>();

// According to its status is the screen that runs
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen
int game_Screen = 0;

int color_amt = 2;

// Flags Positions constants


void setup() {
  size(764,500);
  
  // First the dictionary is initialized, 
  // then the flags are instantiated.
  init_dict();
  initList();

  for(int i = 0; i < 5; i++){
    generate_random_sequence();
    decode_sequence();
  }
    
}


void draw(){
    // Game Screen Selector
  if(game_Screen == 0){
    init_Screen();
  } else if(game_Screen == 1){
    game_Screen();
  } else if(game_Screen == 2){
    //game_Over_Screen();
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
  drawFlags();
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

  for(Flag flag: flagList){
    if(flag.flagOver){
      println("You pressed flag color: "+ flag.getColor());
    }
  }
}

/** 
 * @brief - Sets the necessary variables to start the game
 */ 
void start_Game(){
  game_Screen = 1;
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
void init_dict(){
  color_dict.put(0,"red");
  color_dict.put(4,"orange");
  color_dict.put(3,"yellow");
  color_dict.put(1,"green");
  color_dict.put(2,"blue");
}

/** 
 * @brief Create the flags that will be used during the game
 */
void initList(){
  Flag flag;
  int posX = 0;
  for(int x = 0; x < 5; x++){
    String flagColor = color_dict.get(x);
    flag = new Flag(posX,height/2 - 50,flagColor);
    flagList.add(flag);
    posX += 155;
  }
}

/**
 * @brief -Function that randomly generates an 
 *         incremental color pattern
 */
void generate_random_sequence(){

  for(int cnt = 0; cnt<color_amt;cnt++){
    int r_num = int(random(0, 4));; // Btw 0-4
    color_seq.add(r_num);
  }
}

/**
 * @brief -This function decodes the random number 
 *         pattern list generated
 */
void decode_sequence(){
  for(int x:color_seq){
    println("color: ",color_dict.get(x));
  }
  println("---");
}
