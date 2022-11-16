class TowerGun extends Tower {

  TowerGun(float myX, float myY) {
    super(myX, myY, 0, 30);
    c1 = powderblue;
    c2 = lightblue;
    value = 5;
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
