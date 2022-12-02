class Button {
  int x, y, w, h; // x, y is the center of the button
  boolean clicked;
  color highlight, normal;
  String text;

  Button(String t, int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    normal = lavender;
    highlight = lilac;
    text = t;
    clicked = false;
  }


  void show() {
    drawRect();
    drawLabel();
  }

  void act() {
    checkForClicks();
  }

  boolean touchingMouse() {
    // println("m");
    if (mouseX > x - 0.5*w && mouseX < x + 0.5*w && mouseY > y - 0.5*h && mouseY < y + 0.5*h) return true;
    else return false;
  }

  void drawRect() {
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    if (touchingMouse()) fill(highlight);
    else fill(normal);
    rect(x, y, w, h, 30);
  }

  void drawLabel() {
    textAlign(CENTER, CENTER);
    if (touchingMouse()) fill(normal);
    else fill(highlight);

    textSize(w/4);
    text(text, x, y);
  }

  void checkForClicks() {
    if (mouseReleased && touchingMouse()) clicked = true;
    else clicked = false;
  }
}
