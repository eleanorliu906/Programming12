void mouseReleased(){
  if (mode == INTRO) introClicks();
  if (mode == GAME) gameClicks();
  if (mode == GAMEOVER) gameoverClicks();
}
