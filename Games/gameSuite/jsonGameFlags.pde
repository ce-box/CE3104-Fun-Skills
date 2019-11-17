/* ------------------------------------------------------------
 * File: jsonGameFlags.pde
 * Developed by: Esteban Alvarado Vargas
 * Project: FunSkills - [Game]
 * version: 1.0
 * last edited: Esteban Alvarado:: 09/11/2019 | 00.40
 *
 * Description: Loads a JSON from the data folder or a URL, and 
 *              returns a JSONFlags.
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/


public class jsonGameFlags{
    
    // Object Game Values
    private ArrayList<String> _colors = new ArrayList<String>();
    private ArrayList<Integer> _points = new ArrayList<Integer>();
    private int _time;
    private int _repeat;
    private int _amnt;
    private int _amnt_inc;
    private int _time_dec;
    
    

    public jsonGameFlags(){
        deserealize();
    }

    private void deserealize(){

        // 1. Get the nested json of this game
        JSONObject jsonFile = loadJSONObject(Globals.configPath);
        JSONObject json = jsonFile.getJSONObject("flags");

        // 2. Get each of the json's own values ​​and assign 
        //    them to the class values

        // 2.1. Get the array of colors
        JSONArray colorsJson = json.getJSONArray("colors");
        String colorsArray[] = colorsJson.getStringArray(); 
        s_arrayToList(colorsArray);

        // 2.2. Get the array of points
        JSONArray pointsJson = json.getJSONArray("points");
        int pointsArray[] = pointsJson.getIntArray(); 
        int_arrayToList(pointsArray);

        // 2.3. Then get the int values
        _amnt = json.getInt("amnt");
        _amnt_inc = json.getInt("amnt_inc");
        _time_dec = json.getInt("time_dec");
        _repeat = json.getInt("repeat");
        _time = json.getInt("time");
    }

    private void s_arrayToList(String[] sArray){
        for(String _color:sArray){
        this._colors.add(_color);
      }
    }

    private void int_arrayToList(int[] iArray){
        for(int point:iArray){
        this._points.add(point);
      }
    }

    public int getAmnt(){
        return _amnt;
    }

    public int getAmntInc(){
        return _amnt_inc;
    }

    public int getTimeDec(){
        return _time_dec;
    }

    public int getTime(){
        return _time;
    }

    public int getRepeat(){
        return _repeat;
    }

    public ArrayList<String> getColors(){
        return _colors;
    }

    public ArrayList<Integer> getPoints(){
        return _points;
    }
}
