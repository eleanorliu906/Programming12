int n;
Button[] myButtons;

ArrayList<Gif> myGifs = new ArrayList<Gif>();
Gif currGif;

color darkblue = #587291;
color blue = #2F97C1;
color turquoise = #1CCAD8;
color aqua = #15E6CD;
color green = #0CF574;
color lime = #a4ed68;
color orange = #F7B267;
color salmon = #F27059;
color lightyellow = #FFFF82;
color yellow = #FFAE03;

color currBackground;

boolean mouseReleased, wasPressed;

PImage flower;
PImage tv;

void setup() {
  size(600, 600);
  n = 5;
  myButtons = new Button[n];
  mouseReleased = false;
  wasPressed = false;
  currBackground = 255;

  flower =  loadImage("forget-me-not-flower.jpeg");
  tv = loadImage("tv.png");

  initializeButtons();
  initializeGifs();
}

void draw() {
  background(currBackground);

  runButtons();
  click();
  drawTV();
}

void drawTV() {
  imageMode(CENTER);
  image(tv, width/2, 250, 480, 360);

  if (currGif != null) {
    currGif.show();
    currGif.act();
  }
}

void initializeButtons() {
  myButtons[0] = new Button("Orange", 60, 540, 100, 80, orange, salmon);
  myButtons[1] = new Button("Yellow", 180, 540, 100, 80, lightyellow, yellow);
  myButtons[2] = new Button("Green", 300, 540, 100, 80, lime, green);
  myButtons[3] = new Button("Turqoise", 420, 540, 100, 80, aqua, turquoise);
  myButtons[4] = new Button(flower, 540, 540, 100, 80, blue, darkblue);
}

void  initializeGifs() {
  myGifs.add(new Gif("frame_", "_delay-0.1s", 34, "orange", 10));
  myGifs.add(new Gif("frame_", "_delay-0.07s", 24, "yellow", 7));
  myGifs.add(new Gif("frame_", "_delay-0.05s", 21, "green", 5));
  myGifs.add(new Gif("frame_", "_delay-0.1s", 14, "aqua", 10));
  myGifs.add(new Gif("frame_", "_delay-0.06s", 26, "blue", 6));
}

void runButtons() {
  for (int i = 0; i < n; i ++) {
    myButtons[i].act();
    myButtons[i].show();
    if (myButtons[i].clicked) {
      currGif = myGifs.get(i);
    }
  }
}
