// Daniel Shiffman
// Tracking the average location beyond a given depth threshold
// Thanks to Dan O'Sullivan

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

class KinectController {
/*
*******************************************************************************************Aqui declaramos las variables necesarias*******************************************************************************************************************************
*/
// Depth threshold
  int threshold = 745;


  // Raw location
  PVector loc;

  // Interpolated location
  PVector lerpedLoc;
  
  //ClosestPoint Location
  PVector closeloc;
  // Depth data
  int[] depth;
  
  // What we'll show the user
  PImage display;
/*
*******************************************************************************************Fin de la declaracion de variables necesarias*******************************************************************************************************************************
*/   
/*
*******************************************************************************************Aqui  lo que sigue es le metodo contructor*******************************************************************************************************************************
*/  
  KinectController() {
    // This is an awkard use of a global variable here
    // But doing it this way for simplicity
    kinect.initDepth();
    kinect.enableMirror(true);
    // Make a blank image
    display = createImage(kinect.width, kinect.height, RGB);
    // Set up the vectors
    loc = new PVector(0, 0);
    lerpedLoc = new PVector(0, 0);
  }
  /*
*******************************************************************************************Este metodo lo que hace es convertir de la infromacion cruda  de distacia qud nos brinda el kinect y lo convertimos en metros *******************************************************************************************************************************
*/  
  float rawDepthToMeters(int depthValue) {
  if (depthValue < 2047) {
    return (float)(1.0 / ((double)(depthValue) * -0.0030711016 + 3.3309495161));
  }
  return 0.0f;
}
  
/*
*******************************************************************************************Este metodo lo que hace es actualizar los vectores de localizacion y moviemieento de la persona*******************************************************************************************************************************
*/  
  void track() {
    // Get the raw depth as array of integers
    depth = kinect.getRawDepth();
    

    // Being overly cautious here
    if (depth == null) return;

    float sumX = 0;
    float sumY = 0;
    float count = 0;
    
    
     int rx=-10;
    int ry=-10;
    int record = 650;
    

    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {
        
        int offset =  x + y*kinect.width;
        // Grabbing the raw depth

        int rawDepth = depth[offset];
        int dif= record-rawDepth;

         if (rawDepth < record) {
         // println(record);
          //println(rawDepth);
          
            
             record=rawDepth;
         // record=y;
          rx=x;
          ry=y;
          
         // record=rawDepth;
         //// record=y;
         // rx=x;
         // ry=y;
         
         }
        


        // Testing against threshold
        if (rawDepth < threshold) {
          sumX += x;
          sumY += y;
          count++;
        }
      }
    }
    // As long as we found something
    if (count != 0||true) {//SI ALGO Falla quite el false
      loc = new PVector(sumX/count, sumY/count);
      closeloc=new PVector(rx,ry);
     int offset = (int )loc.x +(int )loc.y* kinect.width;      
      //println(rawDepthToMeters(depth[offset]));
    }


    // Interpolating the location, doing it arbitrarily for now
    lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
    lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }
/*
*******************************************************************************************Aqui  lo que  hace es le metodo hace es devolver el vector de movimiento *******************************************************************************************************************************
*/  
  PVector getLerpedPos() {
    return lerpedLoc;
  }
/*
*******************************************************************************************Aqui  lo que  hace es le metodo hace es devolver el vector de localizacion *******************************************************************************************************************************
*/  
  PVector getPos() {
    return loc;
  }
  
  
    PVector getClosest() {
    return closeloc;
  }
/*
*******************************************************************************************Aqui  lo que  hace es le metodo  es  dibujar los pixeles que estan mas cercanos del  limite(threshold) *******************************************************************************************************************************
*/
  void display() {
    PImage img = kinect.getDepthImage();

    // Being overly cautious here
    if (depth == null || img == null) return;
    int rx=-10;
    int ry=-10;
    int record = 650;

    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    display.loadPixels();
    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {

        int offset = x + y * kinect.width;
        // Raw depth
        int rawDepth = depth[offset];
        int pix = x + y * display.width;


        if (rawDepth < threshold) {
          // A red color instead
          display.pixels[pix] = color(9, 50, 50);
        //      if(y<record){

        //  record=rawDepth;
        //  record=y;
        //  rx=x;
        //  ry=y;
        //}
        
          
        } else {
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }
    display.updatePixels();

    // Draw the image
    image(display, 0, 0);
    line(0,0,520,460);
   //  fill(200, 250, 50, 200);
   //ellipse(rx,ry,32,32);
  }
  
  String calibracion(PVector promedio,int mode){
 if (mode==2){
   depth = kinect.getRawDepth();
  int pixel = (int )promedio.x +(int )promedio.y* kinect.width;
  int distanciaCruda=depth[pixel];
  float distancia=rawDepthToMeters(distanciaCruda);
  println ("estas es la distancia "+ distancia);
    if(distancia<0.9){
   
    println("PORFA ALEJATE MAS AL KINECT");
    return "PORFA ALEJATE MAS AL KINECT";
    }
    else if(distancia>1.4){
    println("PORFA ACERCATE MAS AL KINECT");
    return  "PORFA ACERCATE MAS AL KINECT";
    }  
    else{
    println("AHI ESTAS PERFECTO");
    return "AHI ESTAS PERFECTO";
    }
 
 }
 else{
   depth = kinect.getRawDepth();
  int pixel = (int )promedio.x +(int )promedio.y* kinect.width;
  int distanciaCruda=depth[pixel];
  float distancia=rawDepthToMeters(distanciaCruda);
  println ("estas es la distancia "+ distancia);
    if(distancia<0.8){
   
    println("PORFA ALEJATE MAS AL KINECT");
    return "PORFA ALEJATE MAS AL KINECT";
    }
    else if(distancia>1.0){
    println("PORFA ACERCATE MAS AL KINECT");
    return  "PORFA ACERCATE MAS AL KINECT";
    }  
    else{
    println("AHI ESTAS PERFECTO");
    return "AHI ESTAS PERFECTO";
    }
 
 }



}
  
  void modeHands(){
    float deg = constrain(30, 0, 30);
    kinect.setTilt(deg);
    
  }
    void modeFeets(){
    float deg = constrain(0, 0, 30);
    kinect.setTilt(deg);
    
  }

  int getThreshold() {
    return threshold;
  }

  void setThreshold(int t) {
    threshold =  t;
  }
}
