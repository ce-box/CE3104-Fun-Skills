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

/* ------------------------------------------------------
 *                PROCESSING MAIN FUNCTIONS
 * -----------------------------------------------------*/
gameFlags gf;
  
void setup(){
  size(800,600);
  gf = new gameFlags();
}


void draw(){
  
  gf.draw();

}


void mousePressed(){
  gf.mousePressed();
}
