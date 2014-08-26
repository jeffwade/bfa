int switchState = 0;

void setup()
{
  Serial.begin(9600);
  pinMode(2, INPUT);
  pinMode(8, OUTPUT);
}

void loop()
{
 //read switch state
 switchState = digitalRead(2);

 // if pushed, turn pin 8 on
 // else turn pin 8 off
 if (switchState == HIGH) {
  digitalWrite(8, HIGH); //provide voltage to potentiometer
 } else {
  digitalWrite(8, LOW);
 }

}