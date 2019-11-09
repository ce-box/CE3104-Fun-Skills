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
  
void setup(){
  size(800,600);
  gf = new gameFlags();
  gf.toString();
}


void draw(){
  if(!gf.done)
    gf.draw();
  else
    foo();
}


void mousePressed(){
  gf.mousePressed();
  
}

void foo(){
  background(0);
  text("menu",100,100);
}
