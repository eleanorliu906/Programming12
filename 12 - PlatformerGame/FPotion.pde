class FPotion extends FHeart {

  int timer;

  FPotion(float x, float y) {
    super(x, y);
    attachImage(potion);
    setName("potion");
    timer = 450;
  }

  FPotion(float x, float y, int t) {
    super(x, y, t);
    attachImage(potion);
    setName("potion");
    timer = t;
  }

  void act() {
    timer--;
    // println(timer);
    if (timer <= 0) {
      world.remove(this);
      terrain.remove(this);
    }
    if (isTouching("player")) {
      world.remove(this);
      terrain.remove(this);
 
      for (FPlayer p : players) {
        p.lives++;
      }
    }
  }
}
