void loadIcons() {
  for (int i = 0; i < icons.length; ++i) {
    boolean rightAlign = false;
    PShape switchIcon = loadShape("switch-" + i + ".svg");
    PShape smallIcon = loadShape("small-" + i + ".svg");
    PShape largeIcon = loadShape("large-" + i + ".svg");
    if (i > 8) {
      rightAlign = true;
    }
  }
}