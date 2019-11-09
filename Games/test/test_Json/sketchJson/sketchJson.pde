
void setup(){
  
  JGO_TEST();
  JGB_TEST();
  JGF_TEST();
  JGS_TEST();
}

// JSON GAME OBJECT TEST
void JGO_TEST(){
  println("----- JGO_TEST -----");
  jsonGameObject jgo = new jsonGameObject();

  println(jgo.getHeight());
  println(jgo.getLength());
  println(jgo.getTime());
  println(jgo.getRepeat());
  println(jgo.getPositions());
}

// JSON GAME BALLOON TEST
void JGB_TEST(){
  println("----- JGB_TEST -----");
  jsonGameBalloon jgo = new jsonGameBalloon();

  println(jgo.getHeight());
  println(jgo.getLength());
  println(jgo.getHeightInc());
  println(jgo.getHeightDec());
  println(jgo.getLengthInc());
  println(jgo.getLengthDec());
  println(jgo.getRepeat());
}

// JSON GAME FLAGS TEST
void JGF_TEST(){
  println("----- JGF_TEST -----");
  jsonGameFlags jgo = new jsonGameFlags();

  println(jgo.getColors());
  println(jgo.getPoints());
  println(jgo.getTime());
  println(jgo.getRepeat());
  println(jgo.getCntInc());
  println(jgo.getTimeDec());
}

// JSON GAME SPIDEY TEST
void JGS_TEST(){
  println("----- JGS_TEST -----");
  jsonGameSpidey jgo = new jsonGameSpidey();

  println(jgo.getWords());
  println(jgo.getPoints());
  println(jgo.getRows());
  println(jgo.getCols());
}

