color white, black, strokeColor;
float rx, ry, rLen, rHue, rSat, rVal, rAlp;
  //initialize ranges
  int[] lenRange = {5, 100};
  int[] hueRange = {47, 153};
  int[] satRange = {32, 88};
  int[] valRange = {27, 90};
  int[] alpRange = {60, 100};

void setup() {
  //actual poster size is 16x30in
  size(640, 1200);

  //init colors
  colorMode(HSB, 360, 100, 100, 100);
  white = color(0, 0, 100, 100);
  black = color(0, 0, 0, 100);

  background(white);
  // noStroke();
  noFill();
}

void draw() {
  //generate random location and length
  // rx = random(width);
  // ry = random(height);
  rx = weightedRandomX(width, 5, 3);
  ry = weightedRandomY(height, 5, 5);
  rLen = random (lenRange[0], lenRange[1]);

  /*HUE KEY
    Red: 0;
    Orange: 30;
    Yellow: 60;
    Green: 120;
    Cyan: 180;
    Blue: 240;
    Purple: 270
    Magenta: 300;
    Pink: 330;
    Red: 360; */

  //hue is random within range
  rHue = random(hueRange[0], hueRange[1]);

  // saturation random within range
  rSat = random(satRange[0], satRange[1]);

  //inverse map color value to vertical position
  rVal = map(ry, 0, height, valRange[1], valRange[0]);

  //alpha random within range
  rAlp = random(alpRange[0], alpRange[1]);
  strokeColor = color(rHue, rSat, rVal, rAlp);
  
  pushStyle();
    stroke(strokeColor);
    line(rx, ry, rx, ry + rLen); //draw a vertical line of length rLen
  popStyle();
}