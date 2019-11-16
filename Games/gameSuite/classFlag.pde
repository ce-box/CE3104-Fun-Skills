/* ------------------------------------------------------------
 * File: FlagClass.pde
 * Developed by: Esteban Alvarado Vargas
 * Project: FunSkills - [Game]
 * version: 1.0
 * last edited: Esteban Alvarado:: 29/10/2019 | 10.30
 * 
 * Description: Implementation of the functionalities and 
 *              attributes of the flags. An object allows
 *              better logic management. 
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

import java.util.Map;

public class Flag{

    // Atributes
    int posX;
    int posY;
    int flagHeight = 300; 
    int flagWidth = 150;
    color flagColor = color(0);
    color highColor = color(255);

    int points = 10;
    boolean flagOver;
    String colorName = "black";

    // Color Hash Map
    HashMap<String,Integer> colorDict = new HashMap<String,Integer>();


    /* Note: The default color of a Flag is Black*/
    
    /** 
     * @brief - Flag Class Contructor
     * @param posX
     * @param posY
     */
    public Flag(int posX,int posY){
        this.posX = posX;
        this.posY = posY;
        
        this.initDict();
    }
    
    /** 
     * @brief - Flag Class Contructor w/ ColorName
     * @param posX
     * @param posY
     */
    public Flag(int posX,int posY, String colorName,int points){
        this.posX = posX;
        this.posY = posY;
        this.colorName = colorName;
        this.points = points;

        this.initDict();
        this.initHColor();
        this.flagColor = colorDict.get(colorName);
    }

    /* ------------------------------------------------------
     *                    DRAWING FUNCTIONS
     * -----------------------------------------------------*/
    
    /** 
     * @brief - Flag Drawer
     * @param posX
     * @param posY
     * @param flagSize
     */
    public void drawFlag(){
        if(flagOver){
            fill(highColor);
        } else {
            fill(flagColor);
        }
        stroke(255);
        rect(posX,posY,flagWidth,flagHeight);
    }

    /* ------------------------------------------------------
    *                   SETTERS /& GETTERS
    * -----------------------------------------------------*/

    /** 
     * @brief - Allows you to configure the color of the flag
     * @param flagColor
     */
    public void setColor(color flagColor){
        this.flagColor = flagColor;
    }

    /** 
     * @brief - Set the highlighted color of the flag
     * @param highColor
     */
    public void setHColor(color highColor){
        this.highColor = highColor;
    }

    /** 
     * @brief Returns the color of the flag
     */
    public String getColor(){
        return this.colorName;
    }

    public int getPoints(){
        return this.points;
    }
    /* ------------------------------------------------------
     *                    UTIL FUNCTIONS
     * -----------------------------------------------------*/

    /** 
     * @brief - Update the state of the flag depending on whether 
     *          it is pressed or not
     * @param x
     * @param y
     */
    public void update(int x, int y){
       if( overFlag(x,y)){
           flagOver = true;
       } else {
           flagOver = false;
       }
    }

    /** 
     * @brief - Function to know if the mouse is on the flag
     * @param mouse_X
     * @param mouse_Y
     */
    public boolean overFlag(int mouse_X, int mouse_Y){
        if(mouse_X >= posX && mouse_X <= posX+flagWidth 
            && mouse_Y >= posY && mouse_Y <= posY+flagHeight){
                return true;
            }else{
              return false;
      }
    }

    /* ------------------------------------------------------
     *                    UTIL FUNCTIONS
     * -----------------------------------------------------*/

    // Initialize the content of the color-name dictionary
    private void initDict(){
        colorDict.put("red",#e60000);
        colorDict.put("orange",#ffa500);
        colorDict.put("yellow",#ffff33);
        colorDict.put("green",#009a00);
        colorDict.put("blue",#1a1aff);
    }

    // Initialize the content of the color-name dictionary
    private void initHColor(){
        switch (colorName) {
            case "red":
                highColor = #ff4066;
                break;
            case "orange":
                highColor = #ffbb00;
                break;
            case "yellow":
                highColor = #faff99;
                break;
            case "green":
                highColor = #0cfa40;
                break;
            case "blue":
                highColor = #5784ff;
                break;
            default:
                break;
        }
    }

}
