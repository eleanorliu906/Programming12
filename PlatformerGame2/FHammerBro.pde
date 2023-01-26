class FHammerBro extends FGoomba {
  // int direction = L;
  // int speed = 50;
  // int frameIdx = 0;
  int timer;

  FHammerBro(float x, float y, int t) {
    super(x, y);
    setName("hammerbro");
    timer = t;
  }

  void act() {
    animate();
    collide();
    move();
    throwHammers();
  }

  void throwHammers() {
    if (frameCount % 150 == 0) {
      FHammer h = new FHammer(getX(), getY(), getVelocityX());
      enemies.add(h);
      world.add(h);
    }
  }

  void move() {
    super.move();
    timer--;
    if (timer <= 0) {
      timer = 120;
      direction*=-1;
    }
  }

  void animate() {
    if (frameIdx >= hammerbro.length) frameIdx = 0;
    if (frameCount % 20 == 0) { // happens every 5 frames
      if (direction == R) attachImage(hammerbro[frameIdx]);
      else if (direction == L) attachImage(flipImage(hammerbro[frameIdx]));
      frameIdx++;
      // println(direction);
    }
  }

  void collide() {
    if (isTouching("goomba")) {
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
}
