void loadTreeTrunk(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.attachImage(treetrunk);
  b.setSensor(true);
  loadBlock(x, y, b);
}

void loadStone(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.attachImage(stone);
  b.setFriction(1);
  loadBlock(x, y, b);
}

void loadIce(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setFriction(0);
  b.attachImage(ice);
  loadBlock(x, y, b);
}

void loadMiddleTree(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.attachImage(middletree);
  loadBlock(x, y, b);
}

void loadNormalTree(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.attachImage(normaltree);
  loadBlock(x, y, b);
}

void loadBlock(int x, int y, FBox b) {
  b.setPosition(x*gridSize, y*gridSize);
  b.setStatic(true);
  b.setGrabbable(false);
  world.add(b);
}

void loadRightTree(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.attachImage(righttree);
  loadBlock(x, y, b);
}

void loadLeftTree(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.attachImage(lefttree);
  loadBlock(x, y, b);
}
