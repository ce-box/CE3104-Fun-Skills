///* ------------------------------------------------------------
// * File: gameSuite.pde
// * Developed by: Esteban Alvarado Vargas
// * Project: FunSkills - [Game]
// * version: 1.0
// * last edited: Esteban Alvarado:: 09/11/2019 | 00.10
// *
// * Description: Main Game Window.
// * 
// * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
// * ------------------------------------------------------------
//*/

//import org.openkinect.freenect.*;
//import org.openkinect.processing.*;
//import java.io.*;

//KinectController tracker;
//Kinect kinect;

// gameFlags gf;
// gameObject gO;
// gameSpidey gS;
  
//void setup(){
//  kinect = new Kinect(this);
//  tracker = new KinectController();
//  size(1250,1040);
//  gf = new gameFlags();
//  gf.toString();
//  gO = new gameObject();
//  gO.toString();
//  gf.startGame();
//  gS = new gameSpidey();
//}

//void draw(){
//  //if(!gf.done)
//    gf.draw();
//    //if(!gO.done()){
//    //  gO.draw();
    
//    //}

//}

//void mousePressed(){
//  gf.mousePressed();
//  gO.mousePressed();
//}
//void keyPressed(){
//  //gS.keyPressed();
//}

//void foo(){
//  background(0);
//  text("menu",100,100);
//}

import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import java.io.*;

KinectController tracker;
Kinect kinect;


/*
VARIABLES NECESARIAS PARA EL FUNCIONAMIENTO DEL JUEGO COMO CLASES
*/
 gameFlags gf;
 gameObject gO;
 gameSpidey gS;

 //gameSpidey gS;
 //  gf.toString();
 
ArrayList<Eye> eyes = new ArrayList<Eye>();
int numEyes = 2;
static boolean inicio=true;
boolean calibracion=false,dis=false,der=false,izq=false,downR=false,downI=false,pies=false;
color fondoColor = #e25822;
int tempo=0;
int mode=0;
int cx=200, cy=200,opcionPiesX=1000,opcionPiesY=200,opcionTelaX=1000,opcionTelaY=850,opcionObjetivoX=200,opcionObjetivoY=850, r=50, i=0,c=0;
String  instrucciones= "Apunte  con su mano \n  al punto verde\npara hacer al mounstro feliz";
PImage fondo;

void setup() {
  
  gf = new gameFlags();
  gf.toString();
  size(1280, 1040);
  gf.startGame();

  
  kinect = new Kinect(this);
  tracker = new KinectController();
  
  noStroke();
  smooth();
  frameRate(30);
    fondo = loadImage("img/monster.jpg");
  
    AddEye(510,340,220);
    AddEye(720,340,220);
  gO = new gameObject();
  gO.toString();

  
}

boolean  HoverTimer(int x, int y, int cx, int cy, int r) {
  if ( dist(x, y, cx, cy) < r) return true;
  else return false;
}

void juegoPies(boolean iniciarPies){
  
  if(iniciarPies){
    flagInicio=false;
    gf.startGame();
    gf.draw();
  }
}

boolean flagInicio=true;

