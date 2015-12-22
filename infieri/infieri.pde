 /*IN FIERI
  main Processing sketch
*/

//imports
  import java.util.*;
  import processing.serial.*;
  import cc.arduino.*;
//Generic global variables
  color white, black, grey, highlight, secondary;
  PVector center, origin;
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

//Global property constants
  final int NONE = 0; //new shapes added in random location
  //ARRANGEMENTS
  final int LINE = 1; //add new shapes behind previous
  final int GRID = 2; //arrange shapes in grid formation
  final int RADIAL = 3; //arrange shapes around center
  //WALLS
  final int TB = 1; //TOP and BOTTOM
  final int LR = 2; //LEFT and RIGHT
  final int ALL = TB + LR;
  final int wallThickness = 25;

//Global limits
  float minRadius = 15f;
  float maxRadius; //(height/6); set in setup
  int maxShapes = 2000;
  int maxSides = 10;
  float maxStrength = 1.2f;
  float maxSpeed = 12.0f;
  float maxSpin = 0.075f;
  int minMass = 15;
  int maxMass = 50;
  float minAttract = 0.05;
  float maxAttract = -0.15;
  float minBounce = 0.75;
  float maxBounce = 2;


//Global default property values
  int shapeHue = 150;
  float radius = 60f;
  int sides = 2;
  float speed = 0;
  float strength = 0f;
  float heading = 0f;
  int number = maxShapes;
  boolean arranged = false;
  int arrangement = GRID;
  float padding = radius;
  float angle = 0.0f;
  float spin = 0.05f;
  float offset = 0f;
  float attraction = 0f; //negative values attract, positive values repel
  float bounce = 1f;
  int mass = 15;
  int walls = NONE;
  int randomizer = NONE;

//Polygons
PShape penta, hexa, septa, octa, nona;

//fonts
PFont verlag24;

//create array for HUD icons
Icon[] icons = new Icon[16];

//count clicks (to draw centering lines)
// int clicks = 0;

void setup() {
  //general sketch settings
  // fullScreen();
    size(displayWidth, displayHeight, P2D);
    noCursor(); //hide the cursor

    //initialize colors
    colorMode(HSB, 360, 100, 100, 100);
    white = color(0,0,70,100);
    black = color(0,0,0,100);
    grey = color(0,0,20,100);
    highlight = color(5,100,80,100);
    secondary = color(210,80,80,100);

    //initialize unset global variables
    origin = new PVector(0,0);
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
    for (int i = 0; i < number; i++){
      //Shape(int _hue, float _radius, float _theta, float _speed, float _heading, int _sides, int _mass, float _spin, float _offset)
      shapes.add(new Shape(origin, shapeHue, radius,  sides, speed, heading, angle, spin, offset, attraction, bounce, mass));
    }
    arrangeShapes();
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
  // if (clicks%2 == 0) {
  //   drawGrid();
  // }
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

// void mouseReleased() {
//   clicks++;
//   delay(200);
// }
// boolean sketchFullScreen() {
//   return true;
// }
