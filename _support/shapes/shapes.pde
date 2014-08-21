import java.util.*;

int sides, r, d, number; // number of sides; radius; diameter; number of shapes drawn
PVector loc, vel, acc, mouse, center; //location, velocity, acceleration;
color white, black;
int H, S, V, A; //Hue, Saturation, Value, Alpha
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
  number =
  //Initial color settings
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

  H = 150;
  S = V = 100;
  A = 80;
}

void draw() {
  //initials
  frame.setTitle(int(frameRate) + " fps");
  background(white, 5);
  center = new PVector(width/2, height/2);
  mouse = new PVector(mouseX, mouseY);
  mouse.sub(center);
  r = (int) map(mouseY, 0, height, 250, 10);
  d = 2*r;
  sides = (int) map(mouseX, 0, width, 2, 50);
  number = 3;
  // println(sides);

  pushMatrix();
    translate(center.x, center.y);
    // rotate(-PI/(2*sides)); //*** FIGURE OUT HOW TO ROTATE EVERY SHAPE SO THAT IT SITS 'FLAT' ***

    pushStyle();
      s = createShape();

      if (sides < 3) {
      s.beginShape(LINES);
        s.noFill();
        s.stroke(H, S, V, A);
        s.strokeWeight(2);
        // println("r: "+r);
        s.vertex(-r, 0);
        s.vertex(r, 0);
        s.endShape();
      } else {
        s.beginShape();
        // if (sides >= 24) {
        //    sides = 100;
        //  }
        s.fill(H,S,V,A);
        s.noStroke();
        for (int i = 0; i < sides; i++) {
          s.vertex(r*cos(i*TAU/sides), r*sin(i*TAU/sides));
        }
         s.endShape(CLOSE);
      }

      for (int i = 0; i < sides; i++) {
        shape(s, d*cos(i*TAU/sides), d*sin(i*TAU/sides));
      }    popStyle();
  popMatrix();
}

void keyPressed() {
  // if (key == ESC) {key = 0;};
  if (key == ' ') {
    H = (H+30)%360;
  }
  if (key == CODED) {
    if (keyCode == UP) {
      A = abs((A+10))%110;
    } else if (keyCode == DOWN) {
      if (A == 0) {
        A=110;
      }
      A = abs((A-10)%110);
    }
  }
  // println("A: "+A);
}
