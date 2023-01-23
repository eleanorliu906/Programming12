class FGoomba extends FGameObject {

  int direction = L;
  int speed = 50;
  int frameIdx = 0;

  FGoomba(float x, float y) {
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (frameIdx >= goomba.length) frameIdx = 0;
    if (frameCount % 5 == 0) { // happens every 5 frames
      if (direction == R) attachImage(goomba[frameIdx]);
      if (direction == L) attachImage(flipImage(goomba[frameIdx]));
      frameIdx++;
    }
  }

  void collide() {
    if (isTouching("wall")) {
      direction *= -1;
      setPosition(getX()+direction*5, getY()); // shift over the direction so it doesn't have another collision
    }

    if (isTouching("player")) {
      FPlayer myPlayer = getTouchingPlayer();
      if (myPlayer.getY() < getY()-gridSize/2) {
        world.remove(this); // refers to whatever goomba is calling it's collide function
        enemies.remove(this); // won't show up in the world, but needs to be removed in enemies too
        myPlayer.setVelocity(getVelocityX(), -30);
      } else {
        myPlayer.lives--;
        myPlayer.setPosition(0, 0);
        myPlayer.cooldown = myPlayer.threshold;
      }
    }
  }

  void move() {
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
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
