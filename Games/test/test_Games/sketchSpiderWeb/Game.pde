class Game{
  Player my_Player;
  Spiderweb web;
  
  public Game(int columns, int lines, ArrayList<String> game_Dic, ArrayList<Integer> game_Score){
    web = new Spiderweb(columns,lines,game_Dic,game_Score);
  }

  void keyPressed(){ 
  translate(250,250);
  switch(keyCode){
    case(UP):   
  ArrayList line = (ArrayList)  web_Vertexs.get(player_Column);
  player_X=(line.get(player_Line+1).get(1));
  player_Y=(line.get(player_Line+1).getY());
  player_Line++;
    case(DOWN):    
  LinkedList line2 =(LinkedList)  web_Vertexs.getNode(player_Column).getData();    
  player_X=(line2.getNode(player_Line-1).getX());
  player_Y=(line2.getNode(player_Line-1).getY());
  draw_Player();
  player_Line--;
    case(RIGHT):
  LinkedList new_Line =(LinkedList)  web_Vertexs.getNode(player_Column+1).getData();
  player_X=(new_Line.getNode(player_Line).getX());
  player_Y=(new_Line.getNode(player_Line).getY());
  player_Column++;
    case(LEFT):
  LinkedList new_Line2 =(LinkedList)  web_Vertexs.getNode(player_Column-1).getData();
  player_X=(new_Line2.getNode(player_Line).getX());
  player_Y=(new_Line2.getNode(player_Line).getY());
  player_Column--;
  }  
  translate(0,0);
}

}
