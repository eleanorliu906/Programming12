class TowerSniper extends Tower {

  TowerSniper(float myX, float myY, int myCooldown, int myThreshold) {
    super(myX, myY, myCooldown, myThreshold);
    c1 = lavender;
    c2 = lilac;
  }

  void show() {
    super.show();
  }

  void act() {
    super.act();
    if (towerButton.clicked) {
      Bullet b = new Bullet(x, y, 5, 0, purple);
      bullets.add(b);
      if (b.hp >= 0) {
        float dx = mobs.get(0).x - b.x;
        float dy =  mobs.get(0).y - b.y;
        b.vx = dx*0.1;
        b.vy = dy*0.1;
      }
      cooldown = 0;
    }
  }
}
