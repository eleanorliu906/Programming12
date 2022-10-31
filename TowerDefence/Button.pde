class Button {
  float x, y, w, h, imgw, imgh; // x, y is the center of the button
  float roundedRect;
  boolean clicked;
  color buttonColor, textColor;
  String text;
  PImage img;
  int mode;
  final static int TXT = 1;
  final static int IMG = 2; // only accessible in Button (self contained), and it only has one copy

  Button(float _x, float _y, float _w, float _h, color c1, color c2) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    buttonColor = c1;
    textColor = c2;
    clicked = false;
    roundedRect = 30;
  }

  Button(String t, float _x, float _y, float _w, float _h, color c1, color c2) {
    this(_x, _y, _w, _h, c1, c2);
    text = t;
    mode = TXT;
  }

  Button(PImage _img, float _x, float _y, float _w, float _h, color c1, color c2) {
    this(_x, _y, _w, _h, c1, c2);
    imgw = _w;
    imgh = _h;
    img = _img;
    mode = IMG;
  }

  Button(PImage _img, float _x, float _y, float _w, float _h, float iw, float ih, color c1, color c2) {
    this(_img, _x, _y, _w, _h, c1, c2);
    imgw = iw;
    imgh = ih;
  }

  Button(PImage _img, float _x, float _y, float _w, float _h, float iw, float ih, color c1, color c2, float r) {
    this(_img, _x, _y, _w, _h, c1, c2);
    imgw = iw;
    imgh = ih;
    roundedRect = r;
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
    tactileButton();
  }


  void drawRect() {
    strokeWeight(0);
    rectMode(CENTER);
    fill(buttonColor);
    rect(x, y, w, h, roundedRect);
  }

  void drawLabel() {
    textAlign(CENTER, CENTER);
    fill(textColor);
    textSize(w/4);
    text(text, x, y);
  }

  void checkForClicks() {
    if (mouseReleased && touchingMouse(x, y, w, h)) clicked = true;
    else clicked = false;
  }

  void drawImg() {
    imageMode(CENTER);
    image(img, x, y, imgw, imgh);
  }

  void tactileButton() {
    if (touchingMouse(x, y, w, h)) {
      strokeWeight(0);
      fill(tactileYellow, 128);
      rect(x, y, w, h, roundedRect);
    }
  }
}
