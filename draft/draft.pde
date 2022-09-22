ArrayList<Integer> roundNumbers = new ArrayList<Integer>();
ArrayList<Integer> scoresPerRound = new ArrayList<Integer>();
float xgrids, highScore;

void setup() {
  size(400, 600);
  roundNumbers.add(1);
  roundNumbers.add(2);
  roundNumbers.add(3);
  scoresPerRound.add(5);
  scoresPerRound.add(7);
  scoresPerRound.add(5);
  textAlign(CENTER, CENTER);
}

void draw() {
  showGraph();
}

int max(ArrayList<Integer> arr) {
  int l = arr.size();
  int max = Integer.MIN_VALUE;
  for (int i = 0; i < l; i++) {
    if (arr.get(i) > max) max = arr.get(i);
  }
  return max;
}

void showGraph() {
  line(50, 250, 50, 450);
  line(25, 425, 375, 425);

  pushMatrix();
  translate(40, 350);
  rotate(3*PI/2);
  fill(255);
  text("Score", 0, 0);
  popMatrix();
  fill(255);
  text("Rounds", width/2, 430);

  xgrids = roundNumbers.get(roundNumbers.size() -1);
  highScore = max(scoresPerRound);

  int l = scoresPerRound.size();

  for (int i = 0; i < l; i++) {
    float circleX = map( (i+1), 1, l, 75, 350);
    float circleY = map( scoresPerRound.get(i), 0, highScore, 275, 400);

    fill(0);
    circle(circleX, circleY, 5);

    if (i > 0) {
      float pastCircleX = circleX;
      float pastCircleY = circleY;
    }

    line (circleX, circleY, pastCircleX, pastCircleY);
  }
}
