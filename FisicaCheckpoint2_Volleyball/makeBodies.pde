void makeBox(float x, float y, float w, float h, color c) {
  FBox box = new FBox(w, h);
  box.setPosition(x, y);
  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(c);
  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(1);
  world.add(box);
}
