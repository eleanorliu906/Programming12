class FHammerBro extends FGoomba {
  // int direction = L;
  // int speed = 50;
  // int frameIdx = 0;

  FHammerBro(float x, float y) {
    super(x, y);
    setName("hammerbro");
  }

  void act() {
    animate();
    collide();
    move();
  }
  
  void move(){
    super.move();
  }
  
  void animate() {
    if (frameIdx >= hammerbro.length) frameIdx = 0;
    if (frameCount % 20 == 0) { // happens every 5 frames
      if (direction == R) attachImage(hammerbro[frameIdx]);
      else if (direction == L) attachImage(flipImage(hammerbro[frameIdx]));
      frameIdx++;
      println(direction);
    }
  }
}
