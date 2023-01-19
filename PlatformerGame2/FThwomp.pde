class FThwomp extends FGameObject {
  FThwomp(int x, int y) {
    super(64, 64);
    setPosition(x+gridSize /2, y+gridSize/2);
    setName("thwomp");
    setRotatable(false);
    setStatic(true);
    attachImage(thwompSleepy);
  }

  void act() {
    // print(getX(), getY());
    checkForPlayers();
    animate();
  }

  void checkForPlayers() {
    for (int i = 0; i < players.size(); i++) {
      FPlayer p = players.get(i);
      if (p.getX() > getX()-32 && p.getX() < getX() + 32 && p.getY() > getY()) {
        setStatic(false);
        attachImage(thwompAngry);
      }
    }
  }

  void animate() {
  }
}
