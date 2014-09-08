void randomize(Shape _s, int property) {

  switch (property) {
    case 0 : //RESET
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        s.setHue(shapeHue);
        s.setRadius(radius);
        s.setShape(sides);
        s.setVelocity(speed, heading);
        s.setTheta(angle);
        s.spin(spin);
        s.setOffset(offset);
        // s.setAttraction(attraction);
        // s.setBounce(bounce);
      }
    break;
    case 1 : //COLOR
      for (int i = 0; i < shapes.size(); ++i) {
        int h = (int) random(360);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
        s.setHue(h);
        s.setRadius(radius);
        s.setShape(sides);
        s.setVelocity(speed, heading);
        s.setTheta(angle);
        s.spin(spin);
        s.setOffset(offset);
        // s.setAttraction(attraction);
        // s.setBounce(bounce);
        }
      }
    break;
    case 2 : //SIZE
      for (int i = 0; i < shapes.size(); ++i) {
        float r = random(minRadius,maxRadius);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
        s.setRadius(r);
        s.setHue(shapeHue);
        s.setShape(sides);
        s.setVelocity(speed, heading);
        s.setTheta(angle);
        s.spin(spin);
        s.setOffset(offset);
        // s.setAttraction(attraction);
        // s.setBounce(bounce);

        }
      }
    break;
    case 3 : //SHAPE
      for (int i = 0; i < shapes.size(); ++i) {
        int n = (int) random(2,maxSides);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
        s.setShape(n);
        s.setHue(shapeHue);
        s.setRadius(radius);
        s.setVelocity(speed, heading);
        s.setTheta(angle);
        s.spin(spin);
        s.setOffset(offset);
        // s.setAttraction(attraction);
        // s.setBounce(bounce);

        }
      }
    break;
    case 4 : //SPEED
      for (int i = 0; i < shapes.size(); ++i) {
        float v = random(maxSpeed);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
        s.setSpeed(v);
        s.setHue(shapeHue);
        s.setRadius(radius);
        s.setShape(sides);
        s.setHeading(heading);
        s.setTheta(angle);
        s.spin(spin);
        s.setOffset(offset);
        // s.setAttraction(attraction);
        // s.setBounce(bounce);

        }
      }
    break;
    case 5 : //HEADING
      for (int i = 0; i < shapes.size(); ++i) {
        float h = random(TAU);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
        s.setHeading(h);
        s.setHue(shapeHue);
        s.setRadius(radius);
        s.setShape(sides);
        s.setSpeed(speed);
        s.setTheta(angle);
        s.spin(spin);
        s.setOffset(offset);
        // s.setAttraction(attraction);
        // s.setBounce(bounce);

        }
      }
    break;
    case 6 : //NUMBER
      //randomize number
    break;
    case 7 : //ARRANGEMENT
      //randomize arrangement
    break;
    case 8 : //PADDING
      //randomize padding
    break;
    case 9 : //ANGLE
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        float theta = random(TAU);
        s.setTheta(theta);
        s.setHue(shapeHue);
        s.setRadius(radius);
        s.setShape(sides);
        s.setVelocity(speed, heading);
        s.spin(spin);
        s.setOffset(offset);
        // s.setAttraction(attraction);
        // s.setBounce(bounce);

      }
    break;
    case 10 : //SPIN
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        float da = random(-maxSpin, maxSpin);
        s.spin(da);
        s.setHue(shapeHue);
        s.setRadius(radius);
        s.setShape(sides);
        s.setVelocity(speed, heading);
        s.setTheta(angle);
        s.setOffset(offset);
        // s.setAttraction(attraction);
        // s.setBounce(bounce);

      }
    break;
    case 11 : //CENTER
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        float dx = random(-maxRadius, maxRadius);
        s.setOffset(dx);
        s.setHue(shapeHue);
        s.setRadius(radius);
        s.setShape(sides);
        s.setVelocity(speed, heading);
        s.setTheta(angle);
        s.spin(spin);
        // s.setAttraction(attraction);
        // s.setBounce(bounce);

      }
    break;
    case 12 : //ATTRACTION
      for (int i = 0; i < shapes.size(); ++i) {

      }
    break;
    case 17 :
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        s.setHue((int) random(360));
        s.setRadius(random(minRadius, maxRadius));
        s.setShape((int) random(2,maxSides));
        s.setVelocity(random(maxSpeed), random(TAU));
        s.setTheta(random(TAU));
        s.spin(random(maxSpin));
        s.setOffset(random(-maxRadius, maxRadius));
        // s.setAttraction(attraction);
        // s.setBounce(bounce);
      }
    break;
  }
}