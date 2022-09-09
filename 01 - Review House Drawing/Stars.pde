class Stars {
  float x, y;
  float r;
  int count;
  boolean alive;

  Stars(float myX, float myY, float myR) {
    x = myX;
    y = myY;
    r = myR;
    count = 120;
    alive = true;
  }

  void act() {
    if (count/10 % 2 == 0) {
      fill(255, 254, 227, 128);
      circle(x, y, 1.6*r);
    }
    count --;
  }

  void show() {

    if (count > 0) {
      fill(250, 249, 235);
      circle(x, y, r);
    } else {
      alive = false;
    }
  }
}
