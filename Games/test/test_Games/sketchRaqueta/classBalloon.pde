/* ------------------------------------------------------------
 * File: FlagClass.pde
 * Developed by: María José Zamora
 * Project: FunSkills - [Game]
 * version: 3.0
 * last edited: Esteban Alvarado:: 16/11/2019 | 18.30
 * 
 * Description: Implementation of the functionalities and 
 *              attributes of the Balloon.
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

class Balloon {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-dinamic coordinates
  
  float gravity = 0.0001;
  float mass=10;
  float radius = 30;
  float stiffness = 0.1;
  float damping = 0.7;
  int ballColor=#a6e3b3;
  float airfriction = 0.1;
  float friction = 0.1;
  
  public int ballY_dec=1; //INCS Y DECS
  public int ballX_inc=2;
  
  // ball settings
  float ballX, ballY;
  
  
  Balloon(float xpos, float ypos) {
    x = xpos;
    ballX = xpos;
    ballY= ypos;
    y = ypos;
  }
  
  void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    this.x += vx;
    
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    this.y += vy;
  }
  
  void display(float nx, float ny) {
    noStroke();
    if (radius==5){
      ballColor=#811006;}
    fill(ballColor);
    ellipse(x, y, radius*2, radius*2);
    stroke(#811006);
    line(x, y, nx, ny);
  }
  
  void BounceTop_Aux(){
    cont++;
    gravity=0.0001;
  if(ballX_inc==0 && ballY_dec==0){ 
      y = ballY;
      x = ballX;
    }
    else if (ballX_inc == 0){
      x = ballX;
      y = ballY-=(ballY_dec*60);
    }
    else if (ballY_dec == 0){
      x = ballX+=(ballX_inc*100);
      y = ballY;
    }else{
      x = ballX+=(ballX_inc*100);
      y = ballY-=(ballY_dec*60);
    }
 }
  
  void makeBounceTop(float surface) {
    if (this.radius==5){
      y = surface+(radius*50);
    }else{ 
      BounceTop_Aux();
      }
  }
  
  void keepInScreen() {
  if (y-(radius) < 200) {
    if (radius==5){
      BounceTop_Aux();}
    else{          
      gravity=0.0001;
      int[] colors = {#adff4d,#a9f9eb,#ffa0fb,#fff403,#ff8203,#ff017c,#ffba00,#8dff00,#00bffe,#ab00ff};
    int choice = random.nextInt(colors.length);
    ballColor = colors[choice];}
  }
  if (x-(radius) < 10) {
    x = (radius);
  }
  if (x+(radius) > width) {
    x = width-(radius);
  }
}

  public void setInc(int inc){
    this.ballX_inc = inc;
  }

  public void  setDec(int dec){
    this.ballY_dec = dec;
  }

}
