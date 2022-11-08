class TowerCircle extends Tower {

  TowerCircle(float myX, float myY, int myCooldown, int myThreshold) {
    super(myX, myY, myCooldown, myThreshold);
    c1 = pink;
    c2 = pink2;
  }

  void show() {
    super.show();
  }

  void act() {
    super.act();
    if (towerButton.clicked && cooldown >= threshold) {
      bullets.add(new Bullet(x, y, 5, 0, brightpink));
      bullets.add(new Bullet(x, y, 4, 3, brightpink));
      bullets.add(new Bullet(x, y, 3, 4, brightpink));
      bullets.add(new Bullet(x, y, 0, 5, brightpink));
      bullets.add(new Bullet(x, y, -3, 4, brightpink));
      bullets.add(new Bullet(x, y, -4, 3, brightpink));
      bullets.add(new Bullet(x, y, -5, 0, brightpink));
      bullets.add(new Bullet(x, y, -4, -3, brightpink));
      bullets.add(new Bullet(x, y, -3, -5, brightpink));
      bullets.add(new Bullet(x, y, 0, -5, brightpink));
      bullets.add(new Bullet(x, y, 3, -4, brightpink));
      bullets.add(new Bullet(x, y, 4, -3, brightpink ));
      cooldown = 0;
    }
  }
}
