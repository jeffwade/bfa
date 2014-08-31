void changeProperties(boolean[] sw) {

//[ ][ ][ ][ ]
//no switches closed: changes color
  if (!(sw[0] || sw[1] || sw[2] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      shapeHue = (int) map(pv, 0, 1023, 0, 360);
      s.setHue(shapeHue);
      s.run();
    }
  }

//[x][ ][ ][ ]
//first switch: change radius
  if (sw[0] && !(sw[1] || sw[2] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      radius = map(pv, 0, 1023, 25.0, 250.0);
      s.setRadius(radius);
      s.run();
    }
  }

//[ ][x][ ][ ]
//second switch: change number of shapes
  if (sw[1] && !(sw[0] || sw[2] || sw[3])) {
    int number = (int) map(pv, 0, 1023, 1, maxShapes);

    // find the difference between dialed number and current number
    int difference = number - shapes.size();

    // if the dial is higher than the current size, then add a new shape
    // if the dial is less than current size, remove shapes from the end
    // if the dial is set to the current size, do nothing
    if (difference > 0) {
      for (int i = 0; i < difference; ++i) {
        shapes.add(new Shape(shapeHue, radius));
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
      s.setX(i*50);
      s.run();
    }
    println(shapes.size());
  }

//[ ][ ][x][ ]
//third switch changes angle
  if (sw[2] && !(sw[0] || sw[1] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      angle = map(pv, 0, 1023, 0, TAU);
      s.setTheta(angle);
      s.run();
    }
  }

//[ ][ ][ ][x]
//fourth switch changes speed (ie magnitude of velocity)


}