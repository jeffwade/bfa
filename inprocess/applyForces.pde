void applyForces() {
  //Gravity
  for (int i = 0; i < shapes.size(); ++i) {
    Shape s = shapes.get(i);
    int m = s.getMass();
    //if the shape has mass, then apply the force of gravity
    if (m > 1) {
      PVector gravity = new PVector(0,2);
      s.applyForce(gravity);
    } else {
      //no mass => no gravity
    }
  }
  //Variable force
  for (int i = 0; i < shapes.size(); ++i) {
    Shape s = shapes.get(i);
    s.applyForce(new PVector(strength*cos(heading), strength*sin(heading)));
  }
}