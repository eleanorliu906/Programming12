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

    if (sniper && mobs.size() > 0 && cooldown >= threshold) {
      stroke(strokec);
      strokeWeight(w);
      Mob m = mobs.get(0);
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
}
