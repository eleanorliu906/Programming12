//Nodes are invisible objects that we place on the map
//to direct the flow of mobs. When a mob collides with
//a node object, it will change direction according to
//the node's instructions.

class Node {
  float x, y, dx, dy;

  Node(float _x, float _y, float _dx, float _dy) {
    x = _x;
    y = _y;
    dx = _dx;
    dy = _dy;
  }

  void show() {
    fill(red);
    stroke(red);
    strokeWeight(3);

    circle(x, y, 15);
    line(x, y, x+dx*30, y+dy*30);
  }
}
