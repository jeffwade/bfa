void changeProperties(boolean[] sw) {
    if (!(sw[0] || sw[1] || sw[2] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      s.setHue( (int) map(pv, 0, 1023, 0, 360) );
      s.run();
    }
  }

  if (sw[0] && !(sw[1] || sw[2] || sw[3])) {
    for (int i = 0; i < shapes.size(); ++i) {
      Shape s = shapes.get(i);
      s.setRadius( map(pv, 0, 1023, 25.0, 150.0) );
      s.run();
    }
  }

}