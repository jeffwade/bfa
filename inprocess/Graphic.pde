class Graphic {
  //properties
  PShape on, off, large;
  String onSource, offSource, largeSource;
  boolean showLarge = false;
  boolean rightAlign = false;
  PVector position;
  int w, h, wL, hL;

  //constructor
  Graphic(float x, float y, String _onSource, String _offSource, String _largeSource) {
    position = new PVector (x,y);

    onSource = _onSource;
    offSource = _offSource;
    largeSource = _largeSource;

    on = loadShape(onSource);
    off = loadShape(offSource);
    large = loadShape(largeSource);

    w = 75;
    h = 75;
  }

  //methods
  void display() {
    if (showLarge) {
      shape(large, center.x, center.y, wL, hL);
    }
    shape(off, position.x, position.y, w, h);
  }

}