import fisica.*;
FWorld world;

color black = #000000;
color green = #65eb50;
color red = #ff0000;
color blue = #00b7ef;
color orange = #f0a000;
color brown = #9c5a3c;

PImage map;
int gridSize = 20;

void setup() {
  size(600, 600);
  Fisica.init(this);
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  map = loadImage("map.png");

  for (int j = 0; j <= map.height; j++) {
    for (int i = 0; i <= map.width; i++) {
      color c = map.get(i, j);
      // print(c);
      if (c == brown) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(i*gridSize, j*gridSize);
        b.setStatic(true);
        b.setGrabbable(false);
        world.add(b);
      }
    }
  }
}
void draw() {
  world.step();
  world.draw();
}
