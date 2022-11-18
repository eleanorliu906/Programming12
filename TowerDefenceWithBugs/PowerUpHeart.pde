class PowerUpHeart extends PowerUp {


  PowerUpHeart() {
    x = random(0, 0.8*width);
    y = random(0, height);
    img = heart;
  }

  void act() {
    if (mouseReleased && touchingMouse(x, y, size, size)) {
      lives++;
      texts.add(new Text(x, y-12, 15, "Lives+1" ));
      hp = 0;
    }
  }


  void show() {
    super.show();
  }
}
