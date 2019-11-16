/* ------------------------------------------------------------
 * File: gameSuite.pde
 * Developed by: Esteban Alvarado Vargas
 * Project: FunSkills - [Game]
 * version: 1.0
 * last edited: Esteban Alvarado:: 09/11/2019 | 00.10
 *
 * Description: Main Game Window.
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

 gameFlags gf;
 gameObject gO;
 gameSpidey gS;
  
void setup(){
  size(1250,1040);
  gf = new gameFlags();
  gf.toString();

  gO = new gameObject();
  gO.toString();
  
  gS = new gameSpidey();
}


void draw(){
  //if(!gf.done)
    //gf.draw();
    //gO.draw();
 
}


void mousePressed(){
  gf.mousePressed();
  gO.mousePressed();
}

void keyPressed(){
  gS.keyPressed();
}

void foo(){
  background(0);
  text("menu",100,100);
}
