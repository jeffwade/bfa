// potentiometer_piezo.ino
/*
  ReadAnalogVoltage
  Reads an analog input on pin 0, converts it to voltage, and prints the result to the serial monitor.
  Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.
 */

// the setup routine runs once when you press reset:
int notes[] = {262, 294, 330, 349, 392};

void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input on analog pin 0:
  float sensorValue = analogRead(A0);
  // Convert the analog reading (which goes from 0 - 1023) to a voltage (0 - 5V):
  Serial.println(sensorValue);

  if(sensorValue >= 1013){
    noTone(8);
  } else if(sensorValue >= 900){
      tone(8, notes[0]);
  } else if(sensorValue >= 650){
      tone(8, notes[1]);
  } else if(sensorValue >= 400){
      tone(8, notes[2]);
  } else if(sensorValue >= 150){
      tone(8, notes[3]);
  } else if (sensorValue >= 10) {
    tone(8, notes[4]);
  } else {
    noTone(8);
  }
}
