class FLava extends FGameObject {

  int i;

  FLava(float x, float y, int ind) {
    super ();
    setPosition(x, y);
    setName("lava");
    attachImage(lava[i]);
    setStatic(true);
    setSensor(true);
    i = ind;
  }

  void act() {
    if (frameCount % 10 ==0) {
      i ++;
      i = i % 6;
    }
    attachImage(lava[i]);
    // println(i);
  }

  void show() {
  }
}
