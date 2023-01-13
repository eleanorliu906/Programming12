class FPlayer extends FGameObject {

  boolean[] keys;
  int lives;
  int cooldown, threshold;
  int count;

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
  }

  void act() {
    handleInput();
    handleDamage();
    showStats();
  }

  void showStats() {
    for (int i = 0; i < lives; i++){
      image(heart, 8 + i*16,  8 + count*16);
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
    println(cooldown);
  }


  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (keys[0]) setVelocity(-200, vy);
    if (keys[1]) setVelocity(200, vy);
    if (keys[2]) setVelocity(vx, -200);
    if (keys[3]) setVelocity(vx, 200);
  }
}
