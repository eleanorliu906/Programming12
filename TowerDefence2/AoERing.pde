//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class AoERing extends Bullet {

  float maxSize;
  float damageCountdown;

  AoERing(float myX, float myY) {
    x = myX;
    y = myY;
    vx = 0;
    vy = 0;
    size = 50;
    maxSize = 200;
    transparency = 250;
    hp = 1;
    c = purple;
    damageCountdown = 45;
  }

  void act() {
    // overriding: it must call the superclass
    transparency = map(size, 40, maxSize, 255, 0);

    size += 0.75;
    if (size >= maxSize) hp = 0;

    checkForMobs();
    damageCountdown --;
  }

  void show() {
    super.show();
  }

  void checkForMobs() {
    for (int i = 0; i < mobs.size(); i++) {
      Mob m = mobs.get(i);

      if (dist(x, y, m.x, m.y) <= size) {
        if (damageCountdown <= 0) {
          int dmg = (int) map(size, 5, maxSize, 10, 0);
          m.hp -= dmg;
          damageCountdown = 30;
          // float myX, float myY, float myVX, float myVY, String myT, int myCount
          texts.add(new Text(m.x, m.y-13, m.vx, m.vy, 15, "hp -" + dmg, 60));
          hp = 1;
        }
      }
    }
  }
}
