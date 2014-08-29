import java.util.*;
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

//Array of shapes
ArrayList<Shape> shapes;


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
PVector center;

void setup() {
  size(512, 512);
  colorMode(HSB, 360, 100, 100, 100);
  white = color(0,0,100,100);
  black = color(0,0,0,100);
  center = new PVector(width/2, height/2);
  background(white);
  noStroke();

  //initialize shapes
  shapes = new ArrayList<Shape>();
  shapes.add(new Shape());

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
  pushStyle();
    fill(white);
    rect(0, 0, width, height);
  popStyle();

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
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      s.setHue( (int) map(pv, 0, 1023, 0, 360) );
      s.run();
    }
  }

  if (sw[0] && !(sw[1] || sw[2] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      s.setRadius( map(pv, 0, 1023, 25.0, 150.0) );
      s.run();
    }
  }

  // println(sw);
  // println("r: " + r + " H: " + H + ", S: " + S + ", B: " + B + ", A: " + A);

}