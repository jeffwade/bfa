class Icon {
  //properties
  PShape switchIcon, smallIcon, largeIcon;
  boolean showLargeIcon = false;
  boolean rightAlign = false;
  boolean active = false;
  PVector position;
  int w, h, wX, hX, wL, hL;

  //constructor
  Icon(float x, float y, PShape _switch, PShape _small/*, PShape _large*/) {
    position = new PVector (x,y);
    w = 100;
    h = 100;
    wX = 100;
    hX = 100;
    wL = 100;
    hL = 100;

    switchIcon = _switch;
    smallIcon = _small;
    largeIcon = _large;


  }

  //methods
  void display() {
    if (showLargeIcon) {
    }
    shape(switchIcon, position.x, position.y, wS, hS);
    shape(sma, x, y, w, h);
  }

}