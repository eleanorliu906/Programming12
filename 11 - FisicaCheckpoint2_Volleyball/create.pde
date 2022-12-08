void createBodies() {
  leftPlayer = new FBox(100, 100);
  leftPlayer.setPosition(0.25*width, 0.80*height);
  leftPlayer.setStroke(0);
  leftPlayer.setStrokeWeight(1);
  leftPlayer.setFillColor(orange);
  leftPlayer.setDensity(5);
  leftPlayer.setFriction(0);
  leftPlayer.setRestitution(0);
  world.add(leftPlayer);

  rightPlayer = new FBox(100, 100);
  rightPlayer.setPosition(0.75*width, 0.80*height);
  rightPlayer.setStroke(0);
  rightPlayer.setStrokeWeight(1);
  rightPlayer.setFillColor(yellowgreen);
  rightPlayer.setDensity(5);
  rightPlayer.setFriction(0);
  rightPlayer.setRestitution(0);
  world.add(rightPlayer);

  leftGround = new FBox(0.5*width, 100);
  leftGround.setPosition(0.25*width, 550);
  leftGround.setStroke(0);
  leftGround.setStrokeWeight(1);
  leftGround.setFillColor(orange);
  // leftGround.setDensity(0.2);
  leftGround.setFriction(0);
  leftGround.setRestitution(0);
  leftGround.setStatic(true);
  world.add(leftGround);

  rightGround = new FBox(0.5*width, 100);
  rightGround.setPosition(0.75*width, 550);
  rightGround.setStroke(0);
  rightGround.setStrokeWeight(1);
  rightGround.setFillColor(yellowgreen);
  // rightGround.setDensity(0.2);
  rightGround.setFriction(0);
  rightGround.setRestitution(0);
  rightGround.setStatic(true);
  world.add(rightGround);

  net = new FBox(25, 240);
  net.setPosition(0.5*width, 380);
  net.setStroke(0);
  net.setStrokeWeight(1);
  net.setFillColor(white);
  net.setDensity(0.2);
  net.setFriction(1);
  net.setRestitution(0);
  net.setStatic(true);
  world.add(net);

  ball = new FCircle(70);
  ball.setPosition(0.25*width, 222);
  ball.setStroke(0);
  ball.setStrokeWeight(1);
  ball.setFillColor(white);
  ball.setDensity(0.2);
  ball.setFriction(1);
  ball.setRestitution(1);
  world.add(ball);
}
