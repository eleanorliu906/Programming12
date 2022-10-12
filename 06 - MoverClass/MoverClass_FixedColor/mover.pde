class Mover {

  // instance variable
  float x, y, d;
  int r, g, b;

  // constructor
  Mover() {
    x = width/2;
    y = height/2;
    d = 100;
    r = (int) random(0, 255);
    g = (int) random(0, 255);
    b = (int) random(0, 255);
  }

  // behavioral function
  void show() {
    stroke(0);
    fill(r, g, b);
    strokeWeight(5);
    circle(x, y, d);
  }

  void act() {
    x = x + random(-2, 2);
    y = y + random(-2, 2);
  }
}
