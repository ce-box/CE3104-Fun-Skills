/* ------------------------------------------------------------
 * File: jsonGameObject.pde
 * Developed by: Esteban Alvarado Vargas
 * Project: FunSkills - [Game]
 * version: 3.0
 * last edited: Esteban Alvarado:: 08/11/2019 | 23.50
 *
 * Description: Loads a JSON from the data folder or a URL, and 
 *              returns a JSONObject.
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

public class jsonGameObject{
    
    // Object Game Values
    private int _height;
    private int _length;
    private int _time;
    private int _repeat;
    private ArrayList<String> _pos = new ArrayList<String>();

    public jsonGameObject(){
        deserealize();
    }

    private void deserealize(){

        // 1. Get the nested json of this game
        JSONObject jsonFile = loadJSONObject(Globals.configPath);
        JSONObject json = jsonFile.getJSONObject("object");

        // 2. Get each of the json's own values ​​and assign 
        //    them to the class values

        // 2.1. Get the array of positions
        JSONArray posJson = json.getJSONArray("pos");
        String posArray[] = posJson.getStringArray(); 
        arrayToList(posArray);

        // 2.2. Then get the int values
        _height = json.getInt("height");
        _length = json.getInt("length");
        _repeat = json.getInt("repeat");
        _time = json.getInt("time");
    }

    private void arrayToList(String[] sArray){
        for(String pos:sArray){
        this._pos.add(pos);
      }
    }

    public int getHeight(){
        return _height;
    }

    public int getLength(){
        return _length;
    }

    public int getTime(){
        return _time;
    }

    public int getRepeat(){
        return _repeat;
    }

    public ArrayList<String> getPositions(){
        return _pos;
    }
}
