class Shape {
  //Class variables
    PShape s;
    int n; // number of sides
    float r; //radius

    //motion variables
    int m, b; //mass, bounce
    PVector position, velocity, acceleration; //position, velocity, acceleration;
    float dx; //horizontal offset (center of rotation)
    float theta, aVel, aAcc; //angle, angular velocity, angular acceleration;

    int H, S, B, A; //Hue, Saturation, Value, Alpha
    color c;
  //Constructors
  //default constructor (no params)
    Shape() {
      H = 150;
      S = B = A = 90;
      c = color(H,S,B,A);

      r = height/6;

      n = 6;

      m = 1;
      b = 1;

      position = center.get();
      dx = 0;
      velocity = new PVector();
      acceleration = new PVector(0,0);

      theta = aVel = aAcc = 0;
    }
  //constructor (all params)
    Shape(int _H, float _r, float _theta, float _speed, float _heading, int _sides, int _mass, float _spin, float _offset) {
      H = _H;
      S = B = A = 90;

      r = _r;

      n = _sides;

      m = _mass;
      b = 1;

      position = center.get();
      dx = _offset;
      velocity = new PVector(_speed*cos(_heading), _speed*sin(_heading));
      acceleration = new PVector(0,0);

      theta = _theta;
      aVel = _spin;
      aAcc = 0;
    }

  //Main methods
    void run(){
      update();
      checkEdges();
      display();
    }

    void update(){
      c = color(H,S,B,A);

      velocity.add(acceleration);
      velocity.limit(maxSpeed);
      position.add(velocity);
      acceleration.mult(0);

      theta += aVel;
    }

    void checkEdges() {
        if (position.x < 0) {
            position.x = width;
        }
        if (position.y < 0) {
            position.y = height;
        }
        if (position.x > width) {
            position.x = 0;
        }
        if (position.y > height) {
            position.y = 0;
        }
    }

    void applyForce(PVector f) {
      PVector force = PVector.div(f, m);
      acceleration.add(force);
    }

    void spin(float _s) {
      aVel = _s;
    }

    void move(PVector _v) {
      PVector v =_v.get();
      position.add(v);
    }
    void display() {
      pushMatrix();
        translate(position.x, position.y);
        rotate(theta);
        pushStyle();
          drawShape(n, r, c, dx);
        popStyle();
      popMatrix();
    }

  //getters and setters
    public int getHue() {
        return H;
    }

    public void setHue(int newH) {
        H = newH;
    }

    public float getRadius() {
        return r;
    }

    public void setRadius(float newRadius) {
        r = newRadius;
    }

    public int getSides() {
        return n;
    }

    public void setSides(int newSides) {
        n = newSides;
    }

    public int getMass() {
        return m;
    }

    public void setMass(int newMass) {
        m = newMass;
    }

    public int getBounce() {
        return b;
    }

    public void setBounce(int newBounce) {
        b = newBounce;
    }

    public float getTheta() {
        return theta;
    }

    public void setTheta(float newTheta) {
        theta = newTheta;
    }

    public float getAVel() {
        return aVel;
    }

    public void setAVel(float newAVel) {
        aVel = newAVel;
    }

    public float getAAcc() {
        return aAcc;
    }
    public void setAAcc(float newAAcc) {
        aAcc = newAAcc;
    }
    public float getX() {
        return position.x;
    }
    public void setX(float newX) {
        position.x = newX;
    }
    public float getY() {
        return position.y;
    }
    public void setY(float newY) {
        position.y = newY;
    }
    public PVector getPosition() {
        return position;
    }
    public void setPosition(PVector newPosition) {
        position = newPosition.get();
    }
    public void setPosition(float newX, float newY) {
        position.x = newX;
        position.y = newY;
    }
    public PVector getVelocity() {
        return velocity;
    }
    public void setVelocity(PVector newVelocity) {
        velocity = newVelocity.get();
    }
    public void setVelocity(float newX, float newY) {
        velocity.x = newX;
        velocity.y = newY;
    }
    public void setVelocity(String a, float newAngle, float newMagnitude) {
        //the string doesn't actually matter at all.
        //if you have it, then this setter will be used
        float newX = newMagnitude*cos(newAngle);
        float newY = newMagnitude*sin(newAngle);
        velocity.x = newX;
        velocity.y = newY;
    }
    public PVector getAcceleration() {
        return acceleration;
    }
    public void setAcceleration(PVector newAcceleration) {
        acceleration = newAcceleration.get();
    }
    public void setAcceleration(float newX, float newY) {
        acceleration.x = newX;
        acceleration.y = newY;
    }
    public void setAcceleration(String a, float newAngle, float newMagnitude) {
        //the string doesn't actually matter at all.
        //if you have it, then this setter will be used
        float newX = newMagnitude*cos(newAngle);
        float newY = newMagnitude*sin(newAngle);
        acceleration.x = newX;
        acceleration.y = newY;
    }
    public float getOffset() {
        return dx;
    }
    public void setOffset(float newOffset) {
        dx = newOffset;
    }
}