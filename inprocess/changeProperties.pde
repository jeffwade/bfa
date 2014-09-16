void changeProperties(boolean[] sw) {
    float initX = shapes.get(0).getX();
    float initY = shapes.get(0).getY();

//[ ][ ][ ][ ]: COLOR
  if (!(sw[0] || sw[1] || sw[2] || sw[3])) {
    // if (pv != initPV) {
      int initHue = shapeHue;
      shapeHue = (int) map(pv, 0, 1023, 0, 360);
      if (shapeHue > 5 + initHue || shapeHue < initHue - 5 && !(randomizer == 17 || randomizer == 1)) {
        for (int i = 0; i < shapes.size(); ++i) {
          Shape s = shapes.get(i);
          s.setHue(shapeHue);
        // }
      }
    // println("Hue: " + shapeHue);
    }
  }

//[x][ ][ ][ ]: SIZE
  if (sw[0] && !(sw[1] || sw[2] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      radius = map(pv, 0, 1023, minRadius, maxRadius);
      s.setRadius(radius);
    }
    // println("Radius: " + radius);
  }

//[ ][x][ ][ ]: SHAPE
  if (sw[1] && !(sw[0] || sw[2] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      sides = (int) map(pv, 0, 1023, 0, maxSides + 2);
      s.setSides(sides);
    }
    // println("sides: " + sides);
  }

//[ ][ ][x][ ]: SPEED
  if (sw[2] && !(sw[0] || sw[1] || sw[3])) {
    strength = map(pv, 0, 1023, 0, maxStrength);
    if (strength == 0) {
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        s.setVelocity(new PVector(0,0));
      }
    }
    // println("strength: " + strength);
  }

//[ ][ ][ ][x]: HEADING
  if (sw[3] && !(sw[0] || sw[1] || sw[2])) {
    heading = map(pv, 0, 1023, 0, TAU);
    // println("heading: " + heading);
  }

//[x][x][ ][ ]: NUMBER
  if (sw[0] && sw[1] && !(sw[2] || sw[3])) {
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
        speed = shapes.get(0).getSpeed();
        Shape s = new Shape(shapeHue, radius, angle, speed, heading, sides, mass, spin, offset);
        if (randomizer > 0) {
          randomize(s, randomizer);
        }
        shapes.add(s);
      }
    } else if (difference < 0) {
      for (int i = 0; i < abs(difference); ++i) {
        shapes.remove(shapes.size() - 1);
      }
    }
    arrangeShapes();
    // println("shapes: " + shapes.size());
  }

//[x][ ][x][ ]: ARRANGEMENT
  if ( sw[0] && sw[2] && !(sw[1] || sw[3]) ) {
    int initArr = arrangement;
    arrangement = (int) map(pv, 0, 1023, 0, 4);
    if (arrangement != initArr) {
      for (int i = 0; i < shapes.size(); ++i) {
        shapes.get(i).setArranged(false);
      }
    }
    arrangeShapes();
    // println("arrangement: " + arrangement);
  }

//[x][ ][ ][x]: PADDING

  if (sw[0] && sw[3] && !(sw[1] || sw[2])) {
    padding = map(pv, 0, 1023, minRadius, 4*maxRadius);
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      s.setArranged(false);
    }
    arrangeShapes();
    // println("padding: " + padding);
  }

//[ ][x][x][ ]: ANGLE
  if (sw[1] && sw[2] && !(sw[0] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      angle = map(pv, 0, 1023, 0, TAU);
      // s.spin(0); //stop spin if setting angle
      s.setTheta(angle);
    }
    // println("angle: " + angle);
  }

//[ ][x][ ][x]: SPIN
  if (sw[1] && sw[3] && !(sw[0] || sw[2])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      spin = map(pv, 0, 1023, -maxSpin, maxSpin);
      s.spin(spin);
    }
    // println("spin: " + spin);
  }

//[ ][ ][x][x]: CENTER
  if (sw[2] && sw[3] && !(sw[0] || sw[1])) {
  for (int i = 0; i < shapes.size(); ++i) {
    Shape s = shapes.get(i);
    offset = map(pv, 0, 1023, -radius, radius);
    s.setOffset(offset);
  }
  // println("offset: " + offset);
  }

//[x][x][x][ ]: ATTRACTION
if (sw[0] && sw[1] && sw[2] && !(sw[3])) {
  for (int i = 0; i < shapes.size(); ++i) {
    Shape s = shapes.get(i);
    attraction = map(pv, 0, 1023, -maxAttract, maxAttract);
    s.setAttraction(attraction);
    // println("attraction: " + attraction);
  }
}

//[x][x][ ][x]: BOUNCE
if (sw[0] && sw[1] && sw[3] && !(sw[2])) {
  for (int i = 0; i < shapes.size(); ++i) {
    Shape s = shapes.get(i);
    bounce = map(pv, 0, 1023, 0, 1);
    s.setBounce(bounce);
    // println("bounce: " + bounce);
  }
}

//[x][ ][x][x]: MASS
  if ( sw[0] && sw[2] && sw[3] && !(sw[1]) ) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      mass = (int) map(pv, 0, 1023, minMass, maxMass);
      s.setMass(mass);
    }
    // println("mass: " + mass);
  }

//[ ][x][x][x]: WALLS
  if ( sw[1] && sw[2] && sw[3] && !(sw[0]) ) {
    walls = (int) map(pv, 0, 1023, 0, 4);
    if (walls > 0) {
      for (int i = 0; i < shapes.size(); ++i) {
        shapes.get(i).setOffset(0);
      }
    }
    // println("walls: " + walls);
  }


//[x][x][x][x]: RANDOM
  if (sw[0] && sw[1] && sw[2] && sw[3]) {
    int initRandomizer = randomizer;
    randomizer = (int) map(pv, 0, 1023, 0, 18);
    if (randomizer != initRandomizer) {
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        randomize(s, randomizer);
      }
    }
  }

}