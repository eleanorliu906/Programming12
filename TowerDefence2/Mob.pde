//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  float x, y, vx, vy;
  float speed;
  int hp, maxhp;
  color c;
  float w, h;
  int mode;
  PImage img;
  float hpw;

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
    maxhp = hp;
    c = lightpink;
    w = 25;
    h = 25;
    mode = CIRCLE;
  }

  void show() {
    mobModeFramework();

    showHealthBar();
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
    for (int i = 0; i < map1NodeList.size(); i++) {
      if (dist(currNodeList.get(i).x, currNodeList.get(i).y, x, y) <= 0.5) {
        vx = currNodeList.get(i).dx;
        vy = currNodeList.get(i).dy;
      }
    }

    if (dist(map1NodeList.get(map1NodeList.size()-1).x, map1NodeList.get(map1NodeList.size()-1).y, x, y) <= 1) {
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
        hp -= 5;
        b.hp = 0;
        money += 5;
      }
    }
  }

  void showHealthBar() {
    stroke(red);
    strokeWeight(1);
    noFill();
    rect(x, y - 20, 20, 5);

    rectMode(CORNER);
    hpw = map(hp, 0, maxhp, 0, 20);
    noStroke();
    fill(red, 128);
    rect(x-10, y-22.5, hpw, 5);
    rectMode(CENTER);
  }
}
