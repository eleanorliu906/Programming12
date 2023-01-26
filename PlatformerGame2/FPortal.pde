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
    checkForPlayers();
    if (playerCount == 2*players.size()) activatePortal();
  }

  void checkForPlayers() {
    playerCount = 0;

    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i); // fetch each contact
      if (fc.contains("player")) {
        playerCount ++;
      }
    }
    // println(playerCount + " / " + players.size());
  }

  void activatePortal() {
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
