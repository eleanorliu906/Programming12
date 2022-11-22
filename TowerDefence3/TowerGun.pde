class TowerGun extends Tower {

  TowerGun(float myX, float myY) {
    super(myX, myY, 0, 30);
    c1 = powderblue;
    c2 = lightblue;
    value = 5;
    name = "Gun Tower";
    maxlevel = 3;
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
      texts.add(new Text(x, y-20, 15, "Gun Tower Activated"));
    }
  }

  void edit() {
    super.edit();
    if (upgradeTower.clicked) {
      if (level < maxlevel) {
        level++;
        value += 3;
        coins -= 3;
        texts.add(new Text(x, y-20, 15, "Gun Tower Upgraded", 30));
        threshold = int(threshold*0.9);
      } else {
        texts.add(new Text(x, y-20, 15, "Unable to uprade, max level reached", 30));
      }
    }

    if (sellTower.clicked) {
      int profit = int(0.8*value);
      coins += profit;
      texts.add(new Text(x, y-20, 15, "Gun Tower Sold for " + profit + " coins"));
      hp = 0;
    }
  }
}
