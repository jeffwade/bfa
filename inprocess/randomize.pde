void randomize(Shape _s, int property) {

  switch (property) {
    case 0 : //RESET
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
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
    case 1 : //SIZE
      for (int i = 0; i < shapes.size(); ++i) {
        float r = random(minRadius,maxRadius);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
          s.setRadius(r);
        }
      }
    break;
    case 2 : //SHAPE
      for (int i = 0; i < shapes.size(); ++i) {
        int n = (int) random(2,maxSides);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
          s.setShape(n);
        }
      }
    break;
    case 3 : //SPEED
      for (int i = 0; i < shapes.size(); ++i) {
        float v = random(maxSpeed);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
          s.setSpeed(v);
        }
      }
    break;
    case 4 : //HEADING
      for (int i = 0; i < shapes.size(); ++i) {
        float h = random(TAU);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
          s.setHeading(h);
        }
      }
    break;
    case 5 : //NUMBER
      //randomize number
    break;
    case 6 : //ARRANGEMENT
      //randomize arrangement
    break;
    case 7 : //PADDING
      //randomize padding
    break;
    case 8 : //ANGLE
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        float theta = random(TAU);
        s.setTheta(theta);
      }
    break;
    case 9 : //SPIN
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        float da = random(maxSpin);
        s.spin(da);
      }
    break;
  }
}