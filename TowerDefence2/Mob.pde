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

  Mob(float myX, float myY, float myVX, float myVY, color myC, PImage myImg) {
    this(myX, myY, myVX, myVY, myC);
    mode = IMG;
    img = myImg;
  }

  Mob(float myX, float myY, float myVX, float myVY, color myC) {
    this(myX, myY, myVX, myVY);
    c = myC;
    w = 25;
    h = 25;
    mode = CIRCLE;
  }

  Mob(float myX, float myY, float myVX, float myVY, PImage myImg) {
    this(myX, myY, myVX, myVY);
    img = myImg;
    w = 25;
    h = 25;
    mode = IMG;
  }

  Mob(float myX, float myY, float myVX, float myVY) {
    x = myX;
    y = myY;
    vx = myVX;
    vy = myVY;
    hp = 100;
    c = lightpink;
    w = 25;
    h = 25;
    mode = CIRCLE;
  }

  void show() {
    mobModeFramework();
  }

  void act() {
    move();
    checkNodes();
    checkCollisions();

    if (x > 0.9*width) hp = 0;
  }

  void move() {
    x += vx;
    y += vy;
  }

  void checkNodes() {
    for (int i = 0; i < nodeList.size(); i++) {
      if (dist(nodeList.get(i).x, nodeList.get(i).y, x, y) <= 0.5) {
        vx = nodeList.get(i).dx;
        vy = nodeList.get(i).dy;
      }
    }

    if (dist(nodeList.get(nodeList.size()-1).x, nodeList.get(nodeList.size()-1).y, x, y) <= 1) {
      hp = 0;
      lives--;
    }
  }

  void mobModeFramework() {
    if (mode == IMG) showImgMob();
    else if (mode == CIRCLE) showCircleMob();
    else if (mode == RECTANGLE) showRectangleMob();
  }

  void showImgMob() {
    showRectangleMob();
    image(img, x, y, 0.95*w, 0.95*h);
  }

  void showCircleMob() {
    fill(c);
    stroke(0);
    strokeWeight(0);
    ellipse(x, y, w, h);
  }

  void showRectangleMob() {
    fill(c);
    strokeWeight(0);
    rect(x, y, w, h);
  }

  void checkCollisions() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      if (dist(b.x, b.y, x, y) < (w/2 + b.size/2)) {
        hp = 0;
        b.hp = 0;
        money += 5;
      }
    }
  }
}
