void options() {
  background(lavender);
  optionsMouse();
}

void optionsMouse() {
  if (mouseReleased)  mode = PLAY;
  mapmode = MAP2;
  currNodeList = map2NodeList;
}
