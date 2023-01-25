class FHammer extends FGameObject {

  FHammer(float x, float y, float vx) {
    super();
    // println(vx);
    setPosition(x, y);
    setName("hammer");
    attachImage(hammer);
    setVelocity(2*vx, -600);
    setAngularVelocity(0.5*PI);
    setSensor(true);
  }

  void act() {
    move();
    //println("hammer");
  }

  void move() {
    ArrayList<FContact> contacts = getContacts();
    if (contacts.size()>0 && getVelocityY()>100) {
      setSensor(true);
      world.remove(this);
      enemies.remove(this);
    }
  }
}
