void loadIcons() {
  for (int i = 0; i < icons.length; ++i) {
    boolean rightAlign = false;
    PShape switchIcon = loadShape("svg/switchIcons-" + i + ".svg");
    PShape smallIcon = loadShape("svg/smallIcons-" + i + ".svg");
    // PShape largeIcon = loadShape("svg/largeIcons-" + i + ".svg");

    //draw switch keys and property icons
    if (i > 7) {
      icons[i] = new Icon(width - 75, 150 + 100*(i%8), switchIcon, smallIcon);
      icons[i].setRightAlign(true);
    } else {
      icons[i] = new Icon(30, 150 + 100*i, switchIcon, smallIcon);
    }

    //correct dimensions
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

    //load labels
    String label = "unset";
    switch (i) {
      case 0 :
        label = "color";
      break;
      case 1 :
        label = "radius";
      break;
      case 2 :
        label = "shape";
      break;
      case 3 :
        label = "force";
      break;
      case 4 :
        label = "heading";
      break;
      case 5 :
        label = "number";
      break;
      case 6 :
        label = "arrangement";
      break;
      case 7 :
        label = "spacing";
      break;
      case 8 :
        label = "angle";
      break;
      case 9 :
        label = "spin";
      break;
      case 10 :
        label = "offset";
      break;
      case 11 :
        label = "attraction";
      break;
      case 12 :
        label = "bounce";
      break;
      case 13 :
        label = "mass";
      break;
      case 14 :
        label = "walls";
      break;
      case 15 :
        label = "random";
      break;
    }
    label = label.toUpperCase();
    icons[i].setLabel(label);

  }
}