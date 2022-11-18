class PowerUp {
  float x, y;
  int timer;
  PImage img;
  int size;
  int hp;

  PowerUp() {
    size = 20;
    hp = 1;
  }

  void act() {
  }


  void show() {
    image(img, x, y, 20, 20);
    tactilePowerUp();
  }

  void tactilePowerUp() {
    if (touchingMouse(x, y, size, size)) {
      strokeWeight(0);
      fill(tactileYellow, 128);
      rect(x, y, size, size);
    }
  }
}
