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
  //general sketch settings
    size(512, 512);
    colorMode(HSB, 360, 100, 100, 100);
    white = color(0,0,100,100);
    black = color(0,0,0,100);
    center = new PVector(width/2, height/2);
    background(white);
    noStroke();

  //initialize arraylist of shapes
    shapes = new ArrayList<Shape>();
    shapes.add(new Shape());

  //initialize arduino
    // println(Arduino.list()); //list serial ports
    String usbPort = Arduino.list()[5]; //on wMac: 5 is tty.usb
    arduino = new Arduino(this, usbPort, 57600);

  //set pin modes
    for (int i = 0; i < switches.length; ++i) {
      arduino.pinMode(switches[i], Arduino.INPUT);
    }
    arduino.pinMode(pot, Arduino.INPUT);
}

 void draw () {
  motionBlur(white, 25); //set color and level of motion blur
  readInputs();  //read states of switches and value of potentiometer
  changeProperties(sw);
  //grab snapshot/gif
  //post/store the above
}