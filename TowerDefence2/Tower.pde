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
  color c1, c2;
  Button towerButton;
  int value;
  String name;

  final int PLACING = 0;
  final int PLACED = 1;
  int towerMode;

  Tower() {
  }

  Tower(float myX, float myY, int myCooldown, int myThreshold) {
    x = myX;
    y = myY;
    cooldown = myCooldown;
    threshold = myThreshold;
    size = 50;
    value = 10;

    towerMode = PLACING;
  }

  Tower(float myX, float myY, int myCooldown, int myThreshold, PImage myImg) {
    this(myX, myY, myCooldown, myThreshold);
    img = myImg;
  }

  void show() {
    if (towerMode == PLACING) {
      placeTower();
    } else if (towerMode == PLACED) {
      placedTower();
      showTowerButtons();
    }
  }

  void act() {
    cooldown++;
  }

  void placeTower() {
    fill(c1);
    square(mouseX, mouseY, size);
    if (mouseReleased && mouseX < 0.8*width - size*0.5) {
      x = mouseX;
      y = mouseY;
      money -= value;
      towerButton = new Button(firecracker, x, y, 0.8*size, 0.8*size, 0.7*size, 0.7*size, c2, c2);
      buttons.add(towerButton);
      towerMode = PLACED;
      building = false;
      texts.add(new Text(x, y-30, 15, value + " Coins spent on " + name));
    }
  }

  void placedTower() {
    stroke(0);
    strokeWeight(0);
    fill(c1);
    square(x, y, size);

    if (img != null) {
      towerImage();
    }
  }

  void showTowerButtons() {

    if (mobs.size() > 0) {
      towerButton.act();
      if (cooldown >= threshold) {
        towerButton.show();
      }
    }
  }

  void towerImage() {
    image(img, x, y, size, size);
  }
}
