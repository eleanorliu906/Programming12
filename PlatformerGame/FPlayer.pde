class FPlayer extends FBox {

  boolean[] keys;

  FPlayer(color c, boolean[] k) {
    super(gridSize, gridSize);
    setPosition(0, 0);
    setFillColor(c);
    keys = k;
  }

  void act() {
    handleInput();
    checkForCollisions();
  }

  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (keys[0]) setVelocity(-200, vy);
    if (keys[1]) setVelocity(200, vy);
    if (keys[2]) setVelocity(vx, -200);
    if (keys[3]) setVelocity(vx, 200);
  }

  void checkForCollisions() {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i); // fetch each contact
      if (fc.contains("spike")) {
        setPosition(0, 0); // refers to the player itself
      }
    }
  }
}
