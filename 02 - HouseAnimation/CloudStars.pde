class CloudStars {
  float x, y;
  float r;
  int count;
  boolean alive;

  CloudStars(float myX, float myY, float myR) {
    x = myX;
    y = myY;
    r = myR;
    count = 120;
    alive = true;
  }

  void act() {
    count --;
  }

  void show() {

    if (isNight) {
      if (count > 0) {
        noStroke();
        fill(250, 249, 235);
        circle(x, y, r);
      } else {
        alive = false;
      }

      // sparkles
      if (count/10 % 2 == 0) {
        noStroke();
        fill(255, 254, 227, 128);
        circle(x, y, 1.6*r);
      }
    } else {
      if (count > 0) {
        image(cloud, x, y, 5*r, 5*r);
      } else {
        alive = false;
      }
    }
  }
}
