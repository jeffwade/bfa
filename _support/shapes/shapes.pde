import java.util.*;

int sides, r; // number of sides; diameter
PVector loc, vel, acc, mouse, center; //location, velocity, acceleration;
color white, black;

PShape s;

void setup() {
  size(500, 500, P2D);
  colorMode(HSB, 360, 100, 100, 100);
  black = color(0, 0, 0, 100);
  white = color(0, 0, 100, 100);
//  frame.removeNotify();
//  frame.setUndecorated(true);
  smooth(8);
  r = 100;
  sides = 13; //min: 3; max: ?; max+1: circle;
}

void draw() {
  //initials
  frame.setTitle(int(frameRate) + " fps");
  background(white, 5);
  center = new PVector(width/2, height/2);
  mouse = new PVector(mouseX, mouseY);
  mouse.sub(center);
  r = (int) map(mouseY, 0, height, 250, 10);
  sides = (int) map(mouseX, 0, width-5, 2, 25);

  println(sides);
  pushMatrix();
    translate(center.x, center.y);
    // rotate(-PI/(2*sides)); //*** FIGURE OUT HOW TO ROTATE EVERY SHAPE SO THAT IT SITS 'FLAT' ***

    pushStyle();
      s = createShape();

      s.beginShape();
        s.fill(black, 80);
        s.noStroke();
        for (int i = 0; i < sides; i++) {
          s.vertex(r*cos(i*TAU/sides), r*sin(i*TAU/sides));
        }
      s.endShape(CLOSE);

      shape(s, 0, 0);
    popStyle();
  popMatrix();
}
void keyPressed() {
  // if (key == ESC) {key = 0;};
}
