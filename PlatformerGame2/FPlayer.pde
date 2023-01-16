class FPlayer extends FGameObject {

  boolean[] keys;
  int lives;
  int cooldown, threshold;
  int count;
  PImage[] img;
  int idx;

  FPlayer(color c, boolean[] k, int ind) {
    super();
    setPosition(700, 0);
    setRotatable(false);
    setName("player");
    setFillColor(c);
    keys = k;
    lives = 5;
    cooldown = 120;
    threshold = cooldown;
    count = ind;
    img = idle;
    idx = 0;
  }

  void act() {
    handleInput();
    handleDamage();
    showStats();
    showImg();
  }

  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (keys[0]) setVelocity(-200, vy);
    if (keys[1]) setVelocity(200, vy);
    if (keys[2]) setVelocity(vx, -200);
    if (keys[3]) setVelocity(vx, 200);
  }
  
  void showImg() {
    if (getVelocityX() == 0 && getVelocityY() == 0) img = idle;
    else if (keys[1] && getVelocityY()==0) img = runright;
    else if (keys[0] && getVelocityY()==0) img = runleft;

    if (frameCount % 30 == 0) idx++;
    idx = idx % img.length;
    attachImage(img[idx]);
  }

  void showStats() {
    fill(black);
    text("Player" + count, 8, 2 + count*18);
    for (int i = 0; i < lives; i++) {
      image(heart, 54 + i*18, -8 + count*18);
    }
  }

  void handleDamage() {

    if (cooldown < 0) {
      if (isTouching("spike")) {
        setPosition(0, 0);
        lives --;
        cooldown = threshold;
      }
      if (isTouching("lava")) {
        lives--;
        cooldown = threshold;
      }
    }
    cooldown --;
    // println(cooldown);
  }
}
