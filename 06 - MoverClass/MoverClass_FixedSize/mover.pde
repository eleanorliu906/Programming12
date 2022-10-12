class Mover {

  // instance variable
  float x, y, d;
  int r, g, b;

  // constructor
  Mover() {
    x = width/2;
    y = height/2;
    d = random(50, 150);
  }

  // behavioral function
  void show() {
    stroke(0);
    fill(255);
    strokeWeight(5);
    circle(x, y, d);
  }

  void act() {
    x = x + random(-2, 2);
    y = y + random(-2, 2);
  }
}
