class TowerAOE extends Tower {

  TowerAOE(float myX, float myY) {
    super(myX, myY, 0, 480);
    c1 = pink;
    c2 = pink2;
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
