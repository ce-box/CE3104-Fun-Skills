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


JSONObject json;
String directoryPath = "/home/esteban/Documentos/TEC/2S 2019/Lenguajes-Compiladores-Intérpretes/2. Compiladores/2. Proyecto/CE3104-Fun-Skills/";
String configPath = directoryPath+"FunSkills-Game/JSON/config.json";

void setup() {

  json = loadJSONObject(configPath);

  JSONObject jsonA = json.getJSONObject("game1");
  int a = json.getInt("a");
  
  println("json game1: "+jsonA.toString() + ", a: " + a);
}


