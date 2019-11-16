/* ------------------------------------------------------------
 * File: PatternBox.pde
 * Developed by: Esteban Alvarado
 * Project: FunSkills - [Game]
 * version: 2.0
 * last edited: Esteban Alvarado:: 29/10/2019 | 10.30
 * 
 * Description: It presents the sequence of colors that the 
 *              user must follow in a pleasant way
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

 public class PatternBox{

     // Attributes
     int posX;
     int posY;
     int boxWidth = 300;
     int boxHeight = 60;
     int colorAmount = 5;
     float circleRad = 20;
     
     boolean pattern = false;

     ArrayList<String> colorPattern = new ArrayList<String>();

     // GUI Variables
     int boxColor = #807b7a;
     int offColor = color(0);
     int borderColor = #325e63;
     color doneColor;

    // Color Hash Map
    HashMap<String,Integer> colorDict = new HashMap<String,Integer>();

    /* Note: The default color of a Flag is Black*/


    /** 
     * @brief PatterBox Class Contructor
     * @param x
     * @param y
     */
    public PatternBox(int x, int y){
        // To set the box in the middle of the screen
        this.posX = x - boxWidth/2;
        this.posY = y;

        initDict();
    }

    /* ------------------------------------------------------
    *                   SETTERS /& GETTERS
    * -----------------------------------------------------*/

    public void setColorAmount(int colorAmount){
        this.colorAmount = colorAmount;
    }

    public void setCircleRadius(float radius){
        this.circleRad = radius;
    }

    public void setPattern(ArrayList<String> colorPattern){
        this.colorPattern = colorPattern;
        this.pattern = true;
    }


    /* ------------------------------------------------------
     *                    DRAWING FUNCTIONS
     * -----------------------------------------------------*/

    /** 
     * @brief - Draw the pattern box
     */
    public void drawBox(){
        fill(boxColor);
        rect(posX, posY, boxWidth, boxHeight);
        
        drawCircles();
    }

    /** 
     * @brief - Draw the sequence of colors that the user 
     *          must follow
     */
    public void drawCircles(){
        
        float tmpX = posX+24+circleRad;
        float tmpY = posY+30;
        
        int listIndex = 0;
        for(int i= 0; i < colorAmount; i++){
            
            if(pattern){
                try {
                String currentColorCode = colorPattern.get(listIndex);
                int currentColor = colorDict.get(currentColorCode);
                fill(currentColor);
                } catch (Exception e) {
                    fill(offColor);
                }
            } 

            ellipseMode(RADIUS);ellipse(tmpX,tmpY,circleRad,circleRad);
            tmpX += ((2*circleRad)+12);
            listIndex++;
        }
    }

    /* ------------------------------------------------------
     *                    UTIL FUNCTIONS
     * -----------------------------------------------------*/
     
    /** 
     * @brief - Initialize the content of the color-name dictionary
     */
    private void initDict(){
        colorDict.put("red",#e60000); // RED
        colorDict.put("orange",#ffa500); // ORANGE
        colorDict.put("yellow",#ffff33); // YELLOW
        colorDict.put("green",#009a00); // GREEN
        colorDict.put("blue",#1a1aff); // BLUE
    }


}
