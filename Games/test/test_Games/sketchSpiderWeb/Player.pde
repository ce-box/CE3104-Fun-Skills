class Player{

  int player_Column;
  int player_Line;
  int score = 0;
  float player_X;
  float player_Y;
  ArrayList<String> words_Found;
  
  public Player(){
    draw_Player(0,0);  
  }
  
  void draw_Player(int player_X, int player_Y){
    translate(250,250);
    fill(#b5cd38);
    noStroke();
    ellipse(player_X,player_Y,15,15);
    stroke(0);
    translate(0,0);
}



}
