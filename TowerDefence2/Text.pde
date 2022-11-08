class Text {
  String t;
  float x, y;

  int counter;

  Text(float myX, float myY, String myT) {
    x = myX;
    y = myY;
    t = myT;
    counter = 120;
  }

  Text(float myX, float myY, String myT, int myCount) {
    x = myX;
    y = myY;
    t = myT;
    counter = myCount;
  }

  void act() {
    counter--;
  }

  void show() {
    if (counter >= 0) {
      fill(255);
      stroke(0);
      text(t, x, y);
    }
  }
}
