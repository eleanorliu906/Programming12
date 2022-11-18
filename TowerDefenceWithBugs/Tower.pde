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
  Button activateTower, upgradeTower;
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

  void act() {
    cooldown++;
  }

  void show() {
    if (towerMode == PLACING) {
      placeTower();
    } else if (towerMode == PLACED) {
      placedTower();
      showTowerButtons();
    }
  }

  void placeTower() {
    fill(c1);
    square(mouseX, mouseY, size);
    if (mouseReleased && mouseX < 0.8*width - size*0.5) {
      if (noTowersNearby(mouseX, mouseY)) {
        createTower();
      } else texts.add(new Text(mouseX, mouseY-30, 15, "Towers need to be placed apart" ));
    }
  }

  void placedTower() {
    stroke(0);
    strokeWeight(0);
    fill(c1);
    square(x, y, size);
  }

  void showTowerButtons() {
    if (mobs.size() > 0) {
      activateTower.act();
      if (cooldown >= threshold) {
        upgradeTower.show();
      }
    }
  }

  void createTower() {
    x = mouseX;
    y = mouseY;
    coins -= value;
    createTowerButtons();
    towerMode = PLACED;
    building = false;
    texts.add(new Text(x, y-30, 15, value + " Coins spent on " + name));
  }

  void createTowerButtons() {
    activateTower = new Button(firecracker, x, y, 0.8*size, 0.8*size, 0.7*size, 0.7*size, c2, c2);
    upgradeTower = new Button(upgrade, x, y+0.6*size, 0.8*size, 0.8*size, 0.7*size, 0.7*size, c2, c2);
    buttons.add(activateTower);
    buttons.add(upgradeTower);
  }

  boolean noTowersNearby(int myX, int myY) {
    boolean answer = true;
    for (int i = 0; i < towers.size()-1; i++) {
      Tower t = towers.get(i);
      if (myX > t.x - 0.5*t.size && myX < t.x + 0.5*t.size && myY > t.x - 0.5*t.size && myY < t.y + 0.5*t.size) {
        answer = false;
      }
    }
    return answer;
  }

  void edit() {
    if ( towerMode == PLACED) {
      upgradeTower.act();
      activateTower.show();
    }
  }
}
