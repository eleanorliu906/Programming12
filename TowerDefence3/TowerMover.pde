class TowerMover extends Tower {

  float vx, vy;

  TowerMover(float myX, float myY) {
    super(myX, myY, 0, 240);
    c1 = yellow1;
    c2 = yellow2;
    value = 15;
    name = "Mover Tower";
    maxlevel = 7;
    vx = random(0.5, 1.5);
    vy = random(0.5, 1.5);
    threshold = 1000000000;
  }

  void show() {
    super.show();
  }

  void act() {
    super.act();
    move();
    if (activateTower.clicked && cooldown >= threshold) {
      bullets.add(new AoERing(x, y));
      cooldown = 0;
      texts.add(new Text(x, y-20, 15, "Mover Tower Activated"));
    }
  }

  void edit() {
    super.edit();
    if (upgradeTower.clicked) {
      if (level < maxlevel) {
        level++;
        value += 5;
        coins -= 5;
        texts.add(new Text(x, y-20, 15, "Mover Tower Upgraded", 30));
        threshold = int(threshold*0.9);
      } else {
        texts.add(new Text(x, y-20, 15, "Unable to uprade, max level reached", 30));
      }
    }

    if (sellTower.clicked) {
      int profit = int(0.8*value);
      coins += profit;
      texts.add(new Text(x, y-20, 15, "Mover Tower Sold for " + profit + " coins", 30));
      hp = 0;
    }
  }

  void move() {
    x += vx;
    y += vy;

    if (( y - size/2 < 0  && x - size/2 < 0) || (x + size/2 > 0.8*width && y + size/2 > height)) {
      vy *= -1;
      vx *= -1;
    } else if ( x - size/2 < 0 || x + size/2 > 0.8*width) {
      vx *= -1;
      vy = random(0.5, 1.5);
    } else if ( y - size/2 < 0 || y + size/2 > height) {
      vy *= -1;
      vx = random(0.5, 1.5);
    }
  }
}
