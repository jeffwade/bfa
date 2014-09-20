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

    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 0) {
          icons[i].setFill(highlight);
        } else {
          icons[i].setFill(grey);
        }
      }
    }
  }

//[x][ ][ ][ ]: SIZE
  if (sw[0] && !(sw[1] || sw[2] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      radius = map(pv, 0, 1023, minRadius, maxRadius);
      s.setRadius(radius);
    }
    // println("Radius: " + radius + "(" + maxRadius + ")");
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 1) {
          icons[i].setFill(highlight);
        } else if (i == 7) {
          icons[i].setFill(secondary);
        }
        else {
          icons[i].setFill(grey);
        }
      }
  }

//[ ][x][ ][ ]: SHAPE
  if (sw[1] && !(sw[0] || sw[2] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      sides = (int) map(pv, 0, 1023, 2, maxSides+1);
      s.setSides(sides);
    }
    // println("sides: " + sides);
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 2) {
          icons[i].setFill(highlight);
        } else {
          icons[i].setFill(grey);
        }
      }
  }

//[ ][ ][x][ ]: FORCE
  if (sw[2] && !(sw[0] || sw[1] || sw[3])) {
    strength = map(pv, 0, 1023, 0, maxStrength);
    if (strength == 0) {
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        s.setVelocity(new PVector(0,0));
      }
    }
    // println("strength: " + strength);
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 3) {
          icons[i].setFill(highlight);
        } else {
          icons[i].setFill(grey);
        }
      }
  }

//[ ][ ][ ][x]: HEADING
  if (sw[3] && !(sw[0] || sw[1] || sw[2])) {
    heading = map(pv, 0, 1023, 0, TAU);
    // println("heading: " + heading*(180/PI));
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 4) {
          icons[i].setFill(highlight);
        } else {
          icons[i].setFill(grey);
        }
      }

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
        heading = shapes.get(0).getHeading();
        PVector _pos = shapes.get(0).getPosition();
        // angle = shapes.get(0).getTheta();
        // Shape(int _hue, float _radius,  int _sides, float _speed, float _heading, float _theta, float _spin, float _offset, float _attraction, float _bounce, int _mass)
        Shape s = new Shape(_pos, shapeHue, radius, sides, speed, heading, angle, spin, offset, attraction, bounce, mass);
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
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 5) {
          icons[i].setFill(highlight);
        } else {
          icons[i].setFill(grey);
        }
      }

  }

//[x][ ][x][ ]: ARRANGEMENT
  if ( sw[0] && sw[2] && !(sw[1] || sw[3]) ) {
    attraction = 0f;
    int initArr = arrangement;
    arrangement = (int) map(pv, 0, 1023, 0, 3.9);
    if (arrangement != initArr) {
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        s.setArranged(false);
        if (attraction != 0) {
          s.setAttraction(0);
          s.setVelocity("a", speed, angle);
        }
      }
    }
    arrangeShapes();
    // println("arrangement: " + arrangement);
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 6) {
          icons[i].setFill(highlight);
        } else if (i == 11) {
          icons[i].setFill(secondary);
        } else {
          icons[i].setFill(grey);
        }
      }
  }

//[x][ ][ ][x]: PADDING

  if (sw[0] && sw[3] && !(sw[1] || sw[2])) {
    padding = map(pv, 0, 1023, minRadius, 4*maxRadius);
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      s.setArranged(false);
      if (attraction != 0) {
        s.setAttraction(0);
        s.setVelocity("a", speed, angle);
      }
    }
    arrangeShapes();
    // println("padding: " + padding);
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 7) {
          icons[i].setFill(highlight);
        } else if (i == 11) {
          icons[i].setFill(secondary);
        } else {
          icons[i].setFill(grey);
        }
      }
  }

//[ ][x][x][ ]: ANGLE
  if (sw[1] && sw[2] && !(sw[0] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      angle = map(pv, 0, 1023, 0, TAU);
      // s.spin(0); //stop spin if setting angle
      s.setTheta(angle);
      spin = 0;
      s.setSpin(0);
    }
    // println("angle: " + angle);
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 8) {
          icons[i].setFill(highlight);
        } else if (i == 9) {
          icons[i].setFill(secondary);
        }
        else {
          icons[i].setFill(grey);
        }
      }
  }

//[ ][x][ ][x]: SPIN
  if (sw[1] && sw[3] && !(sw[0] || sw[2])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      spin = map(pv, 0, 1023, -maxSpin, maxSpin);
      s.spin(spin);
    }
    // println("spin: " + spin);
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 9) {
          icons[i].setFill(highlight);
        } else {
          icons[i].setFill(grey);
        }
      }
  }

//[ ][ ][x][x]: CENTER
  if (sw[2] && sw[3] && !(sw[0] || sw[1])) {
  for (int i = 0; i < shapes.size(); ++i) {
    Shape s = shapes.get(i);
    offset = map(pv, 0, 1023, -radius, radius);
    s.setOffset(offset);
  }
  // println("offset: " + offset);
      // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 10) {
          icons[i].setFill(highlight);
        } else {
          icons[i].setFill(grey);
        }
      }
}

//[x][x][x][ ]: ATTRACTION
if (sw[0] && sw[1] && sw[2] && !(sw[3])) {
  for (int i = 0; i < shapes.size(); ++i) {
    Shape s = shapes.get(i);
    attraction = map(pv, 0, 1023, minAttract, maxAttract);
    s.setAttraction(attraction);
  }
    // println("attraction: " + attraction);
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 11) {
          icons[i].setFill(highlight);
        } else if (i == 3 || i == 4) {
          icons[i].setFill(secondary);
        } else {
          icons[i].setFill(grey);
        }
      }
}

//[x][x][ ][x]: BOUNCE
if (sw[0] && sw[1] && sw[3] && !(sw[2])) {
  for (int i = 0; i < shapes.size(); ++i) {
    Shape s = shapes.get(i);
    bounce = map(pv, 0, 1023, minBounce, maxBounce);
    s.setBounce(bounce);
  }
    // println("bounce: " + bounce);
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 12) {
          icons[i].setFill(highlight);
        } else {
          icons[i].setFill(grey);
        }
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
        // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 13) {
          icons[i].setFill(highlight);
        } else if (i == 3 || i == 11 || i == 12) {
          icons[i].setFill(secondary);
        } else {
          icons[i].setFill(grey);
        }
      }

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
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 14) {
          icons[i].setFill(highlight);
        } else {
          icons[i].setFill(grey);
        }
      }

  }


//[x][x][x][x]: RANDOM
  if (sw[0] && sw[1] && sw[2] && sw[3]) {
    int initRandomizer = randomizer;
    randomizer = (int) map(pv, 0, 1023, 0, 6);
    if (randomizer != initRandomizer) {
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        randomize(s, randomizer);
      }
    }
    // println("randomizer: "+randomizer);
    // println("bounce: " + bounce);
    // set property value highlighting
      for (int i = 0; i < icons.length; ++i) {
        if (i == 15) {
          icons[i].setFill(highlight);
        } else {
          icons[i].setFill(grey);
        }
      }

  }

}