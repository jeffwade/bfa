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
  }
}