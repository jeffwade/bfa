class Shape {
  //Class variables
    PShape s;
    int n; // number of sides
    float r; //radius

    //motion variables
    int m, b; //mass, bounce
    PVector position, velocity, acceleration; //position, velocity, acceleration;
    float theta, aVel, aAcc; //angle, angular velocity, angular acceleration;

    int H, S, B, A; //Hue, Saturation, Value, Alpha
    color c;
  //Constructors
    //default constructor
    Shape() {
      H = 150;
      S = B = A = 90;
      c = color(H,S,B,A);

      r = 200.0;

      n = 6;

      m = 50;
      b = 1;

      position = center.get();
      velocity = new PVector();
      acceleration = new PVector();

      theta = aVel = aAcc = 0;
    }

    Shape(int _H, float _r) {
      H = _H;
      S = B = A = 90;

      r = _r;

      n = 6;

      m = 50;
      b = 1;

      position = center.get();
      velocity = new PVector();
      acceleration = new PVector();

      theta = aVel = aAcc = 0;
    }

  //Main methods
    void run(){
      update();
      display();
    }

    void update(){
      c = color(H,S,B,A);
    }

    void display() {
      pushMatrix();
        translate(position.x, position.y);
        rotate(theta);
        pushStyle();
          drawShape(n, r, c);
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

    public int getM() {
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
    public void setX(float newY) {
        position.x = newY;
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
}