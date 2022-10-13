// loadImage("gif1/frame_" + i = ".gif")

class Gif {
  float x, y, w, h;
  String text1, text2, folder;
  int count, num, rate;
  PImage gif[];
  boolean alive;

  Gif(float _x, float _y, float _w, float _h, String t1, String t2, int n, String f, int r) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text1 = t1;
    text2 = t2;
    num = n;
    folder = f;
    loadImages();
    alive = true;
    count = 0;
    rate = r;
  }

  void act(){
    if (alive && frameCount % rate == 0) count ++;
    if (count == n) alive = false;
  }
  
  void show(){
    if (alive) image(gif[count], x, y);
  }
  
  void loadImages() {
    if (n < 10) {
      for (int i = 0; i < n; i++) gif[i] = loadImage(folder + "/" + text1 + i + text2);
    } else {
      for (int i = 0; i < n; i++) {
        if (i < 10) gif[i] = loadImage(folder + "/" + text1 + "0" + i + text2);
        else gif[i] = loadImage(folder + "/" + text1 + i + text2);
      }
    }
  }
}
