class MobFish extends Mob {

  MobFish(float myX, float myY) {
    super(myX, myY, 0, 1, orange, fish);
    mode = IMG;
    speed = 2;
    value = 20;
    hp = 10 + waveCount*2;
    maxhp = hp;
  }
  void act() {
    super.act();
  }

  void show() {
    super.show();
  }
}
