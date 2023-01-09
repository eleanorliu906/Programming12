class FPlayer extends FBox {

  boolean[] keys;

  FPlayer(color c, boolean[] k) {
    super(gridSize, gridSize);
    setPosition(300, 0);
    setFillColor(c);
    keys = k; // copy by value of the reference
    //for (int i = 0; i < 4; i ++) {
    //  keys[i] = k[i];
    //  println(keys[i]);
    // copy by boolean values of true or false
    //}
  }

  void act() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (keys[0]) setVelocity(-200, vy);
    if (keys[1]) setVelocity(200, vy);
    if (keys[2]) setVelocity(vx, -200);
    if (keys[3]) setVelocity(vx, 200);
  }
}
