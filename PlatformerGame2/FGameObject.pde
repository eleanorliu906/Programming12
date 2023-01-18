class FGameObject extends FBox {
  final int L = -1;
  final int R = 1;
  FGameObject() {
    super(gridSize, gridSize);
  }

  void act() {
    // for overriding purposes, all game objects have an act function
  }

  boolean isTouching(String n) {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i); // fetch each contact
      if (fc.contains(n)) {
        return true;
      }
    }
    return false;
  }

  void move() {
  }

  void animate() {
  }

  void collide() {
  }
}
