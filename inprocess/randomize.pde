void randomize(Shape s, int property) {
  switch (property) {
    case 0 :
      for (int i = 0; i < shapes.size(); ++i) {
        Shape s = shapes.get(i);
        s.setRadius(radius);
        s.setShape(sides);
      }
    break;
  }
}