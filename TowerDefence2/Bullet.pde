//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {

  float x, y, vx, vy;
  float size;
  int hp;
  color c;

  Bullet(float myX, float myY, float myVX, float myVY) {
    x = myX;
    y = myY;
    vx = myVX;
    vy = myVY;
    size = 5;
    hp = 1;
    c = blue;
  }

  Bullet(float myX, float myY, float myVX, float myVY, color myC) {
    this(myX, myY, myVX, myVY);
    c = myC;
  }

  void act() {
    x += vx;
    y += vy;

    if (x > width || x < 0 || y > height || y < 0) hp = 0;
  }

  void show() {
    stroke(0);
    strokeWeight(0.5);
    fill(c);
    circle(x, y, size);
  }

  boolean checkCollisions(float myX, float myY, float mySize) {
    if (dist(x, y, myX, myY) <= 0.5*(size + mySize)) {
      return true;
    }
    return false;
  }
}
