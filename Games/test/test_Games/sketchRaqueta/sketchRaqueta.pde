java.util.Random random = new java.util.Random();

Balloon playable, handle;



int dow=10;
int cont=0;
int score=0;
int attemps=0;
float gravity = 0.0001;
float mass = 2.0;

void setup() {
  size(1000,800);
  // Inputs: x, y, mass, gravity
  playable = new Balloon(100, 600);  
  handle = new Balloon(100, 600);
  handle.radius=5;
  handle.mass=10;
}


void draw() {
  gameScreen();
}

void gameScreen(){
  if (true/**cont<dow**/){
    background(255);
    handle.update(handle.x,handle.y);
    handle.display(handle.x,handle.y);
    playable.update(handle.x, handle.y-100);
    playable.display(handle.x, handle.y);
    playable.keepInScreen();
    handle.keepInScreen();
    printScore();
  }else{
    gameOverScreen();
  }
}
    
void gameOverScreen() {
  background(44, 62, 80);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(12);
  text("Your Score", width/2, height/2 - 120);
  textSize(130);
  text(score, width/2, height/2);
  textSize(15);
  text("Click to Restart", width/2, height-30);
}

void mouseClicked(){
  if (playable.x-playable.radius-20<mouseX && playable.x+playable.radius+20>mouseX && playable.y-playable.radius-20<mouseY && playable.y+playable.radius+20>mouseY){
    playable.update(playable.x+400,playable.y+600);
    playable.gravity=-11;
    handle.gravity=-6;
    playable.update(handle.x, handle.y-170);
    playable.display(handle.x, handle.y);      
      score++;}
  else if (playable.x-playable.radius-100<mouseX && playable.x+playable.radius+100>mouseX && playable.y-playable.radius-100<mouseY && playable.y+playable.radius+100>mouseY){
    attemps++;
  } 
}

void printScore() {
  fill(0);
  textAlign(CENTER);
  textSize(30); 
  text("Score: "+Integer.toString(score), 800, 50);
  text("Intentos: "+Integer.toString(attemps), 780,85);
}

void mouseDragged(){
  handle.x=mouseX;
  handle.y=mouseY;
}
