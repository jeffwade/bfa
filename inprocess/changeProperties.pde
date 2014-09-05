void changeProperties(boolean[] sw) {
    float initX = shapes.get(0).getX();
    float initY = shapes.get(0).getY();

//[ ][ ][ ][ ]: Color
  if (!(sw[0] || sw[1] || sw[2] || sw[3])) {
      shapeHue = (int) map(pv, 0, 1023, 0, 360);;
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        s.setHue(shapeHue);
      }
    // println("Hue: "+shapeHue);
  }

//[x][ ][ ][ ]: Radius
  if (sw[0] && !(sw[1] || sw[2] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      radius = map(pv, 0, 1023, minRadius, maxRadius);
      s.setRadius(radius);
    }
    // println("Radius: "+radius);
  }

//[ ][x][ ][ ]: Number
  if (sw[1] && !(sw[0] || sw[2] || sw[3])) {
    int initNumber = number;
    number = (int) map(pv, 0, 1023, 1, maxShapes);
    if (number != initNumber) {
      for (int i = 0; i < shapes.size(); ++i) {
        shapes.get(i).setArranged(false);
      }
    }

    // find the difference between dialed number and current number
    int difference = number - shapes.size();

    /*  if the dial is higher than the current size, then add a new shape
    |   if the dial is less than current size, remove shapes from the end
    |   if the dial is set to the current size, do nothing
    */
    if (difference > 0) {
      for (int i = 0; i < difference; ++i) {
        float speed = shapes.get(0).getSpeed();
        shapes.add(new Shape(shapeHue, radius, angle, speed, heading, sides, mass, spin, offset));
      }
    } else if (difference < 0) {
      for (int i = 0; i < abs(difference); ++i) {
        shapes.remove(shapes.size() - 1);
      }
    }
    arrangeShapes();
    // println("shapes: "+shapes.size());
  }

//[ ][ ][x][ ]: Angle
  if (sw[2] && !(sw[0] || sw[1] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      angle = map(pv, 0, 1023, 0, TAU);
      // s.spin(0); //stop spin if setting angle
      s.setTheta(angle);
    }
    // println("angle: "+angle);
  }

//[ ][ ][ ][x]: Force Strength
  if (sw[3] && !(sw[0] || sw[1] || sw[2])) {
    strength = map(pv, 0, 1023, 0, maxStrength);
    if (strength == 0) {
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        s.setVelocity(new PVector(0,0));
      }
    }
    // println("strength: "+strength);
  }

//[x][x][ ][ ]: Padding
  if (sw[0] && sw[1] && !(sw[2] || sw[3])) {
    padding = map(pv, 0, 1023, radius, 4*radius);
    // println("padding: "+padding);
  }

//[x][ ][x][ ]: Force Heading
  if (sw[0] && sw[2] && !(sw[1] || sw[3])) {
    heading = map(pv, 0, 1023, 0, TAU);
    // println("heading: "+heading);
  }

//[x][ ][ ][x]: Attraction

//[ ][x][x][ ]: Shape
  if (sw[1] && sw[2] && !(sw[0] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      sides = (int) map(pv, 0, 1023, 0, 10);
      s.setSides(sides);
    }
    // println("sides: "+sides);
  }

//[ ][x][ ][x]: Bounce

//[ ][ ][x][x]: Angular Velocity
  if (sw[2] && sw[3] && !(sw[0] || sw[1])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      spin = map(pv, 0, 1023, 0, maxSpin);
      s.spin(spin);
    }
    // println("spin: "+spin);
  }

//[x][x][x][ ]: Arrangement
  if ( sw[0] && sw[1] && sw[2] && !(sw[3]) ) {
    int initArr = arrangement;
    arrangement = (int) map(pv, 0, 1023, 0, 4);
    if (arrangement != initArr) {
      for (int i = 0; i < shapes.size(); ++i) {
        shapes.get(i).setArranged(false);
      }
    }
    arrangeShapes();
    // println("arrangement: "+arrangement);
  }


//[x][x][ ][x]: Mass
  if ( sw[0] && sw[1] && sw[3] && !(sw[2]) ) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      mass = (int) map(pv, 0, 1023, 1, 100);
      s.setMass(mass);
    }
    // println("mass: "+mass);
  }

//[x][ ][x][x]: Center of Rotation (offset)
  if (sw[0] && sw[2] && sw[3] && !(sw[1])) {
  for (int i = 0; i < shapes.size(); ++i) {
    Shape s = shapes.get(i);
    offset = map(pv, 0, 1023, -radius, radius);
    s.setOffset(offset);
  }
  // println("offset: "+offset);
  }
//[ ][x][x][x]: Walls
//[x][x][x][x]: Order

//run all of the shapes
  for (int i = 0; i < shapes.size(); ++i) {
    Shape s = shapes.get(i);
    s.run();
  }
}