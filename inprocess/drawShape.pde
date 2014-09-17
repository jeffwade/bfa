void drawShape(int n, float r, color c, float dx){
  switch (n) {
    case 2 : //LINE
      noFill();
      stroke(c);
      strokeWeight(random(1, 3));
      line(-r + dx, 0, r + dx, 0);
    break;
    case 3 :
      fill(c);
      triangle(r+dx, 0, dx+r*cos(TAU/3), r*sin(TAU/3), dx+r*cos(2*TAU/3), r*sin(2*TAU/3) );
    break;
    case 4 :
      fill(c);
      rectMode(RADIUS);
      pushMatrix();
      rotate(PI/4);
      rect(dx, 0, (pow(2,0.5)/2)*r, (pow(2,0.5)/2)*r);

      popMatrix();
    break;
    case 5 :
      fill(c);
      shape(penta, dx, 0f, 1.809017*r, 1.809017*r);
    break;
    case 6 :
      fill(c);
      shape(hexa, dx, 0f, 2*r, pow(3, 0.5)*r);
    break;
    case 7 :
      fill(c);
      shape(septa, dx, 0f, 2*r, 2*r);
    break;
    case 8 :
      fill(c);
      shape(octa, dx, 0f, 2*r, 2*r);
    break;
    case 9 :
      fill(c);
      shape(nona, dx, 0f, 2*r, 2*r);
    break;
    case 10 :
      fill(c);
      ellipse(dx, 0f, 2*r, 2*r);
    break;
  }
}