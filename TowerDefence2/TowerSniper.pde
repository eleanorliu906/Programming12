class TowerSniper extends Tower {

  TowerSniper(float myX, float myY, int myCooldown, int myThreshold) {
    super(myX, myY, myCooldown, myThreshold);
    c1 = lilac;
    c2 = lavender;
  }

  void show() {
    super.show();
  }

  void act() {
    if (cooldown >= threshold && mobs.size() > 0) {
      Bullet b = new Bullet(x, y, 5, 0, purple);
      bullets.add(b);
      while (b.hp >= 0) {
        float dx = b.x - mobs.get(mobs.size()-1).x;
        float dy = b.y - mobs.get(mobs.size()-1).y;
        b.vx = dx*0.1;
        b.vy = dy*0.1;
      }
      cooldown = 0;
    }
  }
}
