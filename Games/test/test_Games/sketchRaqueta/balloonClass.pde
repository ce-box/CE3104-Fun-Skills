class Balloon {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity = -5;
  float mass=10;
  float radius = 30;
  float stiffness = 0.1;
  float damping = 0.7;
  
  float airfriction = 0.1;
  float friction = 0.1;
  
  // ball settings
  float ballX, ballY;
  float ballSpeedVert = 0;
  float ballSpeedHorizon = 0;
  
  Balloon(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }
  
  void applyGravity() {
  ballSpeedVert += gravity;
  y += ballSpeedVert;
  ballSpeedVert -= (ballSpeedVert * airfriction);
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
    ellipse(x, y, radius*2, radius*2);
    stroke(255);
    line(x, y, nx, ny);
  }
  


}
