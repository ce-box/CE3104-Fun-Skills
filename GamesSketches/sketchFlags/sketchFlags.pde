/****************************************
File: sketchFlags.pde
Developed by: María José Zamora Vargas
Project: FunSkills - [Game]
version: 1.0
last edited: María José:: 16.20

Description: Flags Game Basic GUI

TEC 2019 | Lenguajes, compiladores e interpretes
****************************************/

String colors[] = {"Verde","Amarillo","Azul","Rojo","Naranja"};
void setup() {
  size(800,600);
}

void draw(){
  background(255);
  flags();
}

void sequence_Colors() {
  textAlign(CENTER);
  for (int i=0;i<5;i++){
     //text(colors[int(random(colors.length)-1)], height/2, width/2);
  }
  
 
}


void flags(){
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
