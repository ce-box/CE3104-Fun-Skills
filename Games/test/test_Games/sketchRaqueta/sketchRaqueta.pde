java.util.Random random = new java.util.Random();

Spring2D s1, s2;

int dow=100;
int cont=0;
int score=0;
int attemps=0;
float gravity = 0.0001;
float mass = 2.0;

void setup() {
  frameRate(20);
  size(1000,800);
  // Inputs: x, y, mass, gravity
  s1 = new Spring2D(height/2, width/2, 8, gravity);
  s2 = new Spring2D(height/2, width/2, 2, gravity);
  s1.radius=5;
}


void draw() {
  gameScreen();
}

void gameScreen(){
  if (cont<dow){
    background(255);
    s1.update(s1.x,s1.y);
    s1.display(s1.x,s1.y);
    s2.update(s1.x, s1.y-170);
    s2.display(s1.x, s1.y);
    s2.keepInScreen();
    s1.keepInScreen();
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
  if (s2.x-s2.radius-20<mouseX && s2.x+s2.radius+20>mouseX && s2.y-s2.radius-20<mouseY && s2.y+s2.radius+20>mouseY){ 
    s2.update(s2.x+400,s2.y+600);
    s2.gravity=-11;
    s1.gravity=-4;
    s2.update(s1.x, s1.y-170);
    s2.display(s1.x, s1.y);      
      score++;}
  else if (s2.x-s2.radius-100<mouseX && s2.x+s2.radius+100>mouseX && s2.y-s2.radius-100<mouseY && s2.y+s2.radius+100>mouseY){
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
  s1.x=mouseX;
  s1.y=mouseY;
}

class Spring2D {
float airfriction = 0.00001;
float friction = 0.1;
float ballSpeedVert = 0;
float ballSpeedHorizon = 0;
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  public float gravity;
  float mass;
  float radius = 60;
  float stiffness = 0.2;
  float damping = 0.7;
  
  Spring2D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }
  
  void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }
  
  void display(float nx, float ny) {
    noStroke();    
    fill(#00c7ba);
    ellipse(x, y, radius*2, radius*2);
    stroke(#1a617c);
    line(x, y, nx, ny);
  }
  
  void BounceTop_Aux(){
    println(cont);
    cont++;
    int num=1;
    s2.gravity=0.0001;
    s1.gravity=0.0001;
    if (s2.x>450 || s2.y>450){
      num=-1;}
    s2.y += 100*num;
    s2.x += 200*num;
    s1.x += 200*num;
    s1.y += 100*num;
    ballSpeedVert*=-1;
    ballSpeedVert -= (ballSpeedVert * friction);}
  
  void makeBounceTop(float surface) {
    if (this.radius==5){
      y = surface+(radius*40);
      ballSpeedVert*=-1;
      ballSpeedVert -= (ballSpeedVert * friction);
    }else{ 
      BounceTop_Aux();
      }
  }
  
  void makeBounceLeft(float surface) {
  x = surface+(radius*2)+20;
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}
// ball hits object from right side
void makeBounceRight(float surface) {
  x = surface-(radius*2)-20;
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}

  void keepInScreen() {
  if (y-(radius)-10 < 0) {
    makeBounceTop(0);}
  else if (this.radius == 5 && this.y-(radius*40) < 0){
    makeBounceTop(0);
  }
  if (x-(radius*2) < 10) {
    makeBounceLeft(0);
  }
  // ball hits right of the screen
  if (x+(radius*2) > width-10) {
    makeBounceRight(width);
  }
}

}
