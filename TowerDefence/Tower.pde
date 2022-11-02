//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {

  float x, y;
  int cooldown, threshold;
  float size;
  PImage img;

  Tower(float myX, float myY, int myCooldown, int myThreshold) {
    x = myX;
    y = myY;
    cooldown = myCooldown;
    threshold = myThreshold;
    size = 50;
  }

  Tower(float myX, float myY, int myCooldown, int myThreshold, PImage myImg) {
    this(myX, myY, myCooldown, myThreshold);
    img = myImg;
  }

  void show() {
    stroke(0);
    strokeWeight(0);
    fill(blue);
    square(x, y, size);
    
    if (img != null) {
      image(img, x, y, size, size);
    }
  }

  void act() {
    cooldown++;
    if (cooldown >= threshold && mobs.size() > 0) {
      bullets.add(new Bullet(x, y, 0, 6));
      bullets.add(new Bullet(x, y, 6, 0));
      bullets.add(new Bullet(x, y, 0, -6));
      bullets.add(new Bullet(x, y, -6, 0));
      cooldown = 0;
    }
  }
}
