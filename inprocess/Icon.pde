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
    w = 25;
    h = 25;
    wX = 45;
    hX = 10;
    // wL = 100;
    // hL = 100;

    switchIcon = _switch;
    smallIcon = _small;
    // largeIcon = _large;


  }

  //methods
  void display() {
    if (showLargeIcon) {
    }
    shape(switchIcon, position.x, position.y, wX, hX);
    if (rightAlign) {
      shape(smallIcon, position.x - 53, position.y - 20, w, h);
    } else {
      shape(smallIcon, position.x + 53, position.y - 20, w, h);
    }
  }

  public void setWidth(int newW) {
      w = newW;
  }
  public void setHeight(int newH) {
      h = newH;
  }
  public void setRightAlign(boolean newRightAlign) {
      rightAlign = newRightAlign;
  }

}