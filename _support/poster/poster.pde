color white, black, strokeColor;


void setup() {
  //poster size is 16x30in
  size(640, 1200);

  //init colors
  colorMode(HSB, 360, 100, 100, 100);
  white = color(0, 0, 100, 100);
  black = color(0, 0, 0, 100);

  //ranges for color picker
  background(white);
  // noStroke();
  noFill();
}

void draw() {
  strokeColor = randomColor(5, 5);
  pushStyle();
    stroke(strokeColor);
  popStyle();
}