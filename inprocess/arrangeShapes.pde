void arrangeShapes() {
  Shape first = shapes.get(0);
  float _x = 0.0f;
  float _y = 0.0f;
  float marginX, marginY;
  if (walls == NONE) {
    marginX = marginY = 0f;
  } else if (walls == TB) {
    marginX = 0f;
    marginY = (wallThickness + radius + 10);
  } else if (walls == LR) {
    marginX = (wallThickness + radius + 10);
    marginY = 0f;
  } else {
    marginX = (wallThickness + radius +10);
    marginY = (wallThickness + radius +10);
  }

  switch (arrangement) {
    case NONE :
      // set randomly
        for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        if (!s.isArranged()) {
          s.setX(random(marginX, width - marginX));
          s.setY(random(marginY, height - marginY));
          s.setArranged(true);
        }
      }
    break;
    case LINE :
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        if (!s.isArranged()) {
          _x = first.getX() + padding*i*cos(heading - PI);
          _y = first.getY() + padding*i*sin(heading - PI);
          if (_x <= 0) {
            s.setX(width + _x);
          } else if (width + _x <= 0) {
            println("_x: "+_x);
            s.setX(2*width + _x);
          } else {
            s.setX(_x%width);
          }
          if (_y < 0) {
            s.setY(height + _y);
          } else {
            s.setY(_y%height);
          }
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
            _x = (first.getX() + padding*i)%width;
            constrain(_x, marginX, width - marginX);
            s.setX(_x);

            _y = (first.getY() + padding*j)%height;
            constrain(_y, marginY, height-marginY);
            s.setY(_y);
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