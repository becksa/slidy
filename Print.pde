void printLevel() {
  int size = width/10;
  fill(255, 200);
  textSize(size);
  textAlign(RIGHT);
  text(level, width/8, height/10);
}

void printTitle() {
  int size = width/5;
  fill(255, 200);
  textSize(size);
  textAlign(CENTER);
  stroke(255, 100);
  line(0, height/2 - height/10, width, height/2 -  height/10);
  line(0, height/2 + height/30, width, height/2 + height/30);
  text("Slidy", width/2, height/2);
  textSize(size/3);
  text(title, width/2, height/3);
}

void printRecord() {
  int size = width/5;
  fill(255, 200);
  stroke(255, 100);
  textAlign(CENTER);
  textSize(size/2);
  text(level, width/2, height/2 + height/5);
}