public class Balloon{
    
  float ballX, ballY;
  int ballSize = 100;
  int ballColor = color(0);
  float gravity = -1;
  float ballSpeedVert = 0;
  float airfriction = -0.001;
  float friction = 10;    
  float ballSpeedHorizon = 5;
  
  
  public Balloon(float x, float y) {
    fill(ballColor);
    this.ballX=x;
    this.ballY=y;
    ellipse(x, y, ballSize, ballSize);
    
    }
    
  public void setBallSize(int ballSize){
    this.ballSize=ballSize;
  }
  
  void movement_Collision(){
     if (mouseX > this.ballX && mouseX < this.ballX+this.ballSize && 
      mouseY > this.ballY && mouseY < this.ballY+this.ballSize){
        this.ballX=+20.5;
        this.ballY-=10.5;
        this.setPos(ballX+50,ballY);
        System.out.println(this.ballX);        
   } 
}
    
  
  public void setPos(float x, float y){
    this.ballX=x;
    this.ballY=y;
    ellipse(x, y, ballSize, ballSize);
  }
  
  public void applyGravity(){
    ballSpeedVert += gravity;
    this.ballY += ballSpeedVert;
    ballSpeedVert -= (ballSpeedVert * airfriction);
  }
  
  public float getBallX(){
    return this.ballX;
  }
  
  public float getBallY(){
    return this.ballY;
  }
  
  
  
  void makeBounceBottom(float surface) {
    ballY = surface-(ballSize/2);
    ballSpeedVert*=-1;
    ballSpeedVert -= (ballSpeedVert * friction);
  }
  void makeBounceTop(float surface) {
    ballY = surface+(ballSize/2);
    ballSpeedVert*=-1;
    ballSpeedVert -= (ballSpeedVert * friction);
  }
  // keep ball in the screen
  void keepInScreen() {
    // ball hits floor
    if (ballY+(ballSize/2) > height) { 
      makeBounceBottom(height);
    }
    // ball hits ceiling
    if (ballY-(ballSize/2) < 0) {
      makeBounceTop(0);
    }
    if (ballX-(ballSize/2) < 0){
      makeBounceLeft(0);
    }
    if (ballX+(ballSize/2) > width){
      makeBounceRight(width);
    }
  }
  
  
  void applyHorizontalSpeed(){
    ballX += ballSpeedHorizon;
    ballSpeedHorizon -= (ballSpeedHorizon * airfriction);
  }
  
  void makeBounceLeft(float surface){
    ballX = surface+(ballSize/2);
    ballSpeedHorizon*=-1;
    ballSpeedHorizon -= (ballSpeedHorizon * friction);
  }
  
  void makeBounceRight(float surface){
    ballX = surface-(ballSize/2);
    ballSpeedHorizon*=-1;
    ballSpeedHorizon -= (ballSpeedHorizon * friction);
  }

}
