class TowerGun extends Tower {

  TowerGun(float myX, float myY) {
    super(myX, myY, 0, 30);
    c1 = powderblue;
    c2 = lightblue;
    value = 5;
    name = "Gun Tower";
  }

  void show() {
    super.show();
  }

  void act() {
    super.act();
    if (activateTower.clicked && cooldown >= threshold) {
      bullets.add(new Bullet(x, y, 0, 6));
      bullets.add(new Bullet(x, y, 6, 0));
      bullets.add(new Bullet(x, y, 0, -6));
      bullets.add(new Bullet(x, y, -6, 0));
      cooldown = 0;
      texts.add(new Text(x, y-30, 15, "Gun Tower Activated"));
    }
  }
}
