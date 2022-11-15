void options() {

  optionsScreen();
  optionsButtons();
  optionsMouse();
}

void optionsScreen() {
  background(lavender);
  fill(purple);
  textSize(30);
  text("Pick A Map", width/2, 80);
}


void optionsButtons() {
  map1button.act();
  map1button.show();
  map2button.act();
  map2button.show();
}

void optionsMouse() {
  if (mouseReleased) {
    if (map1button.clicked) {
      mode = PLAY;
      mapmode = MAP1;
      currNodeList = map1NodeList;
    } else if (map2button.clicked) {
      mode = PLAY;
      mapmode = MAP2;
      currNodeList = map2NodeList;
    }
  }
}
