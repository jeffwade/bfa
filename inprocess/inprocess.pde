import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

//set pins
int pot = 8; //potentiometer on pin 8
int switch1 = 2; //first switch on pin 2
int switch2 = 3; //second switch on pin 3
int switch3 = 4; //third switch on pin 4
int switch4 = 5; //fourth switch on pin 5

color white, black;

void setup() {
  size(512, 512);
  colorMode(HSB, 360, 100, 100, 100);
  white = color(0,0,100,100);
  black = color(0,0,0,100);

  background(white);
  noStroke();

  //set up to recognize arduino
  println(Arduino.list()); //list serial ports
  String usbPort = Arduino.list()[7]; //on wMac, the arduino is connected to 7
  arduino = new Arduino(this, usbPort, 57600);

  //set pin modes
  arduino.pinMode(switch1, Arduino.INPUT);
  arduino.pinMode(switch2, Arduino.INPUT);
  arduino.pinMode(switch3, Arduino.INPUT);
  arduino.pinMode(switch4, Arduino.INPUT);
  arduino.pinMode(pot, Arduino.INPUT);


}

 void draw () {
  state1

 }