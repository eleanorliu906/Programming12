class TowerSniper2 extends Tower {

  float w, maxw;
  color strokec;
  boolean sniper;
  float mindist;
  Mob m;

  TowerSniper2(float myX, float myY) {
    super(myX, myY, 0, 200);
    c1 = orange2;
    c2 = orange;
    strokec = c2;
    w = 2;
    maxw = 4;
    sniper = false;
    value = 15;
    name = "Sniper Tower 2";
  }

  void show() {
    super.show();
  }

  void act() {
    super.act();
    if (towerButton.clicked) {
      sniper = true;
      texts.add(new Text(x, y-30, 15, "Sniper Tower 2 Activated"));
      m = mobs.get(0);
      mindist = dist(x, y, mobs.get(0).x, mobs.get(0).y);

      for (int i = 1; i < mobs.size(); i++) {
        Mob m_test = mobs.get(i);
        if (dist (x, y, m_test.x, m_test.y) <= mindist) {
          mindist = dist (x, y, m_test.x, m_test.y);
          m = m_test;
        }
      }
    }
    if (sniper)activateSniper();
  }

  void activateSniper() {

    if ( mobs.size() > 0 && cooldown >= threshold) {
      stroke(strokec);
      strokeWeight(w);

      line(x, y, m.x, m.y);
      w += 0.015;

      if (w > 0.85*maxw) strokec = red;
      if (w >= maxw) {
        m.hp -= 20;
        sniper = false;
        w = 2;
        cooldown = 0;
        strokec = c2;
        texts.add(new Text(m.x, m.y-13, m.vx, m.vy, 15, "hp -20", 60));
      }
    }
  }
}
