void motionBlur(int c, int amount) {
  // float a = map(amount, 0, 100, 1.0, 0.0);
  int a = amount;
  pushMatrix();
    pushStyle();
      fill(c, a);
      rect(0, 0, width, height);
    popStyle();
  popMatrix();
}