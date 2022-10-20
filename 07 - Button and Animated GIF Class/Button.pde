class Button {
  int x, y, w, h; // x, y is the center of the button
  boolean clicked;
  color highlight, normal;
  String text;
  PImage img;
  int mode;
  final static int TXT = 1;
  final static int IMG = 2; // only accessible in Button (self contained), and it only has one copy

  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    normal = norm;
    highlight = high;
    text = t;
    clicked = false;
    mode = TXT;
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
    mode = IMG;
  }


  void show() {
    if (mode == TXT) {
      drawRect();
      drawLabel();
    } else if (mode == IMG) {
      drawRect();
      drawImg();
    }
  }

  void act() {
    checkForClicks();
  }

  boolean touchingMouse() {
    if (mouseX > x - 0.5*w && mouseX < x + 0.5*w && mouseY > y - 0.5*h && mouseY < y + 0.5*h) return true;
    else return false;
  }

  void drawRect() {
    stroke(0);
    strokeWeight(4);
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

    if (clicked) {
      currBackground = normal;
    }
  }

  void drawImg() {
    imageMode(CENTER);
    image(img, x, y, 0.8*w, 0.8*h);
  }
}
