class Shape {
  PShape s;
  int sides; // number of sides
  float r, d; //radius; diameter

  //motion variables
  float m; //mass
  PVector loc, vel, acc; //location, velocity, acceleration;
  float theta, aVel, aAcc; //angle, angular velocity, angular acceleration;

  int H, S, B, A; //Hue, Saturation, Value, Alpha

  Shape() {
    H = 150;
    S = B = A = 90;

    r = 200;
    d = 2*r;
    m = 50;

    sides = 6;

    loc = center.get();
    vel = new PVector();
    acc = new PVector();

    theta = aVel = aAcc = 0;
  }

  Shape(int _H, float _radius) {
    H = _H;
    S = B = 100;
    A = 90;

    r = _radius;
    d = 2*r;

    // sides = _sides;

  }

void run(){
  update();
  display();
}

void update(){

}

void display() {
  pushMatrix();
    pushStyle();
      fill(H, S, B, A);
      noStroke();
      ellipse(0, 0, d, d);
    popStyle();
  popMatrix();
}

}