/* ------------------------------------------------------------
 * File: jsonGameBalloon.pde
 * Developed by: Esteban Alvarado Vargas
 * Project: FunSkills - [Game]
 * version: 1.0
 * last edited: Esteban Alvarado:: 09/11/2019 | 00.30
 *
 * Description: Loads a JSON from the data folder or a URL, and 
 *              returns a JSONBalloon.
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/


public class jsonGameBalloon{
    
    // Object Game Values
    private int _height;
    private int _length;
    private int _h_inc, _h_dec;
    private int _l_inc, _l_dec;
    private int _repeat;

    public jsonGameBalloon(){
        deserealize();
    }

    private void deserealize(){

        // 1. Get the nested json of this game
        JSONObject jsonFile = loadJSONObject(Globals.configPath);
        JSONObject json = jsonFile.getJSONObject("balloon");

        // 2. Get each of the json's own values ​​and assign 
        //    them to the class values

        _height = json.getInt("height");
        _length = json.getInt("length");
        _repeat = json.getInt("repeat");
        _h_inc = json.getInt("h_inc");
        _h_dec = json.getInt("h_dec");
        _l_inc = json.getInt("l_inc");
        _l_dec = json.getInt("l_dec");
    }

    public int getHeight(){
        return _height;
    }

    public int getLength(){
        return _length;
    }

    public int getHeightInc(){
        return _h_inc;
    }

    public int getHeightDec(){
        return _h_dec;
    }

    public int getLengthInc(){
        return _l_inc;
    }

    public int getLengthDec(){
        return _l_dec;
    }

    public int getRepeat(){
        return _repeat;
    }
}