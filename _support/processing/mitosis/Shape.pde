class Shape {
    PVector position, velocity, acceleration;
    float w, h, m; //width, height, mass  
    boolean stroked, filled;
    color objFill, objStroke;

    Shape(float x, float y) {
        position = new PVector(x, y);
        velocity = new PVector();
        acceleration = new PVector();
        w = 25;
        h = 25;
        m = 1;
        
        filled = true;
        stroked = false;

        objFill = black;
        objStroke = black;
    }

    void run() {
        update();
        display();
    }

    void update(){
        velocity.add(acceleration);
        position.add(velocity);
        acceleration.mult(0);
    }

    void display(){
        pushMatrix();
          translate(position.x, position.y);
        pushStyle();
          //set fill
          if (filled) { fill(objFill); }
          else{ noFill(); }

          //set stroke
          if (stroked) {stroke(objStroke); }
          else { noStroke(); }

          //draw rectangles from center point
          rectMode(CENTER);

          //rectangle is default shape
            rect(0, 0, width, height);


        popStyle();
        popMatrix();
    }

    void applyForce(PVector f){
      PVector force = f.get();
      this.acceleration.add(force);
    }
    
    boolean mouseOver() {
      boolean mouseOver = false;
      int hitAreaOffset = 5;
      PVector mouse = new PVector(mouseX, mouseY);
      PVector distance = position.get();
      distance.sub(mouse);
      if (distance.mag() < (w / 2) + hitAreaOffset) { //d is diameter of circle
        mouseOver = true;
      }
    return mouseOver;
  }
  
  float getX(){
   return this.position.x; 
  }
  
  float getY(){
   return this.position.y; 
  }
  
}


