/* ------------------------------------------------------------
 * File: gameFlags.pde
 * Developed by: María José Zamora - Esteban Alvarado
 * Project: FunSkills - [Game]
 * version: 3.0
 * last edited:  Esteban Alvarado:: 9/11/2019 | 12.30
 *
 * Description: Flags Game Basic GUI implemented as a class.
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

import java.util.Collections;

public class gameFlags{

    // Game DB JSON Values
    private ArrayList<String> colors = new ArrayList<String>();
    private ArrayList<Integer> points = new ArrayList<Integer>();
    
    // Game 
    private ArrayList<Flag> flagList = new ArrayList<Flag>();
    private ArrayList<String> pattern = new ArrayList<String>();

    private int repeat = 0;
    private int time = 0;
    private int index_amnt = 3;
    private int amnt_inc = 0;
    private int time_dec = 0;

    // According to its status is the screen that runs
    // 0: Initial Screen
    // 1: Game Screen
    // 2: Game-over Screen
    private int gameScreen = 0;


    // Quantization of attempts
    private int attempts = 0;
    private int successes = 0;
    private int score = 0;

    // GUI Variables
    private PatternBox box;
    private PFont fontArialBold;
    

    /**
     * @brief Constructor
     */
    public gameFlags(){
         
        guiSetup();
        getConfig();

        initFlags();
        generatePattern();

    }
    
    /**
     * @brief Main function of drawing the class, this is called 
     *        from the game suite
     */
    public void draw(){
         
        // Game Screen Selector
        if(gameScreen == 0){
            initScreen();
        } else if(gameScreen == 1){
            gameScreen();
        } else if(gameScreen == 2){
            gameOverScreen();
        }

    }
    /* ------------------------------------------------------
     *                          INITS
     * -----------------------------------------------------*/

    /**
     * @brief Create a list of flags according to the configuration file
     */
    private void initFlags(){
        Flag flag;
        int xPos = 0;
        int yPos = height/2 - 50;
        for(int index = 0; index < colors.size(); index++){

            String fColor = colors.get(index);
            int fPoints = points.get(index);
            flag = new Flag(xPos,yPos,fColor,fPoints);
            flagList.add(flag);
            xPos+=155;
        }
    }

    /**
     * @brief Generate a random pattern using the maximum number 
     *        of colors allowed
     */
    private void generatePattern(){

        //1. Copy the elements to pattern
        for(int i = 0; i < index_amnt; i++){
            pattern.add(colors.get(i));
        }

        //2. Generate a random order
        Collections.shuffle(pattern);
        println(pattern);

    }

    /**
     * @brief Configure some UI properties
     */
    private void guiSetup(){
        fontArialBold = createFont("Arial Bold", 16);
        box = new PatternBox(250,100);
    }

    /**
     * @brief Get the information from the configuration file 
     *        and modify it in the game
     */
    private void getConfig(){
        // Stuff to get config.json data
    }

    /* ------------------------------------------------------
     *                    SCREEN CONTENTS
     * -----------------------------------------------------*/
    
    /**
     * @brief begin game window
     */
    private void initScreen(){
        background(0);
        textAlign(CENTER);
        text("Click to Start", width/2, height/2);   
    }

    /**
     * @brief Main game window
     */
    private void gameScreen(){
        background(255);
 
        textFont(fontArialBold);
        fill(0);
        text("Success:"+successes,50,20);
        text("Attemps:"+attempts,200,20);
        text("Score:"+score,550,20);
        
        box.setPattern(pattern);
        box.drawBox();
         
        drawFlags();
 
        if(pattern.size() == 0){
            gameScreen = 2;
        }
    }

    /**
     * @brief Final game window
     */
    private void gameOverScreen() {
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

    /* ------------------------------------------------------
     *                     INPUT EVENTS
     * -----------------------------------------------------*/

    /** 
     * @brief - For this example the entry is the mouse. This function must 
     *  be adapted to the kinect inputs
     */
    void mousePressed(){

        if(gameScreen == 0){
            startGame();
        }

        if(gameScreen == 1){
            validateFlags();
        }

        if(gameScreen == 2){
            gameScreen = 0;
            reset();
        }
    }

    /* ------------------------------------------------------
     *                  SCREEN CHANGERS
     * -----------------------------------------------------*/

    /** 
     * @brief - Sets the necessary variables to start the game
     */ 
    void startGame(){
        gameScreen = 1;
    }


    /** 
     * @brief - Return all values ​​to their initial conditions
     */
    void reset(){

        generatePattern();
        score = 0;
        attempts = 0;
        successes = 0;
    }

    /* ------------------------------------------------------
     *                     VALIDATIONS
     * -----------------------------------------------------*/

    /** 
     * @brief - checks if the color of the flag matches the 
     *          first of the sequence
     */ 
    boolean checkFlag(Flag flag){
        String currentColor = pattern.get(0);
        String selectedColor = flag.getColor();
        return currentColor == selectedColor;
    }


    /**
     * @brief - Check if the cursor is on a flag, then verify that 
     *          the flag is the one you are looking for 
     */
    void validateFlags(){
    
        for(Flag flag: flagList){
            
            if(flag.flagOver){ 
            if(checkFlag(flag)){
                println("Correct!");
                pattern.remove(0);
                successes++;
                score += flag.getPoints();
            } 
            else{
                println("Bad Answer!");
                attempts++;
            }
            }
        }
    }

    /* ------------------------------------------------------
     *                    DRAWING FUNCTIONS
     * -----------------------------------------------------*/

    /**
     * @brief - Maintains a loop that is drawing and 
     *          updating the flags
     */
    void drawFlags(){

        for(Flag flag : flagList){
            flag.update(mouseX,mouseY);
            flag.drawFlag();
        }
    }

}
