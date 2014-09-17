/*IN FIERI

  main Processing sketch
*/

//imports
  import java.util.*;
  import processing.serial.*;
  import cc.arduino.*;
//Generic global variables
  color white, black, grey;
  PVector center;
  boolean change = false;
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

  int pv = 0; //potentiometer value
  int initPV; //to control value jumps
  boolean[] sw = {false, false, false, false}; //array holding switch states

//Global/Default Property values
  int shapeHue = 150;
  float radius = 100f;
  int sides = 6;
  float speed = 0f;
  PVector velocity = new PVector(0,0);
  float strength = 0f;
  float heading = 0.0f;
  int number = 1;
  int arrangement = 1; //default is LINE
  float padding = 100f;
  float angle = 0.0f;
  float spin = 0f;
  float offset = 0f;
  float attraction = 0.0f;
  int mass = 1;
  boolean arranged = false;
  int randomizer = 0;
  int walls = 0;
  float bounce = 1f;
  int wallThickness = 25;

//Global property constants
  //ARRANGEMENTS
  final int NONE = 0; //add new shapes at center
  final int LINE = 1; //add new shapes behind previous
  final int GRID = 2; //arrange shapes in grid formation
  final int RADIAL = 3; //arrange shapes around center
  final int RANDOM = 4; //new shapes added in random location


//Global limits
  float minRadius = 15f;
  float maxRadius; //(height/6); set in setup
  int maxShapes = 20;
  int maxSides = 10;
  float maxStrength = 1.0f;
  float maxSpeed = 10.0f;
  float maxSpin = 0.05f;
  int minMass = 1;
  int maxMass = 75;
  int maxAttract = 2;

//Polygons
PShape penta, hexa, septa, octa, nona;

//fonts
PFont verlag24;

Icon[] icons = new Icon[16];


void setup() {
  //general sketch settings
    size(displayWidth, displayHeight, P2D);
    // noCursor();
    colorMode(HSB, 360, 100, 100, 100);
    white = color(0,0,100,100);
    black = color(0,0,0,100);
    grey = color(0,0,20,100);
    center = new PVector(width/2, height/2);
    maxRadius = height/6f;
    background(white);
    noStroke();
    smooth();

  //loadfonts
    verlag24 = loadFont("verlag-24.vlw");
    textFont(verlag24);

  //create shapes for use in shape class
    createShapes();
  //initialize arraylist of shapes
    shapes = new ArrayList<Shape>();
    shapes.add(new Shape());

  //initialize arduino
    println(Arduino.list()); //list serial ports
    String port = Arduino.list()[0]; //on wMac: 5 is tty.usb
    arduino = new Arduino(this, port, 57600);
  //set pin modes
    for (int i = 0; i < switches.length; ++i) {
      arduino.pinMode(switches[i], Arduino.INPUT);
    }
    arduino.pinMode(pot, Arduino.INPUT);

  //array for icons
    loadIcons();
}

void draw () {
  motionBlur(white, 60); //set color and level of motion blur
  readInputs();  //read states of switches and value of potentiometer
  if (pv != initPV) {
    changeProperties(sw);
  }
  //run all of the shapes
  for (int i = 0; i < shapes.size(); ++i) {
    Shape s = shapes.get(i);
    s.run();
  }
  applyForces();
  drawWalls(walls);
  drawHUD();
  //grab snapshot/gif
  //post/store the above
  initPV = pv;
  }


void keyReleased() {
    //SIZE
    if (key == 'q') {
      sw[0] = false;
    }
    //SHAPE
    if (key == 'w') {
      sw[1] = false;
    }
    //SPEED
    if (key == 'e') {
      sw[2] = false;
    }
    //HEADING
    if (key == 'r') {
      sw[3] = false;
    }
    //NUMBER
    if (key == 'a') {
      sw[0] = false;
      sw[1] = false;
    }
    //ARRANGEMENT
    if (key == 's') {
      sw[0] = false;
      sw[2] = false;
    }
    //PADDING
    if (key == 'd') {
      sw[0] = false;
      sw[3] = false;
    }
    //ANGLE
    if (key == 'f') {
      sw[1] = false;
      sw[2] = false;
    }
    //SPIN
    if (key == 'g') {
      sw[1] = false;
      sw[3] = false;
    }
    //CENTER
    if (key == 'h') {
      sw[2] = false;
      sw[3] = false;
    }
    //ATTRACTION
    if (key == 'z') {
      sw[0] = false;
      sw[1] = false;
      sw[2] = false;
    }
    //BOUNCE
    if (key == 'x') {
      sw[0] = false;
      sw[1] = false;
      sw[3] = false;
    }
    //MASS
    if (key == 'c') {
      sw[0] = false;
      sw[2] = false;
      sw[3] = false;
    }
    //WALLS
    if (key == 'v') {
      sw[1] = false;
      sw[2] = false;
      sw[3] = false;
    }
    //RANDOM
    if (key == 'b') {
      sw[0] = false;
      sw[1] = false;
      sw[2] = false;
      sw[3] = false;
    }
}


boolean sketchFullScreen() {
  return true;
}