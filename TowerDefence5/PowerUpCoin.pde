class PowerUpCoin extends PowerUp {

  PowerUpCoin() {
    x = random(0, 0.8*width);
    y = random(0, height);
    img = coin;
  }

  void act() {
    super.act();
    if (mouseReleased && touchingMouse(x, y, size, size)) {
      coins += 10;
      texts.add(new Text(x, y-12, 15, "Coins+10" ));
      hp = 0;
    }
  }


  void show() {
    super.show();
  }
}
