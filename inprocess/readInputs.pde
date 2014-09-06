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
    if (key == 'q') {
      sw[0] = true;
    }
    if (key == 'w') {
      sw[1] = true;
    }
    if (key == 'e') {
      sw[2] = true;
    }
    if (key == 'r') {
      sw[3] = true;
    }
    if (key == 'a') {
      sw[0] = true;
      sw[1] = true;
    }
    if (key == 's') {
      sw[0] = true;
      sw[2] = true;
    }
    if (key == 'd') {
      sw[0] = true;
      sw[3] = true;
    }
    if (key == 'f') {
      sw[1] = true;
      sw[2] = true;
    }
    if (key == 'g') {
      sw[1] = true;
      sw[3] = true;
    }
    if (key == 'h') {
      sw[2] = true;
      sw[3] = true;
    }
    if (key == 'z') {
      sw[0] = true;
      sw[1] = true;
      sw[2] = true;
    }
  }
}