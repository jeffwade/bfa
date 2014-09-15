void drawHUD() {
  int swD = 50;
  float swY = height - 25;
  for (int i = 0; i < sw.length; ++i) {
    pushStyle();
    if (sw[i]) {
      fill(grey);
      noStroke();
    } else {
      fill(white);
      stroke(grey);
      strokeWeight(5);
      strokeJoin(ROUND);
      // swD = 45;
    }
    rectMode(CENTER);
    rect((center.x - 140) + 70*i, swY, swD, swD);
    popStyle();
  }
  pushStyle();
  noFill();
}