class FHeart extends FGameObject {

  int timer;

  FHeart(float x, float y) {
    super();
    setPosition(x, y);
    attachImage(heart);
    setName("heart");
    timer = 450;
    setSensor(true);
    setStatic(true);
  }

  FHeart(float x, float y, int t) {
    this(x, y);
    timer = t;
  }

  void act() {
    timer--;
    if (timer <= 0) {
      world.remove(this);
      terrain.remove(this);
    }

    if (isTouching("player")) {
      FPlayer myPlayer = getTouchingPlayer();
      world.remove(this);
      terrain.remove(this);
      myPlayer.lives++;
    }
  }

  FPlayer getTouchingPlayer() {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i); // fetch each contact
      if (fc.contains("player")) {
        FBody a = fc.getBody1();
        FBody b = fc.getBody2();
        if (a == this) return (FPlayer) b;
        else return (FPlayer) a;
      }
    }
    return null;
  }
}
