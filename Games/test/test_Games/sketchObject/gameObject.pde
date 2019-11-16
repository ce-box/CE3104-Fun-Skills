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

    // Timer vars
    private int time = 60; //seconds - 20 s min
    private int run_time = time;
    private int time_dec = 0;
    private int duration = 60;
    private int begin;

    // Gameplay settings
    private float airfriction = -0.001;
    private float friction = 10;
    private int distances[]={200,50,100,70,10};
    
    // Scoring
    private int score = 0;
    private PFont fontArialBold;

    // Ball settings
    private float ballX, ballY; //ALTURA DEL SUELO,distancia desde la derecha
    private float ballSpeedVert = 0;
    private float ballSpeedHorizon = 0;
    private float ballSize = 100;
    private color ballColor = color(244,67,52);

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
            gameOverScreen();
        }
    }

    /* ------------------------------------------------------
     *                          INITS
     * -----------------------------------------------------*/

    /**
     * @brief Configure some UI properties
     */
    public void setup(){
        
        ballX=width/4;
        ballY=height/5;
        time_Interval = 2000; // 2 s
        last_Time_Check = millis();
        smooth();
        fontArialBold = createFont("Arial Bold", 16);
    }

    private void getConfig(){

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

        if(run_time > 0){

            background(236, 240, 241);
            
            drawBall(); 
            movement_Balloon(distances);
            
            applyHorizontalSpeed();
            
            keepInScreen();
            
            printTime();
            printScore();
            smooth();
        }else{
            gameScreen = 2;
        }
    }

    /**
     * @brief Final game window
     */
    void gameOverScreen() {
        background(44, 62, 80);
        textAlign(CENTER);
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
        text("Click to Restart", width/2, height-30);
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
    void movement_Balloon(int[] pos){ //cambia X
        if(millis()>last_Time_Check + time_Interval){
            last_Time_Check = millis();
            ballX+=20;
            drawBall();
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
        textFont(fontArialBold);
        textAlign(CENTER);
        fill(0);
        textSize(30); 
        text("Score:"+score, height/2, 50);
    }

    void printTime() {
        textFont(fontArialBold);
        textAlign(CENTER);
        textSize(30); 
        fill(0);

        // Count down
        run_time = duration - (millis() - begin)/1000;
        text("Time: "+run_time+" s", height/2+300,50);
    }

 }
