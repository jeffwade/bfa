void randomize(Shape _s, int property) {

  switch (property) {
    case 0 : //RESET ALL
        //preset values for all properties
        _s.setHue(shapeHue);
        _s.setRadius(radius);
        _s.setShape(sides);
        _s.setVelocity(speed, heading);
        _s.setTheta(angle);
        _s.spin(spin);
        _s.setOffset(offset);
        _s.setAttraction(attraction);

        // _s.setBounce(bounce);

        _s.setRandomized(false);

        //set property value text fill
        for (int i = 0; i < icons.length; ++i) {
            icons[i].setFill(grey);
        }
    break;
    case 1 : //APPEARANCE (color, size, shape)
        _s.setRandomized(false);
        if (!(_s.isRandomized())) {
        //random values for color, radius, and shape
            _s.setHue((int) random(360));
            _s.setRadius(random(minRadius,maxRadius));
            _s.setShape((int) random(2,maxSides));

        //preset values for movement, set, physics
            _s.setVelocity(speed, heading);
            _s.setTheta(angle);
            _s.spin(spin);
            _s.setOffset(offset);
            _s.setAttraction(attraction);
            // _s.setBounce(bounce);

        _s.setRandomized(true);
        }
    break;
    case 2 : //MOVEMENT (speed, heading, angle, spin, center)
        _s.setRandomized(false);
        if (!(_s.isRandomized())) {
        //random values for speed, heading, angle, spin, center offset
            _s.setSpeed(random(maxSpeed));
            _s.setHeading(random(TAU));
            _s.setTheta(random(TAU));
            _s.spin(random(-maxSpin, maxSpin));
            _s.setOffset(random(-maxRadius, maxRadius));

        //preset values for appearance, set, physics
            _s.setHue(shapeHue);
            _s.setRadius(radius);
            _s.setShape(sides);
            _s.setAttraction(attraction);
            // _s.setBounce(bounce);

        _s.setRandomized(true);
        }
    break;
    case 3 : //SET (number, arrangement, padding)
        _s.setRandomized(false);

        _s.setRandomized(true);

    break;
    case 4 : //PHYSICS (attraction, bounce, mass, walls)
        _s.setRandomized(false);
        if (!(_s.isRandomized())) {
        //random values for attraction, bounce, mass, walls
            _s.setAttraction(random(-maxAttract, maxAttract));

        //preset values for appearance, movement, set
            _s.setOffset(offset);
            _s.setHue(shapeHue);
            _s.setRadius(radius);
            _s.setShape(sides);
            _s.setVelocity(speed, heading);
            _s.setTheta(angle);
            _s.spin(spin);

        _s.setRandomized(true);
        }
    break;
    case 5 : //EVERYTHING
        _s.setRandomized(false);
        _s.setHue((int) random(360));
        _s.setRadius(random(minRadius, maxRadius));
        _s.setShape((int) random(2,maxSides));
        _s.setVelocity(random(maxSpeed), random(TAU));
        _s.setTheta(random(TAU));
        _s.spin(random(maxSpin));
        _s.setOffset(random(-maxRadius, maxRadius));
        _s.setMass((int) random(minMass, maxMass));
        _s.setAttraction(random(-maxAttract, maxAttract));
        // _s.setBounce(bounce);

        _s.setRandomized(true);
    break;
  }
}