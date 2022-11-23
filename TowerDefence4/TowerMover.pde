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
    threshold = 120;
  }

  void show() {
    super.show();
  }

  void act() {
    super.act();
    moveButtons();

    if (mobs.size() > 0) {
      move();
      if (cooldown % threshold*0.5 == 0 && !excessBombs()) {
        powerups.add(new PowerUpBomb(30 + 30*level*level));
        cooldown = 0;
      }
    }
  }

  void moveButtons() {
    activateTower.x = x;
    activateTower.y = y;
    upgradeTower.x = x-12;
    upgradeTower.y = y + 0.6*size;
    sellTower.x = x+12;
    sellTower.y = y + 0.6*size;
  }


  void edit() {
    super.edit();
    if (upgradeTower.clicked) {
      if (level < maxlevel) {
        level++;
        value += 5;
        coins -= 5;
        texts.add(new Text(x, y-20, 15, "Mover Tower Upgraded", 30));
        int new_thres = int(threshold*0.9);
        if (new_thres % 2 == 0) threshold = new_thres;
        else threshold = new_thres+1;
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

  boolean excessBombs() {
    int bombCount = 0;

    for (int i = 0; i < powerups.size(); i++) {
      PowerUp p = powerups.get(i);
      if (p instanceof PowerUpBomb) bombCount ++;
    }

    if (bombCount > 10) return true;
    else return false;
  }
}
