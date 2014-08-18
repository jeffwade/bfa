import java.util.*;

int sides, d, r; // number of sides; diameter
PVector loc, vel, acc, mouse, center; //location, velocity, acceleration;
color white, black;


void setup() {
  size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100, 100);
  black = color(0, 0, 0, 100);
  white = color(0, 0, 100, 100);
//  frame.removeNotify();
//  frame.setUndecorated(true);
  smooth();
  r = 100;
}

void draw() {
  //initials
  frame.setTitle(int(frameRate) + " fps");
  background(white, 5);
  center = new PVector(width/2, height/2);
  mouse = new PVector(mouseX, mouseY);
  mouse.sub(center);
  pushMatrix();
  translate(center.x, center.y);

  pushStyle();
  noStroke();
  fill(black, 80);
  triangle(r*cos(0), r*sin(0), r*cos(2*PI/3), r*sin(2*PI/3), r*cos(4*PI/3), r*sin(4*PI/3));
  popStyle();

  pushStyle();
  stroke(black);
  line(0, 0, mouse.x, mouse.y);
  popStyle();
  popMatrix();
}
void keyPressed() {
  if (key == ESC) {key = 0;};
}
