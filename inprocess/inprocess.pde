import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

//set pins
int pot = 0; //potentiometer on pin 0
int switch1 = 3; //first switch on pin 3
int switch2 = 5; //second switch on pin 5
int switch3 = 7; //third switch on pin 7
int switch4 = 9; //fourth switch on pin 9

//variables for switch states and potentiometer value
int ss1, ss2, ss3, ss4; //switch states corresponing to swtiches of same number
float pv; //potentiometer value

color white, black, cyan, magenta, yellow;
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

int HI = Arduino.HIGH;
int LO = Arduino.LOW;

int H, S, B, A;
float r;

void setup() {
  size(512, 512);
  colorMode(HSB, 360, 100, 100, 100);
  white = color(0,0,100,100);
  black = color(0,0,0,100);
  cyan = color(180,100,100,100);
  magenta = color(300,100,100,100);
  yellow = color(60,100,100,100);

  background(white);
  noStroke();

  r = width;
  H = S = B = A = 0;

  //set up to recognize arduino
  println(Arduino.list()); //list serial ports
  String usbPort = Arduino.list()[5]; //on wMac, the arduino is connected to 7
  arduino = new Arduino(this, usbPort, 57600);

  //set pin modes
  arduino.pinMode(switch1, Arduino.INPUT);
  arduino.pinMode(switch2, Arduino.INPUT);
  arduino.pinMode(switch3, Arduino.INPUT);
  arduino.pinMode(switch4, Arduino.INPUT);
  arduino.pinMode(pot, Arduino.INPUT);
}

 void draw () {
  background(white);
  fill(H, S, B, A);
  rectMode(CENTER);
  rect(width/2, height/2, r, r);

  //read states of switches and value of potentiometer
  ss1 = arduino.digitalRead(switch1);
  ss2 = arduino.digitalRead(switch2);
  ss3 = arduino.digitalRead(switch3);
  ss4 = arduino.digitalRead(switch4);
  pv = arduino.analogRead(pot);
  if (ss1 == LO && ss2 == LO && ss3 == LO && ss4 == LO) {
    r = map(pv, 0, 1023, 25, width);
  }
  if (ss1 == HI) {
    H = (int) map(pv, 0, 1023, 0, 360);
  }
  if (ss2 == HI) {
    S = (int) map(pv, 0, 1023, 0, 100);
  }
  if (ss3 == HI) {
    B = (int) map(pv, 0, 1023, 0, 100);
  }
  if (ss4 == HI) {
    println("YES");
    A = (int) map(pv, 0, 1023, 0, 100);
  }
  // println("r: " + r + " H: " + H + ", S: " + S + ", B: " + B + ", A: " + A);

}