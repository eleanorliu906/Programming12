class TowerAOE extends Tower {

  TowerAOE(float myX, float myY) {
    super(myX, myY, 0, 240);
    c1 = lilac;
    c2 = lavender;
    value = 10;
    name = "AoE Tower";
    maxlevel = 3;
    // will override the previous constructor
  }

  void show() {
    super.show();
  }

  void act() {
    super.act();
    if (activateTower.clicked && cooldown >= threshold) {
      bullets.add(new AoERing(x, y));
      cooldown = 0;
      texts.add(new Text(x, y-20, 15, "AoE Tower Activated"));
    }
  }

  void edit() {
    super.edit();
    if (upgradeTower.clicked) {
      if (level < maxlevel) {
        level++;
        value += 5;
        coins -= 5;
        texts.add(new Text(x, y-20, 15, "AoE Tower Upgraded", 30));
        threshold = int(threshold*0.9);
      } else {
        texts.add(new Text(x, y-20, 15, "Unable to uprade, max level reached", 30));
      }
    }
    
    if (sellTower.clicked){
      int profit = int(0.8*value);
      coins += profit;
      texts.add(new Text(x, y-20, 15, "AoE Tower Sold for " + profit + " coins", 30));
      hp = 0;
    }
  }
}
