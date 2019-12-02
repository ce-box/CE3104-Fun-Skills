/* ------------------------------------------------------------
* File: gameSuite.pde
* Developed by: Esteban Alvarado Vargas, Sahid Rojass
* Project: FunSkills - [Game]
* version: 1.0
* last edited: Esteban Alvarado:: 09/11/2019 | 00.10
*
* Description: Main Game Window.
* 
* TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
* ------------------------------------------------------------
*/


import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import java.io.*;


// Game instances
gameFlags gf;
gameObject gO;
gameSpidey gS;
gameBalloon gB;

// Main menu <cookie monster>
ArrayList<Eye> eyes = new ArrayList<Eye>();
int numEyes = 2;

static boolean inicio=true;
boolean calibracion=false,dis=false,der=false,izq=false,downR=false,downI=false,pies=false,juegoObjetivo=false,ballon=false,flagSpidey=false;
boolean flagInicio=true;
int recordX=0;

int tempo=0;
int mode=0;

int cx=190, cy=200,opcionPiesX=1030,opcionPiesY=200,opcionTelaX=1030,opcionTelaY=850,opcionObjetivoX=250,opcionObjetivoY=850, r=50, i=0,c=0;

// GUI
PImage fondo;
PImage background;
PFont fontOpenSansBold;
color fondoColor = #e25822;

// Kinect
KinectController tracker;
Kinect kinect;
boolean kinectOn = false;


/* ---------------------------
 *    MOUSE/KEYBOARD EVENTS
 * --------------------------*/

void mousePressed(){
  gf.mousePressed();
  gO.mousePressed();
}

void mouseClicked(){

    gB.mouseClicked();
    if(gS.finishSpidey){
      gS = new gameSpidey();
      gS.toString();
      flagSpidey=false;
      flagInicio=true;      
    }
}

void mouseDragged() {
    gB.mouseDragged();
}


void keyPressed(){  
  if (keyCode == UP){
      gS.translate_Player(1);}
  else if (keyCode == DOWN){
      gS.translate_Player(3);}
  else if (keyCode == LEFT){
      gS.translate_Player(4);}
  else if (keyCode == RIGHT){
      gS.translate_Player(2);}
}

/* ---------------------------
 *        SETUP + DRAW
 * --------------------------*/

void setup() {
  
  size(1280, 1040);

  
  kinect = new Kinect(this);
  tracker = new KinectController();
  
  fontOpenSansBold = createFont("fonts/open-sans/OpenSans-ExtraBold.ttf",16);
  
  noStroke();
  smooth();
  frameRate(30);
  fondo = loadImage("img/Game - Backgrounds/imgGameSuite.png");
  
  AddEye(510,340,220);
  AddEye(720,340,220);
  
  gO = new gameObject();
  gO.toString();

  gB = new gameBalloon();
  gB.toString();

  gS = new gameSpidey();
  gS.toString();

  gf = new gameFlags();
  gf.toString();
}


void draw() {
  
  juegoSpidey(flagSpidey);
  juegoBallon(ballon);
  juegoPies(pies);
  juegoObjetivo(juegoObjetivo);
  pantallaInicio(flagInicio);
  
}

/* ---------------------------
 *      GAME SUITE MENU
 * --------------------------*/


