void mouseReleased(){
  
  if (mode == INTRO) introClicks();
  if (mode == GAME) gameClicks();
  if (mode == PAUSE) pauseClicks();
  if (mode == GAMEOVER) gameoverClicks();

}
