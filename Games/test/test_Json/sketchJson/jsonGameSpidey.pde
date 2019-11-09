/* ------------------------------------------------------------
 * File: jsonGameSpidey.pde
 * Developed by: Esteban Alvarado Vargas
 * Project: FunSkills - [Game]
 * version: 1.0
 * last edited: Esteban Alvarado:: 09/11/2019 | 00.50
 *
 * Description: Loads a JSON from the data folder or a URL, and 
 *              returns a JSONSpidey.
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/


public class jsonGameSpidey{
    
    // Object Game Values
    private ArrayList<String> _words = new ArrayList<String>();
    private ArrayList<Integer> _points = new ArrayList<Integer>();
    private int _rows;
    private int _cols;    
    

    public jsonGameSpidey(){
        deserealize();
    }

    private void deserealize(){

        // 1. Get the nested json of this game
        JSONObject jsonFile = loadJSONObject(Globals.configPath);
        JSONObject json = jsonFile.getJSONObject("spidey");

        // 2. Get each of the json's own values ​​and assign 
        //    them to the class values

        // 2.1. Get the array of colors
        JSONArray wordsJson = json.getJSONArray("words");
        String wordsArray[] = wordsJson.getStringArray(); 
        s_arrayToList(wordsArray);

        // 2.2. Get the array of points
        JSONArray pointsJson = json.getJSONArray("points");
        int pointsArray[] = pointsJson.getIntArray(); 
        int_arrayToList(pointsArray);

        // 2.3. Then get the int values
        _rows = json.getInt("rows");
        _cols = json.getInt("cols");
    }

    private void s_arrayToList(String[] sArray){
        for(String _word:sArray){
        this._words.add(_word);
      }
    }

    private void int_arrayToList(int[] iArray){
        for(int point:iArray){
        this._points.add(point);
      }
    }


    public int getRows(){
        return _rows;
    }

    public int getCols(){
        return _cols;
    }

    public ArrayList<String> getWords(){
        return _words;
    }

    public ArrayList<Integer> getPoints(){
        return _points;
    }
}