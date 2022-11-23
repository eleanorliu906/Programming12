class TowerSniper extends Tower {

  float w, maxw;
  color strokec;
  boolean sniper;

  TowerSniper(float myX, float myY) {
    super(myX, myY, 0, 200);
    c1 = pink;
    c2 = pink2;
    strokec = c2;
    w = 2;
    maxw = 4;
    sniper = false;
    value = 15;
    name = "Sniper Tower";
    maxlevel = 5;
  }

  void show() {
    super.show();
  }

  void act() {
    super.act();
    if (activateTower.clicked) {
      sniper = true;
      texts.add(new Text(x, y-30, 15, "Sniper Tower Activated"));
    }
    activateSniper();
  }

  void activateSniper() {

    if (mobs.size() == 0) {
      w = 2;
      cooldown = 0;
    }

    if (sniper && mobs.size() > 0 && cooldown >= threshold) {
      stroke(strokec);
      strokeWeight(w);
      Mob m = mobs.get(0);
      println(m.x);
      line(x, y, m.x, m.y);
      w += 0.015;

      if (w > 0.85*maxw) strokec = red;
      if (w >= maxw) {
        mobs.get(0).hp -= 20;
        sniper = false;
        w = 2;
        cooldown = 0;
        strokec = c2;
        texts.add(new Text(m.x, m.y-13, m.vx, m.vy, 15, "hp -20", 60));
      }
    }
  }

  void edit() {
    super.edit();
    if (upgradeTower.clicked) {
      if (level < maxlevel) {
        level++;
        value += 7;
        coins -= 7;
        texts.add(new Text(x, y-20, 15, "Sniper Tower Upgraded", 30));
        threshold = int(threshold*0.9);
      } else {
        texts.add(new Text(x, y-20, 15, "Unable to uprade, max level reached", 30));
      }
    }

    if (sellTower.clicked) {
      int profit = int(0.8*value);
      coins += profit;
      texts.add(new Text(x, y-20, 15, "Sniper Tower Sold for " + profit + " coins"));
      hp = 0;
    }
  }
}
