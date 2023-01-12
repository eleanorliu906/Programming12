class FPlayer extends FGameObject {

  boolean[] keys;

  FPlayer(color c, boolean[] k) {
    super();
    setPosition(0, 0);
    setRotatable(false);
    setName("player");
    setFillColor(c);
    keys = k;
  }

  void act() {
    handleInput();
    if (isTouching("Spike")) {
      setPosition(0, 0);
    }
  }

  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (keys[0]) setVelocity(-200, vy);
    if (keys[1]) setVelocity(200, vy);
    if (keys[2]) setVelocity(vx, -200);
    if (keys[3]) setVelocity(vx, 200);
  }
}
