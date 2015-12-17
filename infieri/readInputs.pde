void readInputs() {
   // pv = arduino.analogRead(pot);
    pv = (int) map(mouseX, 0, width, 0, 1023);
  for (int i = 0; i < switches.length; ++i) {
    int state = arduino.digitalRead(switches[i]);
    if (state == Arduino.HIGH) {
      sw[i] = true;
    } else {
      sw[i] = false;
    }
  }
  if (keyPressed) {
    //simulate potentiometer
    //SIZE
    if (key == 'q') {
      sw[0] = true;
    }
    //SHAPE
    if (key == 'w') {
      sw[1] = true;
    }
    //SPEED
    if (key == 'e') {
      sw[2] = true;
    }
    //HEADING
    if (key == 'r') {
      sw[3] = true;
    }
    //NUMBER
    if (key == 'a') {
      sw[0] = true;
      sw[1] = true;
    }
    //ARRANGEMENT
    if (key == 's') {
      sw[0] = true;
      sw[2] = true;
    }
    //PADDING
    if (key == 'd') {
      sw[0] = true;
      sw[3] = true;
    }
    //ANGLE
    if (key == 'f') {
      sw[1] = true;
      sw[2] = true;
    }
    //SPIN
    if (key == 'g') {
      sw[1] = true;
      sw[3] = true;
    }
    //CENTER
    if (key == 'h') {
      sw[2] = true;
      sw[3] = true;
    }
    //ATTRACTION
    if (key == 'z') {
      sw[0] = true;
      sw[1] = true;
      sw[2] = true;
    }
    //BOUNCE
    if (key == 'x') {
      sw[0] = true;
      sw[1] = true;
      sw[3] = true;
    }
    //GRAVITY
    if (key == 'c') {
      sw[0] = true;
      sw[2] = true;
      sw[3] = true;
    }
    //WALLS
    if (key == 'v') {
      sw[1] = true;
      sw[2] = true;
      sw[3] = true;
    }
    //RANDOM
    if (key == 'b') {
      sw[0] = true;
      sw[1] = true;
      sw[2] = true;
      sw[3] = true;
    }
  }
}