boolean pantallaInicio(boolean inicio){

  if(inicio){
    tracker.modeHands();
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
    } 
    catch (Exception e) {
      xEscalada=0;
      yEscalada=0;
    }
    
    
    fill(100, 10, 150, 200);
    noStroke();
    if(keyPressed && key == '+') ;
    if(keyPressed && key == '-') DelEye();
    
    for(int i=0;i<eyes.size();i++){
      Eye eye = eyes.get(i);

      if(kinectOn){
        eye.update((int)xEscalada,(int)yEscalada);
      } else {
        eye.update(mouseX,mouseY);
      }
      
      eye.display();
    }
    
    DrawStats();
    
    ellipse(200, 200, r/2, r/2);
    textSize(35);
    fill(#23374d);
    rect(45,100,300,150,14);
    
    // Aqui lo que que ponemos es los titulos de las muchas ventanas de juegos que existen
    textFont(fontOpenSansBold);
    textSize(35);
    fill(#ff215c);
    textAlign(50, 150);
    text("Balloon Game",70,150);
    ellipse(cx, cy, r/2, r/2);
    
    
    fill(#23374d);
    rect(875,100,300,150,14);
    fill(#ffb52b);
    text("Flags Game",930,150);
    ellipse(opcionPiesX, opcionPiesY, r/2, r/2);

    fill(#23374d);
    rect(875,750,300,150,14);
    fill(#40bcff);
    text("Spidey Game",910,800);
    ellipse(opcionTelaX, opcionTelaY, r/2, r/2);

    
    fill(#23374d);
    rect(45,750,400,150,14);
    fill(#2edb68);
    text("Reaching the object",70,800);
    ellipse(opcionObjetivoX, opcionObjetivoY, r/2, r/2);
    
    boolean opcion1,opcion2,opcion3,opcion4;
    //For kinect: (int)xEscalada,(int)yEscalada
    if(kinectOn){
      opcion1 = HoverTimer((int)xEscalada,(int)yEscalada, cx, cy, r);
      opcion2 = HoverTimer((int)xEscalada,(int)yEscalada, opcionPiesX, opcionPiesY, r);
      opcion3 = HoverTimer((int)xEscalada,(int)yEscalada,opcionTelaX, opcionTelaY, r);
      opcion4 = HoverTimer((int)xEscalada,(int)yEscalada,opcionObjetivoX, opcionObjetivoY, r);
    }
    else{
      opcion1 = HoverTimer(mouseX,mouseY, cx, cy, r);
      opcion2 = HoverTimer(mouseX,mouseY, opcionPiesX, opcionPiesY, r);
      opcion3 = HoverTimer(mouseX,mouseY,opcionTelaX, opcionTelaY, r);
      opcion4 = HoverTimer(mouseX,mouseY,opcionObjetivoX, opcionObjetivoY, r);
    }
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
        flagInicio=false;
        termine=false;
        
        
        fondoColor=#23374d;
        
        ballon=true;
        tracker.modeHands();

        tempo=millis();
        
      }
      else if(opcion2){
        flagInicio=false;
        termine=false;
        fondoColor=#e25822;
        pies=true;
        tracker.modeFeets();
        tempo=millis();
      }
      else if(opcion3){
        flagInicio=false;
        termine=false;
        
        fondoColor=#55ae95;
        flagSpidey=true;
        tracker.modeFeets();
        background = loadImage("img/imgSpideyGame.png");
        background(background);
        tempo=millis();
      }
      else if (opcion4){
        flagInicio=false;
        termine=false;
        fondoColor=#8186d5;
        juegoObjetivo=true;
        tracker.modeHands();
        tempo=millis();
      }
      
      opcion1=!opcion1;
      
      opcion2=!opcion2;

      opcion3=!opcion3;

      opcion4=!opcion4;

    }
    //aqui evaluamos el tiempor en el que el mouse permanece en un radio permitido 

    else {
      fill(#68BF4B);
    }
    
    ellipse(xEscalada, yEscalada, 20, 20);

    return termine;
  }
  else{
    return false;
  }
  
}


//Draw an arc that shows the loading time in the chosen option
void cargarArcoOpcion(int opX,int opY){
    pushStyle();
    stroke(-1);
    noFill();
    strokeWeight(6);
    arc(opX, opY, 50, 50, 0, radians(i*4));
    popStyle();
    i++;
}


/* ---------------------------
 *        KINECT / GAMES
 * --------------------------*/

void kinectSpidey(){
  
  if(flagSpidey){
    tracker.track();
    
    PVector v3 = tracker.getClosest();
    PVector v4 = tracker.getPos();

    float xEscalada;
    float yEscalada;
    float posX;
    float posY;
    
    try {
      xEscalada=v3.x*2;
      yEscalada=v3.y*2;
    } catch (Exception e) {
      xEscalada=0;
      yEscalada=0;
    }
    
    try {
      posX=v4.x*2;
      posY=v4.y*2;
    } catch (Exception e) {
      posX=0;
      posY=0;
    }

    int dif=recordX-(int)xEscalada;
    recordX=(int)xEscalada;
    println(dif);

    if(dif>45&&xEscalada<400&&xEscalada!=-20){
      println("RIGHT");
      gS.translate_Player(4);
    }
    else if(dif>45&&xEscalada>=400&&xEscalada<=800&&xEscalada!=-20){
      gS.translate_Player(1);
      println("MIDDLE");
  
    }
    else if(dif>45&&xEscalada<800&&xEscalada!=-20){
      gS.translate_Player(2);
      println("LEFT");

    }
  }
}



/* ---------------------------
 *      GAMES MANAGER
 * --------------------------*/

// launches and play object game
void juegoObjetivo(boolean iniciarObjetivo){
  if(iniciarObjetivo){
    flagInicio=false;
    gO.startGame();
    gO.draw();
    tracker.display(640,900,3);
  }
}

// launches and play flags game
void juegoPies(boolean iniciarPies){
  
  if(iniciarPies){
    flagInicio=false;
    gf.draw();
    if(gf.done){
      println("Terminado");
      pies = false;
      inicio = true;
      flagInicio = true;
    }
  }
}

// launches and play balloon game
void juegoBallon(boolean iniciarBallon){
  if(iniciarBallon){
    flagInicio=false;
    gB.draw();
  } 
}

// launches and play Spidey game
void juegoSpidey(boolean iniciarSpidey){
  if(iniciarSpidey){
     
    flagInicio=false;

    gS.init();
    kinectSpidey();
    tracker.display(800,200,3);
  } 
}


/* ---------------------------
 *      UTIL FUNCTIONS
 * --------------------------*/
 
boolean  HoverTimer(int x, int y, int cx, int cy, int r) {
  if ( dist(x, y, cx, cy) < r) return true;
  else return false;
}

void DrawStats(){
  fill(255,100);  
  fill(0,200);
  fill(255);
  fill(255,80);  
}

void AddEye(int x, int y,int size){
  eyes.add(new Eye(x,y,size));
}

void DelEye(){
  if(eyes.size()>0)eyes.remove(0);  
}

/* ---------------------------
 *    COOKIE MOSNTER EYES
 * --------------------------*/
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
