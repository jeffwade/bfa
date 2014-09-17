void loadIcons() {
  for (int i = 0; i < icons.length; ++i) {
    boolean rightAlign = false;
    PShape switchIcon = loadShape("svg/switchIcons-" + i + ".svg");
    PShape smallIcon = loadShape("svg/smallIcons-" + i + ".svg");
    // PShape largeIcon = loadShape("svg/large-" + i + ".svg");
    if (i > 7) {
      icons[i] = new Icon(width - 75, 150 + 100*(i%8), switchIcon, smallIcon);
      icons[i].setRightAlign(true);
    } else {
      icons[i] = new Icon(30, 150 + 100*i, switchIcon, smallIcon);
    }
    switch (i) {
      case 3 :
      case 7 :
      case 11 :
      case 15 :
        icons[i].setWidth(35);
        icons[i].setHeight(17);
      break;
      case 13 :
        icons[i].setWidth(17);
        icons[i].setHeight(35);
      break;

    }
  }
}