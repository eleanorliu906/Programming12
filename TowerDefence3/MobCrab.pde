class MobCrab extends Mob {
  
  MobCrab(float myX, float myY) {
    super(myX, myY, 0, 1, lightpink, crab);
    mode = IMG;
    value = 10;
    hp = 10 + waveCount*2;
  }

  void act() {
    super.act();
  }

  void show() {
    super.show();
  }
}
