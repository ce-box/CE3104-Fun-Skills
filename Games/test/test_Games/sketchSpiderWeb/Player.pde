class Player{

  public int column = -1;
  public int line;
  public int score = 0;
  public float x;
  public float y;
  public ArrayList<String> words_Found = new ArrayList<String>();
  
  public Player(){
    this.x=0;
    this.y=0;
  }
  
  void draw_Player(float player_X, float player_Y){
    this.x=player_X;
    this.y=player_Y;
    fill(#b5cd38);
    noStroke();
    ellipse(x,y,15,15);
    stroke(0);
}
  void setY(float y){
    this.y=y;}

  void setX(float x){
    this.x=x;}

  void add_Score(int score){
    this.score+=score;}
}
