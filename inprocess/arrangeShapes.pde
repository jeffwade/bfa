void arrangeShapes() {
  Shape first = shapes.get(0);
  float _x = 0.0f;
  float _y = 0.0f;

  switch (arrangement) {
    case NONE :
      // set randomly
        for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        if (!s.isArranged()) {
          s.setX(random(width));
          s.setY(random(height));
          s.setArranged(true);
        }
      }
    break;
    case LINE :
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        if (!s.isArranged()) {
          _x = first.getX() + padding*i*cos(heading - PI);
          constrain(_x, wallThickness, width - wallThickness);
          _y = first.getY() + padding*i*sin(heading - PI);
          constrain(_y, wallThickness, height - wallThickness);
          s.setX(_x%width);
          s.setY(_y%height);
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
          if (!s.isArranged()) {

            s.setX((first.getX() + padding*i)%width);
            s.setY((first.getY() + padding*j)%height);
          }
        }
      }
    break;
    case RADIAL :
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        if (!s.isArranged()) {
          //set in circle; first shape is at 0 degrees along radius
          s.setX(((first.getX() - padding) + padding*cos(i*TAU/shapes.size()))%width);
          s.setY(((first.getY()) + padding*sin(i*TAU/shapes.size()))%height);
          s.setArranged(true);
        }
      }
    break;
  }

}