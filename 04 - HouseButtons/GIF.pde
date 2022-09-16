class Gif {
  float x, y, s;
  boolean alive;
  int count;

  Gif(float myX, float myY) {
    x = myX;
    y = myY;
    alive = true;
    count = 0;
  }

  void act() {
    count++;
  }

  void show() {
    if (count < 270) image(gif[count/3], x, y, 90, 90);
    else alive = false;
  }
}
