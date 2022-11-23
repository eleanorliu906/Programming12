class MobWhale extends Mob {
  
  MobWhale(float myX, float myY) {
    super(myX, myY, 0, 1, lightblue, whale);
    mode = IMG;
    w = 40;
    h = 40;
    value = 15;
    speed = 0.6;
    hp = 15 + waveCount *2;
  }
  void act() {
    super.act();
  }

  void show() {
    super.show();
  }
}
