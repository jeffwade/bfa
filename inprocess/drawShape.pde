void drawShape(int n, float r, color c, float dx){
  if (n < 3) {
    noFill();
    stroke(c);
    strokeWeight(random(1, 3));
    line(-r + dx, 0, r, 0);
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




      // PShape s = createShape();
      // if (sides < 2) {
      //   s.beginShape(POINTS);
      //   s.noFill();
      //   s.stroke(H, S, V, A);
      //   s.strokeWeight(2);
      //   // println("r: "+r);
      //   s.vertex(0, 0);
      //   s.endShape();
      // } else if (sides == 2) {
      // s.beginShape(LINES);
      //   s.noFill();
      //   s.stroke(H, S, V, A);
      //   s.strokeWeight(2);
      //   // println("r: "+r);
      //   s.vertex(-r, 0);
      //   s.vertex(r, 0);
      //   s.endShape();
      // } else {
      //   s.beginShape();
      //   // if (sides >= 24) {
      //   //    sides = 100;
      //   //  }
      //   s.fill(H,S,V,A);
      //   s.noStroke();
      //   for (int i = 0; i < sides; i++) {
      //     s.vertex(r*cos(i*TAU/sides), r*sin(i*TAU/sides));
      //   }
      //    s.endShape(CLOSE);
      // }
}