import java.util.*;
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

//Pins
int pot = 0; //potentiometer on pin 0
int switch1 = 3; //first switch on pin 3
int switch2 = 5; //second switch on pin 5
int switch3 = 7; //third switch on pin 7
int switch4 = 9; //fourth switch on pin 9
int[] switches = {switch1, switch2, switch3, switch4};

//Inputs
float pv; //potentiometer value
boolean[] sw = {false, false, false, false}; //array holding switch states

//Global Colors
color white, black;

//Global Vectors
PVector center = new PVector(width/2, height/2);
/*
  HUE KEY:
----------------
  Red: 0;
  Orange: 30;
  Yellow: 60;
  Green: 120;
  Cyan: 180;
  Blue: 240;
  Purple: 270
  Magenta: 300;
  Pink: 330;
  Red: 360;
*/

int H, S, B, A;
float r;

void setup() {
  size(512, 512);
  colorMode(HSB, 360, 100, 100, 100);
  white = color(0,0,100,100);
  black = color(0,0,0,100);

  background(white);
  noStroke();

  r = width;
  H = S = B = A = 360;

  //set up to recognize arduino
  println(Arduino.list()); //list serial ports
  String usbPort = Arduino.list()[2]; //on wMac, the arduino is connected to 5
  arduino = new Arduino(this, usbPort, 57600);

  //set pin modes
  for (int i = 0; i < switches.length; ++i) {
    arduino.pinMode(switches[i], Arduino.INPUT);
  }
  arduino.pinMode(pot, Arduino.INPUT);
}

 void draw () {
  background(white);
  fill(H, S, B, A);
  rectMode(CENTER);
  rect(width/2, height/2, r, r);

  //read states of switches and value of potentiometer
  pv = arduino.analogRead(pot);
  for (int i = 0; i < switches.length; ++i) {
    int state = arduino.digitalRead(switches[i]);
    if (state == Arduino.HIGH) {
      sw[i] = true;
    } else {
      sw[i] = false;
    }
  }

  if (!(sw[0] || sw[1] || sw[2] || sw[3])) {
    r = map(pv, 0, 1023, 25, width);
  }
  if (sw[0]) {
    H = (int) map(pv, 0, 1023, 0, 360);
  }
  if (sw[1]) {
    S = (int) map(pv, 0, 1023, 0, 100);
  }
  if (sw[2]) {
    B = (int) map(pv, 0, 1023, 0, 100);
  }
  if (sw[3]) {
    A = (int) map(pv, 0, 1023, 0, 100);
  }

  println(sw[3]);
  // println(sw);
  // println("r: " + r + " H: " + H + ", S: " + S + ", B: " + B + ", A: " + A);

}