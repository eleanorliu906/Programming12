class FPortal extends FGameObject {

  int playerCount;

  FPortal(float x, float y) {
    super();
    setPosition(x, y);
    attachImage(portal);
    setSensor(true);
    setStatic(true);
  }

  void act() {
    playerCount = 0;

    // if (isTouching("player")) setSensor(true);

    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i); // fetch each contact
      if (fc.contains("player")) {
        // playerCount ++;
      }
    }
    // println(playerCount + " / " + players.size());
    if (playerCount == 2*players.size()) {
      currLevel++;
      if (currLevel > maxLevel) {
        mode = GAMEOVER;
        win = true;
      } else {
        for (int i = 0; i < players.size(); i++) {
          FPlayer p = players.get(i);
          p.setPosition(0, 0);
        }
        setupWorld();
      }
    }
  }
}
