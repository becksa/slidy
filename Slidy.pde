/* Dichiarazione dei paraetri */
boolean init_game;
boolean finish_game;
int counter_segment;
float speed;
int level;
int number_rectangle = 4;
int number_node;
int init_rectangle_x1;
int raggio;
float position_x;
float position_y;
String title;
float circleX, circleY;
float R = random(100, 255), G = random(100, 255), B = random(100, 255);

Rectangle[] baseRectangle = new Rectangle[number_rectangle];
Rectangle[] oppositeRectangle = new Rectangle[number_rectangle];
Segment segment;

void setup() {
  background(0); // sfondo nero
  fullScreen(); // schermo intero
  /* Creazione dei primi blocchi */
  init_rectangle_x1 = 0;
  for (int index = 0; index < baseRectangle.length; index++) {
    baseRectangle[index] = new Rectangle(init_rectangle_x1, height/2 + height/4, width/number_rectangle, height);
    oppositeRectangle[index] = new Rectangle(init_rectangle_x1, 0, width/number_rectangle, height/2 - height/4);
    init_rectangle_x1 += width/number_rectangle;
  }

  /* Inizializzazione dei parametri */
  init_game = false; //variabile per l'inizio del gioco
  finish_game = false; //variabile per la fine del gioco
  level = 0;
  number_node = 8;
  raggio = 5;
  title =  "Tap to start";
  segment = new Segment(width/20, number_node);
  speed = 2;
}

void draw() {
  background(0);// sfondo nero
  /* Visualizzazione dei blocchi di base e quelli opposti */
  for (int index = 0; index < baseRectangle.length; index++) {
    fill(R, G, B);
    stroke(255, 100);
    strokeWeight(height/100);
    baseRectangle[index].display();
    oppositeRectangle[index].display();
  }


  if (init_game) {
    segment.display();
    rectangleCollision();
    scrollingH();
    printLevel();
  } else {
    printTitle();
    printRecord();
    if (finish_game) {
      reset();
    }
  }
}

void mousePressed() {
  init_game = true;
  if (finish_game) { 
    finish_game = false;
    level = 0;
  }
}

void rectangleCollision() {
  if (counter_segment == number_node) { 
    counter_segment = 0;
  }
  for (Rectangle rectangle : baseRectangle) {
    if (segment.x[counter_segment] >=  rectangle.x1  && segment.x[counter_segment] <=  rectangle.x1+ rectangle.x2 && segment.y[counter_segment] >=  rectangle.y1 && segment.y[counter_segment] <=  rectangle.y2) {
      init_game = false;
      finish_game = true;
      title = "Game over, tap to restart";
    }
  }
  for (Rectangle rectangle : oppositeRectangle) {
    if (segment.x[counter_segment] >= rectangle.x1  && segment.x[counter_segment] <= rectangle.x1 + rectangle.x2 && segment.y[counter_segment] >= rectangle.y1 && segment.y[counter_segment] <= rectangle.y2) {
      init_game = false;
      finish_game = true;
      title = "Game over, tap to restart";
    }
  }
  counter_segment++;
}

void scrollingH() {
  for (int index = 0; index < number_rectangle; index++) {
    baseRectangle[index].x1 -= speed;
    if (baseRectangle[index].x1 + baseRectangle[index].x2 < 0) {
      baseRectangle[index].x1 = width;
      baseRectangle[index].y1 = random(height/2, height - height/10);
      level++;
      if (level%5==0) {
        speed = random(2, 10);
      }
    }
    oppositeRectangle[index].x1 += speed;
    if (oppositeRectangle[index].x1 >= width) {
      oppositeRectangle[index].x1 = -width/number_rectangle;
      oppositeRectangle[index].y2 = random(height/10, height/2);
    }
  }
}

void reset() {
  init_rectangle_x1 = 0;
  for (int index = 0; index < baseRectangle.length; index++) {
    baseRectangle[index].x1 = init_rectangle_x1;
    baseRectangle[index].y1 = height/2 + height/4;
    baseRectangle[index].x2 = width/number_rectangle;
    baseRectangle[index].y2 = height;
    oppositeRectangle[index].x1 = init_rectangle_x1;
    oppositeRectangle[index].y1 = 0;
    oppositeRectangle[index].x2 = width/number_rectangle;
    oppositeRectangle[index].y2 = height/2 - height/4;
    init_rectangle_x1 += width/number_rectangle;
  }
  speed = 2;
}