gameBalloon gB;

void setup(){
    size(1280,1040);
    gB = new gameBalloon();
    //_setup();
}

void draw(){
    gB.draw();
    //_draw();
}

void mouseClicked(){
    gB.mouseClicked();
}
void mouseDragged() {
    gB.mouseDragged();
}
