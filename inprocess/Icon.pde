class Icon {
  //properties
  PShape switchIcon, smallIcon, largeIcon;
  boolean showLargeIcon = false;
  boolean rightAlign = false;
  boolean active = false;
  PVector position;
  int w, h, wL, hL;

  //constructor
  Icon(float x, float y, PShape _switch, PShape _small, PShape _large) {
    position = new PVector (x,y);
    w = 75;
    h = 75;

    switchIcon = _switch;
    smallIcon = _small;
    largeIcon = _large;


  }

  //methods
  void display() {
    if (showLarge) {
      shape(large, center.x, center.y, wL, hL);
    }
    shape(off, position.x, position.y, w, h);
  }

}