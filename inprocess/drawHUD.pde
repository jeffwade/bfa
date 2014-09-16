void drawHUD() {
  displayInputs();
  displayIcons();
}

void displayInputs() {
 //draw switch state boxes
  int swD = 50;
  float swY = height - 25;
  float potAngle = map(pv, 0, 1023, TAU/3, 7*PI/3);
  for (int i = 0; i < sw.length; ++i) {
    pushStyle();
    if (sw[i]) {
      fill(grey);
      noStroke();
      // swD = 50;
      // swY = height - 25;
    } else {
      fill(white);
      stroke(grey);
      strokeWeight(5);
      strokeJoin(ROUND);
      // swD = 45;
      // swY = height - 22.5;
    }
    rectMode(CENTER);
    rect((center.x - 130) + 70*i, swY, swD, swD);
    popStyle();
  }
  pushStyle();
  fill(white);
  stroke(grey);
  strokeWeight(5);
  ellipse(center.x + 150, swY, 35, 35);
  line((center.x + 150) + 5*cos(potAngle), swY + 5*sin(potAngle), (center.x + 150) + 17.5*cos(potAngle), swY + 17.5*sin(potAngle));
  popStyle();

void  displayIcons() {
  for (int i = 0; i < icons.length; ++i) {
    Icon icon = icons[i];
    icon.display();
  }
}
}