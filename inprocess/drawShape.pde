void drawShape(int n, float r, color c, float dx){
  if (n < 3) {
    noFill();
    stroke(c);
    strokeWeight(random(1, 3));
    line(-r + dx, 0, r + dx, 0);
  } else if (n >= 3 && n < maxSides) {
    fill(c);
    PShape s = createShape();
    s.beginShape();
    for (int i = 0; i < n; i++) {
      s.vertex(r*cos(i*TAU/n), r*sin(i*TAU/n));
    }
    s.endShape(CLOSE);
    shape(s, dx, 0);
  } else { //n == maxSides
    fill(c);
    ellipse(dx, 0, 2*r, 2*r);
  }
}