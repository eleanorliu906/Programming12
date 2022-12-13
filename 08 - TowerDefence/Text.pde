class Text {
  String t;
  float x, y;
  float vx, vy;
  float size;

  int counter;

  Text(float myX, float myY, String myT) {
    x = myX;
    y = myY;
    t = myT;
    counter = 30;
    size = 30;
  }

  Text(float myX, float myY, float s, String myT) {
    this(myX, myY, myT);
    size = s;
  }

  Text(float myX, float myY, float s, String myT, int myCount) {
    this(myX, myY, myT);
    size = s;
    counter = myCount;
  }

  Text(float myX, float myY, String myT, int myCount) {
    this(myX, myY, myT);
    counter = myCount;
    counter = 120;
  }

  Text(float myX, float myY, float myVX, float myVY, float s, String myT, int myCount) {
    this(myX, myY, myT);
    vx = myVX;
    vy = myVY;
    size = s;
    counter = myCount;
  }

  void act() {
    counter--;
    x += vx;
    y += vy;
  }

  void show() {
    if (counter >= 0) {
      fill(255);
      stroke(0);
      textSize(size);
      text(t, x, y);
    }
  }
}