void draw() {
  juegoPies(pies);

if(!flagInicio){
  flagInicio=false;

}
else{
  flagInicio=pantallaInicio(inicio);
}

 pantallaConfig(fondoColor,calibracion,mode);
 println("PIES"+pies);


}
void pantallaConfig( color fondo,boolean calibracion,int mode){
  //flagInicio=false;
  
  if (calibracion){
    if (mode==1){
      tracker.modeHands();
    }
    else if(mode==2){
      tracker.modeFeets();
    
    }
    tracker.track();
    PVector loc = tracker.getPos();
    PVector v3 = tracker.getClosest();
    loop();
    background(fondo);
    
    if(millis()/1000-tempo/1000<3){
      textSize(100);
      text("Hola",110,500);

    }
    else if(millis()/1000-tempo/1000<6){
      textSize(80);
      text("Ya casi vamos a jugar",110,500);

    }
    else if(millis()/1000-tempo/1000<9){
      textSize(80);
      text("Solo queremos Asegurarnos \n que todo esta bien \nconfigurado",100,500);

    }
    
    else if(tracker.calibracion(loc,mode)!="AHI ESTAS PERFECTO"&& !dis){
      textSize(70);
      text(tracker.calibracion(loc,mode),100,500);
      //tempo=millis();
     
      
    }
    else if(c<120){
      text("La distancia entre vos y \n el kinect esta perfecto porfa \n no te muevas  de ahi",300,100);
      c++;
      dis=true;
    
    }
    else if(c<200){
      text("Ahora vamos a probar unas \n cosas",100,500);
      c++;
      
    }
    else if(!(v3.x>320 && v3.y<520/2)&& !der&&mode!=2){
      dis=true;
      text("LEVANTA LA MANO DERECHA",100,500);
    
    }
    else if(!(0<v3.x&&v3.x<320 && v3.y<520/2)&& !izq&&mode!=2){
      
      text("LEVANTA LA MANO IZQUIERDA",100,500);
      der=true;
    }
    else if(!(0<v3.x&&v3.x>320 && v3.y>520/2)&& !downR&&mode!=1){
      izq=true;
      text("DA UN PASO CON EL PIE \n DERECHO",100,500);
    
    }
    else if(!(0<v3.x&&v3.x<320 && v3.y>520/2)&& !downI&&mode!=1){
      downR=true;
      text("DA UN PASO CON EL PIE \n IZQUIERDO",100,500);
    
    }
    else if(!(0<v3.x&&v3.x<320 && v3.y>520/2)){
      downI=true;
      izq=true;
      text("Listo ya estas listo para jugar",100,500); 
    
    }
    


    else{
      c=0;

 
    //flagInicio=true;
    pies=true;
    
    calibracion=false;

    
    }
    //c++;
    println("aqui estas ejecutando la pantalla de calibracion");
  

}
}
boolean pantallaInicio(boolean inicio){
  dis=false;
  der=false;
  izq=false;
  downR=false;
  downI=false;
  
  boolean termine = true;
  calibracion=false;

      background(32);  
  fondo.resize(1280,1040);
  
  tracker.track();
    image(fondo, 0, 0);

  PVector v3 = tracker.getClosest();

   float xEscalada;
    float yEscalada;
    try {
    xEscalada=v3.x*2;
   yEscalada=v3.y*2;
  } catch (Exception e) {
     xEscalada=0;
   yEscalada=0;
  }
  
  
  fill(100, 10, 150, 200);
  noStroke();
 // if(keyPressed && key == '+') AddEye();
  if(keyPressed && key == '-') DelEye();
  
  for(int i=0;i<eyes.size();i++){
    Eye eye = eyes.get(i);
    //eye.update(mouseX,mouseY);
    eye.update((int)xEscalada,(int)yEscalada);
    eye.display();
  }
   DrawStats();
   
   //boolean b = HoverTimer((int)xEscalada, (int)yEscalada, cx, cy, r);

  ellipse(200, 200, r/2, r/2);
  textSize(35);
  fill(#23374d);
  rect(45,100,300,150,14);
  
  // Aqui lo que que ponemos es los titulos de las muchas ventanas de juegos que existen
  fill(#f6f6f6);
  text("Raqueta Globo",50,150);
  ellipse(200, 200, r/2, r/2);
  
  
  fill(#e25822);
  rect(875,100,300,150,14);
   fill(#f6f6f6);
  text("Usando Los Pies",900,150);
  ellipse(1000, 200, r/2, r/2);

  fill(#55ae95);
  rect(875,750,300,150,14);
   fill(#f6f6f6);
  text("Telarañana",900,800);
  ellipse(1000, 850, r/2, r/2);

  
  fill(#8186d5);
  rect(45,750,400,150,14);
  fill(#f6f6f6);
  text("Alcanzando el objetivo",50,800);
  ellipse(200, 850, r/2, r/2);
  //boolean opcion1 = HoverTimer((int)xEscalada,(int)yEscalada, cx, cy, r);
  boolean opcion1 = HoverTimer(mouseX,mouseY, cx, cy, r);
  //boolean opcion2 = HoverTimer((int)xEscalada,(int)yEscalada, opcionPiesX, opcionPiesY, r);
  boolean opcion2 = HoverTimer(mouseX,mouseY, opcionPiesX, opcionPiesY, r);

  //boolean opcion3 = HoverTimer((int)xEscalada,(int)yEscalada,opcionTelaX, opcionTelaY, r);
  boolean opcion3 = HoverTimer(mouseX,mouseY,opcionTelaX, opcionTelaY, r);
  //boolean opcion4 = HoverTimer((int)xEscalada,(int)yEscalada,opcionObjetivoY, opcionObjetivoY, r);
  boolean opcion4 = HoverTimer(mouseX,mouseY,opcionObjetivoX, opcionObjetivoY, r);
    if (opcion1) {
      mode=1;
    cargarArcoOpcion(cx,cy);
  }
  else if(opcion2){
    
    cargarArcoOpcion(opcionPiesX,opcionPiesY);
    mode=2;
  }
  else if(opcion3){
    mode=2;
    cargarArcoOpcion(opcionTelaX,opcionTelaY);
  }
  else if(opcion4){
    mode=1;
    println("OPCION 4");
    cargarArcoOpcion(opcionObjetivoX,opcionObjetivoY);
  }
 
  else {
    i=0;
  }
  
  //aqui evaluamos el tiempor en el que el mouse permanece en un radio permitido 
  if (i>90) {
    println("primer if");
    fill(#ffedbc);
    if(opcion1){
      termine=false;
      
      
      //stop();
      fondoColor=#23374d;
      //calibracion=true;
      pies=true;

      tempo=millis();
      
    }
    else if(opcion2){
      termine=false;
      fondoColor=#e25822;
      pies=true;
      //calibracion=true;
      tempo=millis();
    }
    else if(opcion3){
      termine=false;
      fondoColor=#55ae95;
      calibracion=true;
      tempo=millis();
    }
    else if (opcion4){
      termine=false;
      fondoColor=#8186d5;
      calibracion=true;
      tempo=millis();
    }
    
    opcion1=!opcion1;
    
    opcion2=!opcion2;

    opcion3=!opcion3;

    opcion4=!opcion4;

  }
    //aqui evaluamos el tiempor en el que el mouse permanece en un radio permitido 

  else {
        println("segundo if");

    fill(#68BF4B);
  }
    ellipse(xEscalada, yEscalada, 20, 20);

  return termine;
  }

//ESTE METODO LO QUE HACE ES GENERAR EL ARCO QUE SE VA AUMENTANDO EN LA OPCION ESCOGIDA
void cargarArcoOpcion(int opX,int opY){
    pushStyle();
    stroke(-1);
    noFill();
    strokeWeight(6);
    arc(opX, opY, 50, 50, 0, radians(i*4));
    popStyle();
    i++;


}
void AddEye(int x, int y,int size){
  eyes.add(new Eye(x,y,size));
}

void DelEye(){
  if(eyes.size()>0)eyes.remove(0);  
}

class Eye {
  float x, y;
  float xs = random(-2,2);
  float ys = random(-2,2);
  float size;
  float angle = 0.0;
  
  Eye(float tx, float ty, float ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(float mx, float my) {
    angle = atan2(my-y, mx-x);
  }
  
  void display() {
    //x+=xs;
    //y+=ys;
    if((x>width-(size/2)&&xs>0)||(x<0+(size/2)&&xs<0))xs*=-1; //bounce X
    if((y>height-(size/2)&&ys>0)||(y<0+(size/2)&&ys<0))ys*=-1; // bounce Y
    pushMatrix();
    translate(x, y);
    fill(0);
    ellipse(4, 4, size+1, size+1);
    fill(255,230);    
    ellipse(0, 0, size, size);
    rotate(angle);    
    fill(0);    
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}

void DrawStats(){
  fill(255,100);  
  //rect(0,0,70,20);
  fill(0,200);
 // text("Eyes: "+eyes.size(),4,15);
  fill(255);
  //text("Eyes: "+eyes.size(),3,14);
  

  fill(255,80);  
  //text("-Drumstin",width-55,height-5);
  //text("'+' to add, '-' to remove",3,height-5);  
}
