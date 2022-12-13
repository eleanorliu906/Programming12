class PowerUpBomb extends PowerUp {

  PowerUpBomb(float _x, float _y, int t) {
    x = _x;
    y = _y;
    img = bomb;
    hp = 1;
    timer = t;
  }

  void act() {
    super.act();
    if (mouseReleased && touchingMouse(x, y, size, size)) {
      bullets.add(new AoERing(x, y));
      texts.add(new Text(x, y-20, 15, "AoE Ring Activated"));
      hp = 0;
    }
  }


  void show() {
    super.show();
  }
}
