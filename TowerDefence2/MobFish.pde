class MobFish extends Mob {
  
  MobFish(float myX, float myY) {
    super(myX, myY, 0, 1, orange, fish);
    mode = IMG;
    speed = 2;
    value = 20;
  }
  void act() {
    super.act();
  }

  void show() {
    super.show();
  }
}
