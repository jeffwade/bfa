import processing.pdf.*;

color white, black, strokeColor;
float rx, ry, rLen, rHue, rSat, rVal, rAlp, rSW;
  //initialize ranges
  int[] lenRange = {3, 150};
<<<<<<< HEAD
  int[] hueRange = {60, 180};
=======
  int[] hueRange = {90, 150};
>>>>>>> 301913094f2bf3b316053e8899e4fbd7bf1ad179
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
<<<<<<< HEAD
  int[] satRange = {20, 80};
  int[] valRange = {40, 100};
  int[] alpRange = {60, 100};
=======
  int[] satRange = {30, 90};
  int[] valRange = {15, 90};
  int[] alpRange = {0, 100};
>>>>>>> 301913094f2bf3b316053e8899e4fbd7bf1ad179
boolean paused = false;
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

  beginRecord(PDF, "poster.pdf");
}

void draw() {
  if (!paused) {
  //generate random location and length
  // rx = random(width);
  // ry = random(height);
  rx = weightedRandomX(width, 5, 3);
  ry = weightedRandomY(height, 5, 5);
  rLen = random (lenRange[0], lenRange[1]);

  //hue is random within range
  rHue = random(hueRange[0], hueRange[1]);

  // saturation random within range
  rSat = random(satRange[0], satRange[1]);

  //inverse map color value to vertical position
  rVal = map(ry, 0, height, valRange[1], valRange[0]);

  //alpha random within range
  rAlp = random(alpRange[0], alpRange[1]);
  strokeColor = color(rHue, rSat, rVal, rAlp);
  rSW = random(2);

  int s = floor(random(1));

  pushStyle();
    strokeWeight(rSW);
    stroke(strokeColor);
    switch (s) {
      case 0 :
        line(rx, ry, rx, ry + rLen); //draw a vertical line of length rLen
      break;
      case 1 :
        rect(rx, ry, rLen, 5*rLen);
      break;
      case 2 :
        ellipse(rx, ry, rLen, rLen);
      break;
    }
    // ellipse(rx, ry, rLen, rLen);
    // rect(rx, ry, rLen, 5*rLen);
  popStyle();
  }
  }

void keyPressed() {
  int count = 0;
  if (key == 's' || key == 'S'){
    if (count%2 == 0) {
      endRecord();
    } else {
      beginRecord(PDF, "poster-####.pdf");
    }
    paused=!paused;
    count++;
  }
  if (key == 'q') {
    endRecord();
    exit();
  }
}