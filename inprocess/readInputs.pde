void readInputs() {
    pv = arduino.analogRead(pot);
  for (int i = 0; i < switches.length; ++i) {
    int state = arduino.digitalRead(switches[i]);
    if (state == Arduino.HIGH) {
      sw[i] = true;
    } else {
      sw[i] = false;
    }
  }
  if (keyPressed) {
    //SIZE
    if (key == 'q') {
      sw[0] = true;
    }
    //NUMBER
    if (key == 'w') {
      sw[1] = true;
    }
    //ANGLE
    if (key == 'e') {
      sw[2] = true;
    }
    //SPEED
    if (key == 'r') {
      sw[3] = true;
    }
    //PADDING
    if (key == 'a') {
      sw[0] = true;
      sw[1] = true;
    }
    //HEADING
    if (key == 's') {
      sw[0] = true;
      sw[2] = true;
    }
    //ATTRACTION
    if (key == 'd') {
      sw[0] = true;
      sw[3] = true;
    }
    //SHAPE
    if (key == 'f') {
      sw[1] = true;
      sw[2] = true;
    }
    //BOUNCE
    if (key == 'g') {
      sw[1] = true;
      sw[3] = true;
    }
    //SPIN
    if (key == 'h') {
      sw[2] = true;
      sw[3] = true;
    }
    //ARRANGEMENT
    if (key == 'z') {
      sw[0] = true;
      sw[1] = true;
      sw[2] = true;
    }
    //MASS
    if (key == 'z') {
      sw[0] = true;
      sw[1] = true;
      sw[3] = true;
    }
    //CENTER
    if (key == 'z') {
      sw[0] = true;
      sw[2] = true;
      sw[3] = true;
    }
    //WALLS
    if (key == 'z') {
      sw[1] = true;
      sw[2] = true;
      sw[3] = true;
    }
    //RANDOM
    if (key == 'z') {
      sw[0] = true;
      sw[1] = true;
      sw[2] = true;
      sw[3] = true;
    }
  }
}