color white, black, strokeColor;
int[] lenRange, hueRange, satRange, valRange, alpRange;
float rx, ry, rLen;
int[] ;
void setup() {
  //poster size is 16x30in
  size(640, 1200);

  //init colors
  colorMode(HSB, 360, 100, 100, 100);
  white = color(0, 0, 100, 100);
  black = color(0, 0, 0, 100);

  //initialize ranges
  lenRange = {5, 100};
  hueRange = {}
  //ranges for color picker
  background(white);
  // noStroke();
  noFill();
}

void draw() {
  //generate random location and length
  rx = random(width);
  ry = random(height);
  rLen = random (lenRange[0], lenRange[1]);

  //strokeColor based on vertical location
  strokeColor = randomColor(ry);

  pushStyle();
    stroke(strokeColor);
    line(rx, ry, rx, ry + rLen); //draw a vertical line of length rLen
  popStyle();
}