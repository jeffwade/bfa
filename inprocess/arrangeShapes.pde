void arrangeShapes() {
  Shape first = shapes.get(0);

  switch (arrangement) {
    case NONE :
      //if shapes are arranged, then set randomly
      //new shapes should be added at center
      if (arranged) {
        for (int i = 0; i < shapes.size(); ++i) {
          Shape s = shapes.get(i);
          s.setX(random(width));
          s.setY(random(height));
          s.setArranged(false);
        }
      }
    break;
    case LINE :
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        if (!s.isArranged()) {
          s.setX(first.getX() + padding*i*cos(heading - PI));
          s.setY(first.getY() + padding*i*sin(heading - PI));
          s.setArranged(true);
        }
      }

    break;
    case GRID :
      int rows = floor(sqrt(number)); //number of rows changes at squares
      int columns = ceil(number / rows);
      int currentShape = 0;
      for (int i = 0; i < columns; ++i) {
        for (int j = 0; j < rows; ++j) {
          Shape s = shapes.get(i*rows+j);
          s.setX(first.getX() + padding*i);
          s.setY(first.getY() + padding*j);
        }
      }
    break;
    case RADIAL :
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        if (!s.isArranged()) {
          //set in circle; first shape is at 0 degrees along radius
          s.setX((first.getX() - padding) + padding*cos(i*TAU/shapes.size()));
          s.setY((first.getY()) + padding*sin(i*TAU/shapes.size()));
          s.setArranged(true);
        }
      }
    break;

    case RANDOM :
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        if (!s.isArranged()) {
          s.setX(random(width));
          s.setY(random(height));
          s.setArranged(true);
        }
      }
    break;
  }

}