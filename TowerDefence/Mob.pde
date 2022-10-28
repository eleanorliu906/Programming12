//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  float x, y, vx, vy;
  float speed;
  int hp;
  color c;
  float w, h;
  int mode;
  PImage img;

  final static int IMG = 0;
  final static int CIRCLE = 1;
  final static int RECTANGLE = 2;

  Mob(float myX, float myY, float myVX, float myVY, float myW, float myH, color myC, int myMode) {
    this(myX, myY, myVX, myVY, myC);
    mode = myMode;
    w = myW;
    h = myH;
  }

  Mob(float myX, float myY, float myVX, float myVY, color myC, int myMode) {
    this(myX, myY, myVX, myVY, myC);
    mode = myMode;
  }

  Mob(float myX, float myY, float myVX, float myVY, color myC) {
    this(myX, myY, myVX, myVY);
    c = myC;
    w = 15;
    h = 15;
    mode = CIRCLE;
  }

  Mob(float myX, float myY, float myVX, float myVY) {
    x = myX;
    y = myY;
    vx = myVX;
    vy = myVY;
    hp = 100;
    c = hotpink;
    w = 15;
    h = 15;
    mode = CIRCLE;
  }

  void show() {
    mobModeFramework();
  }

  void act() {
    move();
    checkNodes();
  }

  void move() {
    x += vx;
    y += vy;
  }

  void checkNodes() {
    for (int i = 0; i < nodeList.size(); i++) {
      if (dist(nodeList.get(i).x, nodeList.get(i).y, x, y) <= 1) {
        vx = nodeList.get(i).dx;
        vy = nodeList.get(i).dy;
      }
    }

    if (dist(nodeList.get(nodeList.size()-1).x, nodeList.get(nodeList.size()-1).y, x, y) <= 1) {
      hp = 0;
    }
  }

  void mobModeFramework() {
    if (mode == IMG) showImgMob();
    else if (mode == CIRCLE) showCircleMob();
    else if (mode == RECTANGLE) showRectangleMob();
  }

  void showImgMob() {
    image(img, x, y, w, h);
  }

  void showCircleMob() {
    fill(c);
    strokeWeight(3);
    ellipse(x, y, w, h);
  }

  void showRectangleMob() {
    fill(c);
    strokeWeight(3);
    rect(x, y, w, h);
  }
}
