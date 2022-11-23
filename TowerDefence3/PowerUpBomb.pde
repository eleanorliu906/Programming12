class PowerUpBomb extends PowerUp {

  PowerUpBomb(int t) {
    x = random(0, 0.8*width);
    y = random(0, height);
    img = bomb;
    hp = 1;
    timer = t;
  }

  void act() {
    super.act();
    if (mouseReleased && touchingMouse(x, y, size, size)) {
      bullets.add(new AoERing(x, y));
      texts.add(new Text(x, y-20, 15, "Mover Tower Activated"));
      hp = 0;
    }
  }


  void show() {
    super.show();
  }
}
