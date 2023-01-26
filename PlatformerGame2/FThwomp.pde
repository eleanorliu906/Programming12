class FThwomp extends FGameObject {
  
  boolean sleepy;
  
  FThwomp(int x, int y) {
    super(64, 64);
    setPosition(x+gridSize /2, y+gridSize/2);
    setName("thwomp");
    setRotatable(false);
    setStatic(true);
    attachImage(thwompSleepy);
    sleepy = true;
  }

  void act() {
    // print(getX(), getY());
    checkForPlayers();
    damage();
  }

  void checkForPlayers() {
    for (int i = 0; i < players.size(); i++) {
      FPlayer p = players.get(i);
      if (p.getX() > getX()-32 && p.getX() < getX() + 32 && p.getY() > getY()) {
        setStatic(false);
        attachImage(thwompAngry);
        sleepy = false;
      }
    }
  }

  void damage() {
    if (isTouching("player")) {
      FPlayer myPlayer = getTouchingPlayer();
      if (myPlayer.getY() > getY()+0.5*gridSize) {
        myPlayer.lives--;
        myPlayer.setPosition(0, 0);
        myPlayer.cooldown = myPlayer.threshold;
      }
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
