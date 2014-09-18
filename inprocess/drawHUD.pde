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
      fill(white);
      // noFill();
    }
    rectMode(CENTER);
    rect((center.x - 105) + 70*i, swY, swD, swD);
    popStyle();
  }
  pushStyle();
  fill(white);
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
      case 0 : //COLOR
        icon.setValue(shapeHue + "º");
      break;
      case 1 : //RADIUS
        icon.setValue(nfc(radius, 2) + "px");
      break;
      case 2 : //SHAPE
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
      case 3 : //FORCE
        icon.setValue(nfc(strength, 2) + "N");
      break;
      case 4 : //HEADING
        icon.setValue(round(heading*(180/PI)) + "º");
      break;
      case 5 : //NUMBER
        icon.setValue(str(number));
      break;
      case 6 : //ARRANGEMENT
        switch (arrangement) {
          case NONE :
            icon.setValue("none");
          break;
          case LINE :
            icon.setValue("line");
          break;
          case GRID :
            icon.setValue("grid");
          break;
          case RADIAL :
            icon.setValue("radial");
          break;
        }
      break;
      case 7 : //SPACING
        icon.setValue(nfc(padding/radius, 2) + "r");
      break;
      case 8 : //ANGLE
        icon.setValue(round(angle*(180/PI)) + "º");
      break;
      case 9 : //SPIN
        icon.setValue(round(spin*(180/PI)*60) + "º/s");
      break;
      case 10 : //OFFSET
        icon.setValue(nfc(offset, 2) + "px");
      break;
      case 11 : //ATTRACTION
        icon.setValue(nfc(-attraction,2) + "n");
      break;
      case 12 : //BOUNCE
        icon.setValue(nfc(bounce, 2) + "");
      break;
      case 13 : //MASS
        icon.setValue((mass - 1) + "kg");
      break;
      case 14 : //WALLS
        switch (walls) {
          case 0 : //none
            icon.setValue("no");
          break;
          case 1 : //top and bottom
            icon.setValue("horizontal");
          break;
          case 2 : //left and right
            icon.setValue("vertical");
          break;
          case 3 : //all
            icon.setValue("all");
          break;
        }
      break;
      case 15 : //RANDOM
        switch (randomizer) {
          case 0 : //none
            icon.setValue("none");
          break;
          case 1 : //appearance
            icon.setValue("appearance");
          break;
          case 2 : //motion
            icon.setValue("motion");
          break;
          case 3 : //set
            icon.setValue("set");
          break;
          case 4 : //physics
            icon.setValue("physics");
          break;
          case 5 : //everything
            icon.setValue("all");
          break;
        }
      break;
    }
  }
}
