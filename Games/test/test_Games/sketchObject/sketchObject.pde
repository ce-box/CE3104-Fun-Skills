/* ------------------------------------------------------------
 * File: sketchObject.pde
 * Developed by: María José Zamora - Esteban Alvarado
 * Project: FunSkills - [Game]
 * version: 2.0
 * last edited:  Esteban Alvarado:: 16/11/2019 | 10.30
 *
 * Description: Flags Game Basic GUI
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

/* ------------------------------------------------------
 *                PROCESSING MAIN FUNCTIONS
 * -----------------------------------------------------*/

gameObject gO;

void setup(){
  size(1250,1040);
  gO = new gameObject();
}

void draw(){
  gO.draw();
}

void mousePressed(){
  gO.mousePressed();
}