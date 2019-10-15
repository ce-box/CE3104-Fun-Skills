/* ------------------------------------------------------------
 * File: sketchFlags.pde
 * Developed by: María José Zamora Vargas
 * Project: FunSkills - [Game]
 * version: 1.0
 * last edited: Esteban Alvarado:: 23.20
 * 
 * Description: Flags Game Basic GUI
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

import java.util.Map;

HashMap<Integer,String> color_dict = new HashMap<Integer,String>();
ArrayList<Integer> color_seq = new ArrayList<Integer>();

int color_amt = 2;



void setup() {
  size(800,600);
  init_dict();
  println("Map: "+color_dict);

  for(int i = 0; i < 5; i++){
    generate_random_sequence();
    decode_sequence();
  }
    
}

void draw(){
  background(255);
  draw_flags();
}



void draw_flags(){

  line(0, height/2, width, height/2);
  
  fill(#e60000);
  rect(10, height/2, 100, 170);
  
  fill(#ffa500);
  rect(170, height/2, 100, 170);
  
  fill(#ffff33);
  rect(330, height/2, 100, 170);
  
  fill(#009a00);
  rect(490, height/2, 100, 170);
  
  fill(#1a1aff);
  rect(650, height/2, 100, 170);

}


/* -----------------------------------
 *           OTHER FUNCTIONS
 * -----------------------------------*/

/**
 * @brief - Enter the colors to the dictionary
 */
void init_dict(){
  color_dict.put(0,"red");
  color_dict.put(1,"green");
  color_dict.put(2,"blue");
  color_dict.put(3,"yellow");
  color_dict.put(4,"orange");
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
