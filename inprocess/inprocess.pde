import processing.serial.*;
Serial arduino;
// float ptVal; //Value read from potentiometer
 int xPos = 1;         // horizontal position of the graph
int H = 0; //hue
color white;
void setup() {
  size(512, 512);
  colorMode(HSB, 360, 100, 100, 100);
  white = color(0,0,100,100);
  background(0, 0, 100, 100);
  noStroke();

  String usbPort = Serial.list()[7];
  arduino = new Serial(this, usbPort, 9600);
  arduino.bufferUntil('\n');
}

 void draw () {
 // everything happens in the serialEvent()
 }

 void serialEvent (Serial arduino) {
   // get the ASCII string:
   String inString = arduino.readStringUntil('\n');

   if (inString != null) {
     // trim off any whitespace:
     inString = trim(inString);
     // convert to an int and map to the screen height:
     float inByte = float(inString);
     H = (int) map(inByte, 0, 1023, 0, 360);
     background(H, 100, 100, 100);
     fill(white);
     ellipse(width/2, height/2, H, H);
   }
 }