void drawHUD() {
  displayInputs();
  updateValues();
  displayIcons();

}

void displayInputs() {
 //draw switch state boxes
  int swD = 50;
  float swY = height - 25;
  float potAngle = map(pv, 0, 1023, TAU/3, 7*PI/3);
  for (int i = 0; i < sw.length; ++i) {
    pushStyle();
      stroke(grey);
      strokeWeight(3);
      strokeJoin(ROUND);
    if (sw[i]) {
      fill(grey);
    } else {
      // fill(white);
      noFill();
    }
    rectMode(CENTER);
    rect((center.x - 105) + 70*i, swY, swD, swD);
    popStyle();
  }
  pushStyle();
  noFill();
  stroke(grey);
  strokeWeight(3);
  ellipse(center.x + 160, swY, 30, 30);
  line((center.x + 160) + 7*cos(potAngle), swY + 7*sin(potAngle), (center.x + 160) + 15*cos(potAngle), swY + 15*sin(potAngle));
  popStyle();
}

void  displayIcons() {
  for (int i = 0; i < icons.length; ++i) {
    Icon icon = icons[i];
    icon.display();
  }
}

void updateValues() {
  for (int i = 0; i < icons.length; ++i) {
    Icon icon = icons[i];
    switch (i) {
      case 0 :
        icon.setValue(shapeHue + "º");
      break;
      case 1 :
        icon.setValue(int(radius) + "px");
      break;
      case 2 :
        switch (sides) {
          case 2 :
            icon.setValue("line");
          break;
          case 3 :
            icon.setValue("triangle");
          break;
          case 4 :
            icon.setValue("square");
          break;
          case 5 :
            icon.setValue("pentagon");
          break;
          case 6 :
            icon.setValue("hexagon");
          break;
          case 7 :
            icon.setValue("septagon");
          break;
          case 8 :
            icon.setValue("octagon");
          break;
          case 9 :
            icon.setValue("nonagon");
          break;
          case 10 :
            icon.setValue("circle");
          break;
        }
      break;
      case 3 :

      break;
    }
  }
}
