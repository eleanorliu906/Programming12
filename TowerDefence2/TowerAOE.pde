class TowerAOE extends Tower {

  TowerAOE(float myX, float myY) {
    super(myX, myY, 0, 240);
    c1 = lilac;
    c2 = lavender;
    value = 10;
    // will override the previous constructor
  }

  void show() {
    super.show();
  }

  void act() {
    super.act();
    if (towerButton.clicked && cooldown >= threshold) {
      bullets.add(new AoERing(x, y));
      cooldown = 0;
    }
  }
}
