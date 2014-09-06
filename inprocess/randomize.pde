void randomize(Shape _s, int property) {

  switch (property) {
    case 0 :
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
    case 1 :
      for (int i = 0; i < shapes.size(); ++i) {
        float r = random(minRadius,maxRadius);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
          s.setRadius(r);
        }
      }
    break;
    case 2 :
      for (int i = 0; i < shapes.size(); ++i) {
        int n = (int) random(2,maxSides);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
          s.setShape(n);
        }
      }
    break;
    case 3 :
      for (int i = 0; i < shapes.size(); ++i) {
        float v = random(0,maxSpeed);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
          s.setSpeed(v);
        }
      }
    break;
    case 4 :
      for (int i = 0; i < shapes.size(); ++i) {
        float h = random(0,maxSpeed);
        Shape s = shapes.get(i);
        if (!(s.isRandomized())) {
          s.setHeading(h);
        }
      }
    break;
  }
}