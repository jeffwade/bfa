import java.util.*; //util library needed to iterate on ArrayLists


ArrayList<Circle> cells, tempCells;
color white, black, red;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  white = color(0, 0, 100, 100);
  black = color(0, 0, 0, 100);
  red = color(0, 100, 100, 100);
  noStroke();
  cells = new ArrayList<Circle>();
  tempCells = new ArrayList<Circle>();
  Circle protocell = new Circle(width/2, height/2);
  cells.add(protocell);
}

void draw() {
  pushStyle();
  fill(white, 25);
  rect(0, 0, width, height);
  popStyle();
  Iterator temp = tempCells.iterator();
  while (temp.hasNext ()) {
    Circle c = (Circle) temp.next();
    cells.add(c);
  }
  tempCells.clear();
  Iterator it = cells.iterator();
  while (it.hasNext ()) {
    Circle c = (Circle) it.next();
    c.run();
  }
}

void mousePressed() {
  float offsetX, offsetY;
  offsetX = offsetY = 25;
  Iterator it = cells.iterator();
  while (it.hasNext ()) {
    Circle a = (Circle) it.next();
    if (a.mouseOver()) {
      Circle newCell = new Circle(a.getX()+offsetX, a.getY()+offsetY);
      tempCells.add(newCell);
    }
  }
  println("temp" + tempCells);
  println("array" + cells);
}

