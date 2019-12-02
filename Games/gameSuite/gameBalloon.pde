/* ------------------------------------------------------------
 * File: gameBalloon.pde
 * Developed by: María José Zamora - Esteban Alvarado
 * Project: FunSkills - [Game]
 * version: 5.0
 * last edited:  Esteban Alvarado:: 16/11/2019 | 12.30
 *
 * Description: Balloon Game Basic GUI implemented as a class.
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

 public class gameBalloon{

    // Attributes
    
    private Balloon playable, handle;

    private int repeat = 3;
    private int score = 0;
    private int attemps = 0;
    private float gravity = 0.01;
    private float mass = 2.0;

    private int _heigth;
    private int _lenght;
    private boolean pull=false,finishBallon=false;
    boolean ableTouch=false;
    private  int pullCounter=0;

    // GUI Variables
    private PFont fontOpenSansBold;
    private PImage background;

    /**
     * @brief Constructor
     */
    public gameBalloon(){
        getConfig();
        
    }

    /**
     * @brief Main function of drawing the class, this is called 
     *        from the game suite
     */
    public void draw(){
        
        gameScreen();
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
        if(xEscalada==-20&&yEscalada==-20){
          pullCounter=0;
        
          pull=false;
        }
        if(xEscalada!=-20&&yEscalada!=-20&&!ableTouch){
            pullCounter++;
            pull=true;
            
        }
        
        if(pull&&pullCounter<60){
          println("YA LO   ESTAS JALANDO");
          jalo((int)xEscalada,(int)yEscalada);
        
        }
        else if(pull&&pullCounter>60){
          println("YA NO   PUEDES JALAR");
          pull=false;
          ableTouch=true;
        }
        else if(ableTouch&&pullCounter<40){
          println("YA  PUEDES TOCAR EL BALLON");
          touching();
          
        
        }
    }

    /* ------------------------------------------------------
     *                          INITS
     * -----------------------------------------------------*/

    /**
     * @brief Configure some UI properties
     */
    private void setup(){
        // Inputs: x, y, mass, gravity
        playable = new Balloon(_lenght, _heigth);  
        handle = new Balloon(_lenght, _heigth);
        handle.radius=5;
        handle.mass=10;
        fontOpenSansBold = createFont("fonts/open-sans/OpenSans-ExtraBold.ttf",16);
        background = loadImage("img/imgBalloonGame.png");

    }

    private void getConfig(){
        
        jsonGameBalloon jB = new jsonGameBalloon();
        this._lenght = jB.getLength();
        this._heigth = jB.getHeight();

        this.setup();

        this.playable.setInc(jB.getLengthInc());
        this.playable.setDec(jB.getHeightDec());

        this.handle.setInc(jB.getLengthInc());
        this.handle.setDec(jB.getHeightDec());

        this.repeat = jB.getRepeat();

    }

    /* ------------------------------------------------------
     *                    SCREEN CONTENTS
     * -----------------------------------------------------*/
    
    /**
     * @brief Main game window
     */
    private void gameScreen(){
        if (repeat>=0){
            background(background);

            handle.update(handle.x,handle.y);
            handle.display(handle.x,handle.y);
            
            playable.update(handle.x, handle.y-100);
            playable.display(handle.x, handle.y);
            playable.keepInScreen();
            handle.keepInScreen();
            printScore();

        }else{
            // EL JUEGO TERMINA EN ESTA FUNCION
            gameOverScreen();
        }
    }

    /**
     * @brief Final game window
     */
    // EL JUEGO TERMINA EN ESTA FUNCION
    private void gameOverScreen() {
        background(44, 62, 80);
        textAlign(CENTER);
        fill(236, 240, 241);
        textFont(fontOpenSansBold);
        textSize(12);
        text("Your Score", width/2, height/2 - 120);
        textSize(130);
        text(score, width/2, height/2);
        textSize(15);
        text("Great Job!", width/2, height-30);
        finishBallon=true;
    }

    /* ------------------------------------------------------
     *                     INPUT EVENTS
     * -----------------------------------------------------*/

    /** 
     * @brief - For this example the entry is the mouse. This function must 
     *  be adapted to the kinect inputs
     */
    public void jalo(int x,int y){
      handle.x=x;
        handle.y=y;
    } 
    public void touching(){

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
      
        if (playable.x-playable.radius-20<xEscalada && playable.x+playable.radius+20>xEscalada && playable.y-playable.radius-20<yEscalada && playable.y+playable.radius+20>yEscalada){
                playable.update(playable.x+400,playable.y+600);
                playable.gravity=-11;
                handle.gravity=-6;
                playable.update(handle.x, handle.y-170);
                playable.display(handle.x, handle.y);      
                score++;
                repeat--;
                ableTouch=false;
        }
        else if (playable.x-playable.radius-100<xEscalada && playable.x+playable.radius+100>xEscalada && playable.y-playable.radius-100<yEscalada && playable.y+playable.radius+100>yEscalada){
            attemps++;

        } 
    }
    
    public void mouseClicked(){
      if(finishBallon){
          
            gB = new gameBalloon();
            gB.toString();
            ballon=false;
            flagInicio=true;
        }
        if (playable.x-playable.radius-20<mouseX && playable.x+playable.radius+20>mouseX && playable.y-playable.radius-20<mouseY && playable.y+playable.radius+20>mouseY){
            playable.update(playable.x+400,playable.y+600);
            playable.gravity=-11;
            handle.gravity=-6;
            playable.update(handle.x, handle.y-170);
            playable.display(handle.x, handle.y);      
            score++;
            repeat--;
            }
        else if (playable.x-playable.radius-100<mouseX && playable.x+playable.radius+100>mouseX && playable.y-playable.radius-100<mouseY && playable.y+playable.radius+100>mouseY){
            attemps++;

        } 
    }

    public void mouseDragged(){
        handle.x=mouseX;
        handle.y=mouseY;
    }

    /* ------------------------------------------------------
     *                     VALIDATIONS
     * -----------------------------------------------------*/

    void printScore() {
        fill(0);
        textAlign(CENTER);
        textFont(fontOpenSansBold);
        textSize(30); 
        text("Score: "+Integer.toString(score), 160, 60);
        text("Attemps: "+Integer.toString(attemps), 380,60);
        text("Shifts:"+repeat,860,60);
    }
 }
