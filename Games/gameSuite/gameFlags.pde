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
    private ArrayList<String> colors;
    private ArrayList<Integer> points;
    
    // Game 
    private ArrayList<Flag> flagList = new ArrayList<Flag>();
    private ArrayList<String> pattern = new ArrayList<String>();

    private int repeat = 0;
    private int index_amnt = 3;
    private int amnt_inc = 0;

    // Timer vars
    private int time = 20; //seconds - 20 s min
    private int run_time = time;
    private int time_dec = 0;
    private int duration = 20;
    private int begin;

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

        begin = millis();

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
        
        jsonGameFlags jF = new jsonGameFlags();
        colors = jF.getColors();
        points = jF.getPoints();
        time = jF.getTime();
        repeat = jF.getRepeat();
        index_amnt = jF.getAmnt();
        amnt_inc = jF.getAmntInc();
        time_dec = jF.getTimeDec();

        duration = time;
        run_time = time;

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

        if(repeat > 0 && run_time > 0){
           
            background(255);
    
            textFont(fontArialBold);
            
            fill(0);
            text("Success:"+successes,50,20);
            text("Attemps:"+attempts,200,20);
            text("SCORE:"+score,650,20);
            text("Shifts: "+repeat,570,20);

            // Count down
            run_time = duration - (millis() - begin)/1000;
            text("Time: "+run_time+" s", 450,20);
            
            box.setPattern(pattern);
            box.drawBox();
            
            drawFlags();

            // When the player finishes the sequence...
            if(pattern.size() == 0){
                
                // 1. The number of indexes is increased ... (if possible)
                if((index_amnt+= amnt_inc) <= colors.size())
                    index_amnt += amnt_inc;
                
                // 2. Decrease the number of iterations
                repeat--;
                
                // 3. Decrease the time according to the configuration
                if(time > 20){
                    time -= time_dec;
                }else{ time = 20;}

                // 4. Assign the timeline values ​​again
                begin = millis();
                duration = time;
                run_time = time; 

                if(repeat>0)
                    generatePattern();

            }
        } else{
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
    public void mousePressed(){

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
    private void startGame(){
        gameScreen = 1;
    }


    /** 
     * @brief - Return all values ​​to their initial conditions
     */
    private void reset(){
        
        getConfig();
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
    private boolean checkFlag(Flag flag){
        String currentColor = pattern.get(0);
        String selectedColor = flag.getColor();
        return currentColor == selectedColor;
    }


    /**
     * @brief - Check if the cursor is on a flag, then verify that 
     *          the flag is the one you are looking for 
     */
    private void validateFlags(){
    
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
    private void drawFlags(){

        for(Flag flag : flagList){
            flag.update(mouseX,mouseY);
            flag.drawFlag();
        }
    }
    
    @Override
    public String toString(){
        String s = "FLAGS\n+colors: "+colors+"\n+points: "+points+"\ntime: "+time+"\namnt: "+index_amnt+"\ntime_dec: "+time_dec+"\namnt_inc: "+amnt_inc+"\nrepeat: "+repeat;
        println(s);
        return s;
    }

}
