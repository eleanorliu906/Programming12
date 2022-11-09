class TowerGun extends Tower {

  TowerGun(float myX, float myY, int myCooldown, int myThreshold) {
    super(myX, myY, myCooldown, myThreshold);
    c1 = blue;
    c2 = powderblue;
  }

  void show() {
    super.show();
  }

  void act() {
    super.act();
    if (towerButton.clicked && cooldown >= threshold) {
      bullets.add(new Bullet(x, y, 0, 6));
      bullets.add(new Bullet(x, y, 6, 0));
      bullets.add(new Bullet(x, y, 0, -6));
      bullets.add(new Bullet(x, y, -6, 0));
      cooldown = 0;
    }
  }
}
