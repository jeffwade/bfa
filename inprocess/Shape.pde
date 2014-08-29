class Shape {
  PShape s;
  int sides; // number of sides
  float r, d; //radius; diameter

  //motion variables
  int m, b; //mass, bounce
  PVector loc, vel, acc; //location, velocity, acceleration;
  float theta, aVel, aAcc; //angle, angular velocity, angular acceleration;

  int H, S, B, A; //Hue, Saturation, Value, Alpha

  Shape() {
    H = 150;
    S = B = A = 90;

    r = 200;
    d = 2*r;

    sides = 6;

    m = 50;
    b = 1;

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
    translate(loc.x, loc.y);
    pushStyle();
      fill(H, S, B, A);
      noStroke();
      ellipse(0, 0, d, d);
    popStyle();
  popMatrix();
}

public int getHue() {
    return H;
}

public void setHue(int newH) {
    H = newH;
}
}