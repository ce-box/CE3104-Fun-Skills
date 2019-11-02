/* ------------------------------------------------------------
 * File: jsonReader.pde
 * Developed by: Esteban Alvarado Vargas
 * Project: FunSkills - [Game]
 * version: 1.0
 * last edited: Esteban Alvarado:: 02/11/2019 | 00.30
 *
 * Description: Loads a JSON from the data folder or a URL, and 
 *              returns a JSONObject.
 * 
 * TEC 2019 | CE3104 - Lenguajes, Compiladores e Interpretes
 * ------------------------------------------------------------*/

String directoryPath = "/home/esteban/Documentos/TEC/2S 2019/Lenguajes-Compiladores-Intérpretes/2. Compiladores/2. Proyecto/CE3104-Fun-Skills/";
String configPath = directoryPath+"FunSkills-Game/JSON/config.json";


class BallonDeserializer{

  int iterValue = 0;
  ArrayList<String> posList = new ArrayList<String>();

  /**
   * Deserializer Constructor
   */
  public BallonDeserializer(){
    game1Config();
  }

  /**
  * @brief - Read the JSON and get the variables that make up 
  *          the balloon game
  * @param iterValue
  * @param posList
  */
  private void game1Config(){
      
      // Get the json from game1
      JSONObject jsonFile = loadJSONObject(configPath);
      JSONObject gameDict = jsonFile.getJSONObject("game1");

      // Get the values
      this.iterValue = gameDict.getInt("iterations");
      JSONArray posJSON = gameDict.getJSONArray("positions");

      String[] posArray= posJSON.getStringArray();

      for(String pos:posArray){
        this.posList.add(pos);
      }

  }

  public int getIterVal(){
    return this.iterValue;
  }

  public ArrayList<String> getPosList(){
    return this.posList;
  }
}
