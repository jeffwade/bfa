void drawGrid() {
      pushStyle();
    stroke(grey, 5);
    strokeWeight(1);
    for (int i = 1; i < 48; ++i) {
      line(i*(width/48), 0, i*(width/48), height);
    }
    for (int i = 0; i < 27; ++i) {
      line(0, i*(height/27), width, i*(height/27));
    }
    popStyle();

}