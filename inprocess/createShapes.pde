void createShapes() {
  //PENTAGON
  penta = createShape();
  penta.beginShape();
  penta.vertex(1,0);
  penta.vertex(cos(TAU/5), sin(TAU/5));
  penta.vertex(cos(2*TAU/5), sin(2*TAU/5));
  penta.vertex(cos(3*TAU/5), sin(3*TAU/5));
  penta.vertex(cos(4*TAU/5), sin(4*TAU/5));
  penta.endShape(CLOSE);
  penta.disableStyle();

  //HEXAGON
  hexa = createShape();
  hexa.beginShape();
  hexa.vertex(1,0);
  hexa.vertex(cos(TAU/6), sin(TAU/6));
  hexa.vertex(cos(2*TAU/6), sin(2*TAU/6));
  hexa.vertex(cos(3*TAU/6), sin(3*TAU/6));
  hexa.vertex(cos(4*TAU/6), sin(4*TAU/6));
  hexa.vertex(cos(5*TAU/6), sin(5*TAU/6));
  hexa.endShape(CLOSE);
  hexa.disableStyle();

  //SEPTAGON
  septa = createShape();
  septa.beginShape();
  septa.vertex(1,0);
  septa.vertex(cos(TAU/7), sin(TAU/7));
  septa.vertex(cos(2*TAU/7), sin(2*TAU/7));
  septa.vertex(cos(3*TAU/7), sin(3*TAU/7));
  septa.vertex(cos(4*TAU/7), sin(4*TAU/7));
  septa.vertex(cos(5*TAU/7), sin(5*TAU/7));
  septa.vertex(cos(6*TAU/7), sin(6*TAU/7));
  septa.endShape(CLOSE);
  septa.disableStyle();

  //OCTAGON
  octa = createShape();
  octa.beginShape();
  octa.vertex(1,0);
  octa.vertex(cos(TAU/8), sin(TAU/8));
  octa.vertex(cos(2*TAU/8), sin(2*TAU/8));
  octa.vertex(cos(3*TAU/8), sin(3*TAU/8));
  octa.vertex(cos(4*TAU/8), sin(4*TAU/8));
  octa.vertex(cos(5*TAU/8), sin(5*TAU/8));
  octa.vertex(cos(6*TAU/8), sin(6*TAU/8));
  octa.vertex(cos(7*TAU/8), sin(7*TAU/8));
  octa.endShape(CLOSE);
  octa.disableStyle();

  //NONAGON
  nona = createShape();
  nona.beginShape();
  nona.vertex(1,0);
  nona.vertex(cos(TAU/9), sin(TAU/9));
  nona.vertex(cos(2*TAU/9), sin(2*TAU/9));
  nona.vertex(cos(3*TAU/9), sin(3*TAU/9));
  nona.vertex(cos(4*TAU/9), sin(4*TAU/9));
  nona.vertex(cos(5*TAU/9), sin(5*TAU/9));
  nona.vertex(cos(6*TAU/9), sin(6*TAU/9));
  nona.vertex(cos(7*TAU/9), sin(7*TAU/9));
  nona.vertex(cos(8*TAU/9), sin(8*TAU/9));
  nona.endShape(CLOSE);
  nona.disableStyle();
}