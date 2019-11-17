/* ------------------------------------------------------------
 * File: gameObject.pde
 * Developed by: María José Zamora - Esteban Alvarado
 * Project: FunSkills - [Game]
 * version: 1.0
 * last edited:  Esteban Alvarado:: 16/11/2019 | 12.30
 *
 * Description: Object Game Basic GUI implemented as a class.
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/


 public class gameObject{

    // According to its status is the screen that runs
    // 0: Initial Screen
    // 1: Game Screen
    // 2: Game-over Screen
    private int gameScreen = 0;

    // Time Settings
    private int seconds; // Wait time
    private float time_Interval;
    private float last_Time_Check;
    
    //Flag
    boolean touched=false;

    // Timer vars
    private int time = 60; //seconds - 20 s min
    private int run_time = time;
    private int time_dec = 0;
    private int duration = 60;
    private int begin;
    private int onScreen=0;

    // Gameplay settings
    private float airfriction = -0.001;
    private float friction = 10;
    private ArrayList<Integer> distances = new ArrayList<Integer>();

    // Scoring
    private int score = 0;
    private PFont fontArialBold;
    private int repeat;

    // Ball settings
    private float ballX, ballY; //ALTURA DEL SUELO,distancia desde la derecha
    private float ballSpeedVert = 0;
    private float ballSpeedHorizon = 0;
    private float ballSize = 100;
    private color ballColor = color(244,67,52);

    // GUI vars
    private PFont fontOpenSansBold;
    private PImage background;

    /**
     * @brief Constructor
     */
    public gameObject(){
        setup();
        getConfig();
        begin = millis();
    }
    

    /**
     * @brief Main function of drawing the class, this is called 
     *        from the game suite
     */
    public void draw(){
        // Display the contents of the current screen
        if (gameScreen == 0) { 
            initScreen();
        } else if (gameScreen == 1) { 
            gameScreen();
        } else if (gameScreen == 2) { 
            // EL JUEGO TERMINA EN ESTA FUNCION
            gameOverScreen();
        }

        //MODO MOUSE;
        onScreen++;
        if(mouseX>800){
        onScreen=0;
        touched=false;
        }
        else if(touched){
          println("YA LO TOCASTE");
        
        }
        else if (onScreen<40){
          tocar();
        }
        
        //MODO KINECT
        float xEscalada;
        float yEscalada;
        tracker.track();
        PVector v3 = tracker.getClosest();
        try {
        
           xEscalada=v3.x*2;
           yEscalada=v3.y*2;
   
        } catch (Exception e) {
           xEscalada=0;
           yEscalada=0;
        }
        ellipse((int)xEscalada,(int)yEscalada,25,25);

        
         //onScreen++;
        if(xEscalada==-20&&yEscalada==-20){
        onScreen=0;
        touched=false;
        }
        if(xEscalada!=-20&&yEscalada!=-20){
        onScreen++;
        }
        else if(touched){
          println("YA LO TOCASTE");
        
        }
        else if (onScreen<40){
          tocar();
        }
        
        
        
        //tocar();
        
    }

    /* ------------------------------------------------------
     *                          INITS
     * -----------------------------------------------------*/

    /**
     * @brief Configure some UI properties
     */
    public void setup(){
        
        ballX=width/4;
        ballY=height/5;// 2 s
        last_Time_Check = millis();
        smooth();
        fontOpenSansBold = createFont("fonts/open-sans/OpenSans-ExtraBold.ttf",16);
        background = loadImage("img/imgObjectGame.png");
    }

    private void getConfig(){
        jsonGameObject jO = new jsonGameObject();
        distances = jO.getPositions();
        ballY = jO.getHeight();
        ballX = jO.getLength();
        repeat = jO.getRepeat();
        time_Interval = jO.getTime();
    }


    /* ------------------------------------------------------
     *                    SCREEN CONTENTS
     * -----------------------------------------------------*/
    
    /**
     * @brief begin game window
     */
    private void initScreen() {
        background(236, 240, 241);
        textAlign(CENTER);
        fill(52, 73, 94);
        textSize(70);
        text("Balloon. Game 1", width/2, height/2);
        textSize(15); 
        text("Click to start", width/2, height-30);
    }

    /**
     * @brief Main game window
     */
    private void gameScreen() {

        if(repeat > 0 && run_time > 0){

            background(background);
            
            drawBall(); 
            movement_Balloon();
            
            applyHorizontalSpeed();
            
            keepInScreen();
            
            printTime();
            printScore();
            smooth();
        }else{
            // EL JUEGO TERMINA EN ESTA FUNCION
            gameScreen = 2;
        }
    }

    /**
     * @brief Final game window
     */
     // EL JUEGO TERMINA EN ESTA FUNCION
    void gameOverScreen() {
        background(44, 62, 80);
        textAlign(CENTER);
        textFont(fontOpenSansBold);
        fill(236, 240, 241);
        textSize(12);
        if(score!=0){
            text("¡Congratulations!", width/2, height/2 - 120);
        }else{
            text("¡Come on, you got this!", width/2, height/2 - 120);
        }
        textSize(130);
        text(score, width/2, height/2);
        textSize(15);
        text("Great Job!", width/2, height-30);
    }

    /* ------------------------------------------------------
     *                  SCREEN CHANGERS
     * -----------------------------------------------------*/

    // This method sets the necessery variables to start the game  
    private void startGame() {
        gameScreen=1;
    }
    
    private void gameOver() {
        gameScreen=2;
        gameOverScreen();
        ballX=width/4;
        ballY=height/5;
    }


    /* ------------------------------------------------------
     *                     INPUT EVENTS
     * -----------------------------------------------------*/
    public void tocar(){
      float xEscalada;
      float yEscalada;
      tracker.track();
      PVector v3 = tracker.getClosest();
        try {
        
           xEscalada=v3.x*2;
           yEscalada=v3.y*2;
   
        } catch (Exception e) {
           xEscalada=0;
           yEscalada=0;
        }

           
        // if((ballX-ballSize/2)<xEscalada && xEscalada<(ballX+ballSize/2) && (ballY-ballSize/2)<yEscalada && yEscalada<(ballY+ballSize/2)){
        //     score++;
        //     println("LO TOQUE");
        //     touched=true;
        // }

       if((ballX-ballSize/2)<mouseX && mouseX<(ballX+ballSize/2) && (ballY-ballSize/2)<mouseY && mouseY<(ballY+ballSize/2)){
           score++;
           println("LO TOQUE");
           touched=true;
       }
    
    }
    /** 
     * @brief - For this example the entry is the mouse. This function must 
     *  be adapted to the kinect inputs
     */
    public void mousePressed() {
        // if we are on the initial screen when clicked, start the game 
        if (gameScreen==0) { 
            startGame();
        }

        if (gameScreen==2) {
            gameScreen=1;
            score=0;
        }

        if((ballX-ballSize/2)<mouseX && mouseX<(ballX+ballSize/2) && (ballY-ballSize/2)<mouseY && mouseY<(ballY+ballSize/2)){
            score++;
            println("LO TOQUE");
        }
    }

    /* ------------------------------------------------------
     *                    DRAWING FUNCTIONS
     * -----------------------------------------------------*/
    
    /**
     * @brief - Maintains a loop that is drawing and 
     *          updating the ball
     */
    void drawBall() {
        fill(ballColor);
        ellipse(ballX, ballY, ballSize, ballSize);
    }

    /* ------------------------------------------------------
     *                      DYNAMICS
     * -----------------------------------------------------*/

    /**
     * @brief Move the ball in the y axis 
     */
    void movement_Balloon(){ //cambia X
        if(millis()>last_Time_Check + time_Interval){
            last_Time_Check = millis();
            ballX = distances.get((distances.size()) - repeat);
            drawBall();
            repeat--;
        }
    }

    
    /**
     * @brief Modify the speed on the x axis
     */
    void applyHorizontalSpeed() {
        ballX += ballSpeedHorizon;
        ballSpeedHorizon -= (ballSpeedHorizon * airfriction);
    }
    
    /**
     * @brief ball falls and hits the floor (or other surface)
     */
    void makeBounceBottom(float surface) {
        ballY = surface-(ballSize/2);
        ballSpeedVert*=-1;
        ballSpeedVert -= (ballSpeedVert * friction);
    }
    
    /**
     * @brief ball rises and hits the ceiling (or other surface)
     */
    void makeBounceTop(float surface) {
        ballY = surface+(ballSize/2);
        ballSpeedVert*=-1;
        ballSpeedVert -= (ballSpeedVert * friction);
    }
    
    /**
     * @brief ball hits object from left side
     */
    void makeBounceLeft(float surface) {
        ballX = surface+(ballSize/2);
        ballSpeedHorizon*=-1;
        ballSpeedHorizon -= (ballSpeedHorizon * friction);
    }
    
    /**
     * @brief ball hits object from right side
     */
    void makeBounceRight(float surface) {
        ballX = surface-(ballSize/2);
        ballSpeedHorizon*=-1;
        ballSpeedHorizon -= (ballSpeedHorizon * friction);
    }

    /* ------------------------------------------------------
     *                     VALIDATIONS
     * -----------------------------------------------------*/
    
    /**
     * @brief keep ball in the screen
     */
    void keepInScreen() {
        // ball hits floor
        if (ballY+(ballSize/2) > height) { 
            makeBounceBottom(height);
        }
        // ball hits ceiling
        if (ballY-(ballSize/2) < 0) {
            makeBounceTop(0);
        }
        // ball hits left of the screen
        if (ballX-(ballSize/2) < 0) {
            makeBounceLeft(0);
        }
        // ball hits right of the screen
        if (ballX+(ballSize/2) > width) {
            makeBounceRight(width);
        }
    }

    /* ------------------------------------------------------
     *                   SCORE & OTHER
     * -----------------------------------------------------*/

    /**
     * @brief increase score
     */    
    void score() {
        score++;
    }

    /**
     * @brief Display the score on the screen
     */
    void printScore() {
        textFont(fontOpenSansBold);
        textAlign(CENTER);
        fill(255);
        textSize(30); 
        text("Score:"+score, 1100, 60);
    }

    void printTime() {
        textFont(fontOpenSansBold);
        textAlign(CENTER);
        textSize(30); 
        fill(255);

        // Count down
        run_time = duration - (millis() - begin)/1000;
        text("Time: "+run_time+" s", 630,60);
    }

    @Override
    public String toString(){
        String s = "OBJECT\n+pos: "+distances+"\n+height: "+ballY+"\nlength: "+ballX+"\ntime: "+time_Interval+"\nrepeat: "+repeat;
        println(s);
        return s;
    }
}
    
