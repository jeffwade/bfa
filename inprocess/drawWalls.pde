void drawWalls(int w) {
  pushMatrix();
    translate(0, 0);
    rotate(0);
    pushStyle();
      fill(black,50);
      noStroke();
      rectMode(CORNER);

      switch (w) {
        case 0 :
          //no walls
        break;
        case 1 : //TOP and BOTTOM
          rect(0, 0, width, wallThickness);
          rect(0, height-wallThickness, width, wallThickness);
        break;
        case 2 : //LEFT and RIGHT
          rect(0, 0, wallThickness, height);
          rect(width - wallThickness, 0, width - wallThickness, height);
        break;
        case 3 : //ALL
          rect(0, 0, width, wallThickness);
          rect(0, height-wallThickness, width, wallThickness);
          rect(0, 0, wallThickness, height);
          rect(width - wallThickness, 0, width - wallThickness, height);
        break;
      }

    popStyle();
  popMatrix();
}