void changeProperties(boolean[] sw) {
    float initX = shapes.get(0).getX();

//[ ][ ][ ][ ]: Color
  if (!(sw[0] || sw[1] || sw[2] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      shapeHue = (int) map(pv, 0, 1023, 0, 360);
      s.setHue(shapeHue);
      }
  }

//[x][ ][ ][ ]: Radius
  if (sw[0] && !(sw[1] || sw[2] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      radius = map(pv, 0, 1023, 25.0, height / 6);
      s.setRadius(radius);
      }
  }

//[ ][x][ ][ ]: Number
  if (sw[1] && !(sw[0] || sw[2] || sw[3])) {
    int number = (int) map(pv, 0, 1023, 1, maxShapes);

    // find the difference between dialed number and current number
    int difference = number - shapes.size();

    // if the dial is higher than the current size, then add a new shape
    // if the dial is less than current size, remove shapes from the end
    // if the dial is set to the current size, do nothing
    if (difference > 0) {
      for (int i = 0; i < difference; ++i) {
        shapes.add(new Shape(shapeHue, radius, angle, speed, heading));
      }
    } else if (difference < 0) {
      for (int i = 0; i < abs(difference); ++i) {
        shapes.remove(shapes.size() - 1);
      }
    }
    int r = 25;
    int h = 0;
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      s.setX((initX + i*padding)%width);
      }
    println(shapes.size());
  }

//[ ][ ][x][ ]: Angle
  if (sw[2] && !(sw[0] || sw[1] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      angle = map(pv, 0, 1023, 0, TAU);
      s.setTheta(angle);
      }
  }

//[ ][ ][ ][x]: Speed
  if (sw[3] && !(sw[0] || sw[1] || sw[2])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      speed = map(pv, 0, 1023, 0, maxSpeed);
      PVector p = new PVector(speed*cos(heading), speed*sin(heading));
      s.setVelocity(p);
      }
  }

//[x][x][ ][ ]: Padding
  if (sw[0] && sw[1] && !(sw[2] || sw[3])) {
    padding = map(pv, 0, 1023, radius, 4*radius);
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      s.setX((initX + i*padding)%width);
      }
  }

  for (int i = 0; i < shapes.size(); ++i) {
    Shape s = shapes.get(i);
    s.run();
  }
}