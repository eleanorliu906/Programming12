int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

color lightpink = #FFADCF;
color red = #FF0022;
color orange = #FC7536;
color yellow = #FFDF64;
color green = #81C14B;
color blue = #008BF8;
color purple = #8F008C;
color lavender = ##eee0ff;

void setup(){
  mode = INTRO;
  size(700, 700);
}

void draw(){
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER) gameover();
  else print(mode);

}
