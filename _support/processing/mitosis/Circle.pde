class Circle extends Shape {
  float d;
  Circle(float x, float y){
    super(x,y);
    d = this.w;
  }

  void display(){
    pushMatrix();
      translate(this.position.x, this.position.y);
    pushStyle();
      //set fill
      if (filled) { fill(objFill); }
      else{ noFill(); }

      //set stroke
      if (stroked) {stroke(objStroke); }
      else { noStroke(); }    

      ellipse(0, 0, d, d);
    popStyle();
    popMatrix();
  }

   float getD(){
   return this.d; 
  }
}
