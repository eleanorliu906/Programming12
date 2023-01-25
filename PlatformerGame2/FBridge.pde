class FBridge extends FGameObject {
  FBridge(float x, float y, PImage img) {
    super();
    setPosition(x, y);
    setName("bridge");
    attachImage(img);
    setStatic(true);
  }

  void act() {
    if (isTouching("player") || isTouching("thwomp")) {
      setStatic(false);
      setSensor(true);
    }
  }
}
