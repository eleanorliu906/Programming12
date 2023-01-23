class FHammer extends FGameObject {

  FHammer(float x, float y) {
    super();
    setPosition(x, y);
    setName("hammer");
    attachImage(hammer);
    setVelocity(x, y);
    setAngularVelocity(x);
  }

  void act() {
    move();
  }

  void move() {
    if (isTouching("wall") || isTouching("stone")) setSensor(true);
  }
}
