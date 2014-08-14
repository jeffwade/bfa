color white;
color black;
void setup() {
 size(500,500);
  colorMode(HSB, 360, 100, 100, 100);
  white = color(0,0,100,100);
  black = color(0,0,0,100);
 background(white);
}
void draw() {
  float rx, ry, rLen;
  rx = random(width);
  ry = random(height);
  rLen = random (5, 100);
  line(rx, ry, rx, ry + rLen);
}
