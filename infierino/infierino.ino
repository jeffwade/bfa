void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input on analog pin 0:
  float sensorValue = analogRead(A0);

  // Print the analog reading
  Serial.println(sensorValue);
  //wait 100 ms
  delay(100);
}