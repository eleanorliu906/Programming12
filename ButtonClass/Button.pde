class Button {
  int x, y, w, h; // x, y is the center of the button
  boolean clicked;
  color highlight, normal;
  String text;
  PImage img;

  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    normal = norm;
    highlight = high;
    text = t;
    clicked = false;
  }

  Button(PImage _img, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    normal = norm;
    highlight = high;
    img = _img;
    clicked = false;
  }


  void show() {
    drawRect();
    drawLabel();
  }

  void act() {
    checkForClicks();
  }

  boolean isTouching() {
    if (mouseX > x - 0.5*w && mouseX < x + 0.5*w && mouseY > y - 0.5*h && mouseY < y + 0.5*h) return true;
    else return false;
  }

  void drawRect() {
    stroke(0);
    strokeWeight(4);
    rectMode(CENTER);
    if (isTouching()) fill(normal);
    else fill(highlight);
    rect(x, y, w, h, 30);
  }

  void drawLabel() {
    textAlign(CENTER, CENTER);
    if (isTouching()) fill(highlight);
    else fill(normal);
    textSize(w/4);
    text(text, x, y);
  }

  void checkForClicks() {
    if (mouseReleased && isTouching()) clicked = true;
    else clicked = false;

    if (clicked) {
      currBackground = normal;
    }
  }
}
