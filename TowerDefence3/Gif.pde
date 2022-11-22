// loadImage("gif1/frame_" + i = ".gif")

class Gif {
  float x, y, w, h;
  String text1, text2;
  int count, num, rate;
  PImage gif[];
  boolean alive, repeat;

  Gif(float _x, float _y, float _w, float _h, String t1, String t2, int n, int r, boolean rpt) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text1 = t1;
    text2 = t2;
    num = n;
    alive = true;
    count = 0;
    rate = r;
    repeat = rpt;

    gif = new PImage[n];
    loadImages();
  }

  Gif(float _w, float _h, String t1, String t2, int n, int r) {
    this(t1, t2, n, r);
    x = width/2;
    y = height/2;
    w = _w;
    h = _h;
  }

  Gif(String t1, String t2, int n, int r) {
    x = width/2;
    y = height/2;
    w = width;
    h = height;
    text1 = t1;
    text2 = t2;
    num = n;
    alive = true;
    count = 0;
    rate = r;
    repeat = true;
    gif = new PImage[n];
    loadImages();
  }


  void act() {
    if (alive && frameCount % rate == 0) count ++;

    if (count == num) {
      if (repeat) count = 0;
      else alive = false;
    }
  }

  void show() {
    if (alive) image(gif[count], x, y, w, h);
  }

  void loadImages() {
    if (num < 100) {
      for (int i = 0; i < num; i++) {
        if (i < 10) gif[i] = loadImage("data/" + text1 + "0" + i + text2 + ".png");
        else gif[i] = loadImage("data/" + text1  + i +text2 + ".png");
      }
    } else if (num >= 100) {
      for (int i = 0; i < num; i++) {
        // println(i, "data/" + folder + "/" + text1 + "0" + i + text2 + ".png", gif);
        if (i < 10) gif[i] = loadImage("data/" + text1 + "00" + i + text2 + ".png");
        else gif[i] = loadImage("data/" + text1 + "0" + i +text2 + ".png");
      }
    }
  }
}
