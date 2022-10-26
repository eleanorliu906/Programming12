//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  float x, y, vx, vy;
  int hp;


  Mob(float myX, float myY, float myVX, float myVY) {
    x = myX;
    y = myY;
    vx = myVX;
    vy = myVY;
    hp = 100;
  }

  void show() {
    fill(lavender);
    strokeWeight(3);
    circle(x, y, 40);
  }

  void act() {
    x += vx;
    y += vy;

    println(y);

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
}
