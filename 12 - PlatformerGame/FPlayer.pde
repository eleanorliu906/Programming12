class FPlayer extends FGameObject {

  boolean[] keys;
  int lives;
  int cooldown, threshold;
  int playerIndex;
  PImage[] action;
  int frameIdx;

  int direction; // left is -1, right is 1;

  FPlayer(color c, boolean[] k, int ind) {
    super();
    setPosition(0, 0);
    setRotatable(false);
    setName("player");
    setFillColor(c);
    keys = k;
    lives = 5;
    cooldown = 120;
    threshold = cooldown;
    playerIndex = ind;
    action = idle;
    frameIdx = 0;
    direction = R;
  }

  void act() {
    handleInput();
    handleDamage();
    showStats();
    animate();
    nextLevel();
  }

  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (keys[0]) {
      setVelocity(-200, vy);
      direction = L;
      action = run;
    }
    if (keys[1]) {
      setVelocity(200, vy);
      direction = R;
      action = run;
    }
    if (keys[2] ) setVelocity(vx, -200); //&& touchingSomething(this)
    if (keys[3]) setVelocity(vx, 200);
    
    if (spacekey) setPosition(0, 0);
  }

  void animate() {
    attachImage();
    addHalo();
  }

  void attachImage() {
    if (getVelocityX() == 0 && getVelocityY() == 0) action = idle;
    else if (abs(getVelocityY()) > 0.2) action = jump;
    else action = run;

    if (frameCount % 30 == 0) frameIdx++;
    frameIdx = frameIdx % action.length;
    if (direction == R) attachImage(action[frameIdx]);
    else if (direction == L) attachImage(flipImage(action[frameIdx]));
  }

  void addHalo() {
    pushMatrix();
    zoom = 0.5 + 40/dist(player1.getX(), player1.getY(), player2.getX(), player2.getY());
    translate(-0.5*(player1.getX()+player2.getX())*zoom + width/2, -0.5*((player1.getY()+player2.getY())*zoom) + height/2);
    scale(zoom);
    fill(thwompGold, 64);
    strokeWeight(0);
    circle(getX(), getY(), 100);
    popMatrix();
  }

  void showStats() {
    fill(white);
    textSize(14);
    text("Player" + playerIndex, 8, 2 + playerIndex*18);
    for (int i = 0; i < lives; i++) {
      image(heart, 54 + i*18, -8 + playerIndex*18);
    }
  }

  void handleDamage() {
    if (cooldown < 0) {
      if (isTouching("spike") || isTouching("lava") || isTouching("hammer")) {
        setPosition(0, 0);
        lives --;
        cooldown = threshold;
      }
    }
    cooldown --;
    // println(cooldown);
  }

  void nextLevel() {
    if (isTouching("portal")) {
      currLevel++;
    }
    if (lives <= 0) mode = GAMEOVER;
  }
}
