import java.util.*; 

ArrayList<String> game_Dic = new ArrayList(Arrays.asList("Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba",
                                        "Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba",
                                        "Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba",
                                        "Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba",
                                        "Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba",
                                        "Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba","Sandia","Guayaba"));
ArrayList<Integer> game_Score = new ArrayList(Arrays.asList(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1));
Game game;

void setup() {
  size(1000,800); 
  background(255);
  stroke(0);
  strokeWeight(2);
  game = new Game(5,5,game_Dic,game_Score);
}

void draw() { 
}




void keyPressed(){  
  if (keyCode == UP){
      game.translate_Player(1);}
  else if (keyCode == DOWN){
      game.translate_Player(3);}
  else if (keyCode == LEFT){
      game.translate_Player(4);}
  else if (keyCode == RIGHT){
      game.translate_Player(2);}
}
