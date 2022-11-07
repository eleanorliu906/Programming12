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

  void act() {
    counter--;
  }

  void show() {
    fill(255);
    stroke(0);
    text(t, x, y);
  }
}
