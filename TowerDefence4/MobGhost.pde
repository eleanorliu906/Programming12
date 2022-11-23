class MobGhost extends Mob {

  boolean show;
  int counter;

  MobGhost(float myX, float myY) {
    super(myX, myY, 0, 1, white, ghost);
    mode = IMG;
    value = 30;
    counter = 45*waveCount;
    show = true;
    img = ghost;
    speed = random(0.5, 2);
    hp = 40 + waveCount * (int)random(1, 5);
    maxhp = hp;
  }

  void act() {
    super.act();
    //counter --;
    //println(counter);

    if (frameCount % 120 == 0) {
      float r = random(1);
      if (r < 0.75) counter = 45;
    }
  }

  void show() {
    if (counter > 0) {
      //println("show");
      showGhostMob();
      flashMob();
    }
  }

  void showGhostMob() {
    mobRectangles();
    image(img, x, y, 0.95*w, 0.95*h);
  }

  void flashMob() {
    if (frameCount/5 % 2 == 0) {
      fill(softred, 128);
      rect(x, y, 1.1*w, 1.1*h);
    }
  }
}
