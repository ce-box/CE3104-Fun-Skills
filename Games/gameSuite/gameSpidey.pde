import java.lang.Math;

class gameSpidey{
  Player player= new Player();
  Spiderweb web;
  
  int columns;
  int lines;
  ArrayList<String> game_Dic;
  ArrayList<Integer> game_Score;
  
  public gameSpidey(){
      getConfig();
      toString();
      web = new Spiderweb(lines,columns,game_Dic,game_Score);
      player_Match();

  }
  
  private void getConfig(){
    // TODO: Get json data
    jsonGameSpidey jS = new jsonGameSpidey();
    columns = jS.getCols();
    lines = jS.getRows();
    game_Dic = jS.getWords();
    game_Score = jS.getPoints();
  }

  void keyPressed(){  
  if (keyCode == UP){
      translate_Player(1);}
  else if (keyCode == DOWN){
      translate_Player(3);}
  else if (keyCode == LEFT){
      translate_Player(4);}
  else if (keyCode == RIGHT){
      translate_Player(2);}
}
  
  void printScore() {
  textAlign(CENTER);
  textSize(30); 
  text("Score: "+Integer.toString(player.score), 600, -150);
}

  void word_Player_Collision(){  
    ArrayList column = (ArrayList)  web.data.get(player.column);
    ArrayList node = (ArrayList) column.get(player.line); 
    player.words_Found.add(node.get(2).toString());
    player.add_Score((int) node.get(3));  
    print(player.score);    
    
    player_Match();
    player.draw_Player(player.x,player.y);
  }

void player_Match(){  
  String words="";
  for (int i=0;i<player.words_Found.size()-1;i++){
    words+=player.words_Found.get(i).toString()+"   ";}
    fill(255);
    rect(-250, 250, 500,300);
    rect(590, -230, 120,50);
    fill(0);
    textSize(20);
    strokeWeight(1);
    text("Score: "+Integer.toString(player.score), 600, -220, 150,50);
    text(words, -250, 270, 500,300); 
}
  
  
  void translate_Player(int n){ 
    translate(250,250); 
    fill(#ff8203);
    ArrayList column = (ArrayList)  web.data.get(player.column);
    ArrayList node = (ArrayList) column.get(player.line);
    float x=(float)node.get(0);
    float y=(float)node.get(1);
    ellipse(x,y,15,15);
    if (n==1){
        if(player.column<web.columns-1){
          ArrayList col = (ArrayList)  web.data.get(player.column+1);
          ArrayList pos_NodeU = (ArrayList) col.get(player.line);
          player.setX((float)pos_NodeU.get(0));
          player.setY((float)pos_NodeU.get(1));  
          player.draw_Player(player.x,player.y);
          player.column++;
        }else{
          return;}
    }
    else if (n==3){
        if(player.column==0){
          return;
        }else{
          ArrayList col = (ArrayList)  web.data.get(player.column-1);
          ArrayList pos_NodeD = (ArrayList) col.get(player.line);
          player.setX((float)pos_NodeD.get(0));
          player.setY((float)pos_NodeD.get(1));  
          player.draw_Player(player.x,player.y);
          player.column--;}
        }
    else if (n==4){
        if(player.line==0){
          ArrayList col = (ArrayList)  web.data.get(player.column);
          player.line=web.lines-1;
          ArrayList pos_NodeRIGHT = (ArrayList) col.get(player.line);
          player.setX((float)pos_NodeRIGHT.get(0));
          player.setY((float)pos_NodeRIGHT.get(1));
          player.draw_Player(player.x,player.y);
        }else{
          ArrayList col = (ArrayList)  web.data.get(player.column);
          ArrayList pos_NodeRIGHT = (ArrayList) col.get(player.line-1);
          player.setX((float)pos_NodeRIGHT.get(0));
          player.setY((float)pos_NodeRIGHT.get(1));  
          player.draw_Player(player.x,player.y);
          player.line--;}
        }
    else if (n==2){      
        if(player.line==web.lines-1){
          ArrayList col3 = (ArrayList)  web.data.get(player.column);
          player.line=0;
          ArrayList pos_NodeR = (ArrayList) col3.get(player.line);
          player.setX((float)pos_NodeR.get(0));
          player.setY((float)pos_NodeR.get(1));
          player.draw_Player(player.x,player.y);
        }else{
          ArrayList col3 = (ArrayList)  web.data.get(player.column);
          ArrayList pos_NodeR = (ArrayList) col3.get(player.line+1);
          player.setX((float)pos_NodeR.get(0));
          player.setY((float)pos_NodeR.get(1));
          player.line++;
          player.draw_Player(player.x,player.y);
      }
    }    
    ////println("LINES            ",player.line,"esta deberia ser 4:  ",web.lines-1);
    //println("COLUMNS           ",player.column,"esta deberia ser 4:  ",web.columns-1);
    word_Player_Collision();
  }
  
  
  @Override
  public String toString(){
      String s = "SPIDEY\n+Words: "+game_Dic+"\n+Points: "+game_Score+"\nRows: "+lines+"\nCols: "+columns;
      println(s);
      return s;
  }
  
  
  
  
}
