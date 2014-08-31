/*IN FIERI

  main Processing sketch
*/

//imports
  import java.util.*;
  import processing.serial.*;
  import cc.arduino.*;
//Generic global variables
  color white, black;
  PVector center;
//Global objects
  ArrayList<Shape> shapes;
  Arduino arduino;
//Pins and Inputs
  int pot = 0; //potentiometer on pin 0
  int switch1 = 3; //first switch on pin 3
  int switch2 = 5; //second switch on pin 5
  int switch3 = 7; //third switch on pin 7
  int switch4 = 9; //fourth switch on pin 9
  int[] switches = {switch1, switch2, switch3, switch4};

  float pv; //potentiometer value
  boolean[] sw = {false, false, false, false}; //array holding switch states
//Global Property variables
  int shapeHue;
  float radius;
  float angle;
  float speed;
  float heading = 0.0;
  int sides;


//Global limits
  int maxShapes = 10;
  int maxSides = 10;
  float maxSpeed = 10;

void setup() {
  //general sketch settings
    size(displayWidth/2, displayHeight/2, P2D);
    colorMode(HSB, 360, 100, 100, 100);
    white = color(0,0,100,100);
    black = color(0,0,0,100);
    center = new PVector(width/2, height/2);
    background(white);
    noStroke();
    smooth();
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
  //arrange shapes
  //grab snapshot/gif
  //post/store the above
}