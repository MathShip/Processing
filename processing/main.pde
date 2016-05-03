import processing.serial.*;

int position = 0,
    score = 0,
    portRead;
boolean checkedCollision,
        doubleCollision,
        newSet = true; 

Serial port;
Entity[] rings;
Entity spaceship;
Question question;
PFont font, ringFont;
PImage background;

boolean checkCollision(Entity a, Entity b) {
  boolean c1 = a.getX() + a.getW() < b.getX(),
          c2 = b.getX() + b.getW() < a.getX(),
          c3 = a.getY() + a.getH() < b.getY(),
          c4 = b.getY() + b.getH() < a.getY();
  
  return !(c1 || c2 || c3 || c4); 
}

void setup() {
  fullScreen();
  noCursor();
  background = loadImage("img/background.png");
  font = createFont("ErasITC-Bold-48", 60);
  ringFont = createFont("ErasITC-Bold-48", 32);
  port = new Serial(this, Serial.list()[0], 9600);
}

void draw() {
  background(background);
  if (newSet) {
    question = new Question(20);
    int randomChoice = (int)random(0, 2);
    rings = new Entity[3];
    for (int i = 0; i < 3; i++) {
      if (i == randomChoice) {
        rings[i] = new Ring(width, 100 + 230 * i, question.getAnswer(), ringFont);
      } else {
        do {
          rings[i] = new Ring(width, 100 + 230 * i, (int)random(0, question.getMax()), ringFont);
        } while (((Ring)rings[i]).getValue() == question.getAnswer());
      }
    }
    spaceship = new Spaceship(50, 320);
    newSet = false;
    checkedCollision = false;
    doubleCollision = false;
  }
  fill(255);
  textAlign(RIGHT);
  text(score + "", width - 30, 50);
  textAlign(CENTER);
  question.drawSelf();
  if (0 < port.available()) {
    portRead = port.read();
    if (portRead < 50) {
      position = 600 - (25 / 2) * (port.read() - 2);
    }
  }
  
  ((Spaceship)spaceship).setPos(position);
  ((Spaceship)spaceship).drawSelf();
  
  if (!checkedCollision) {
      //2 collisions
      if (checkCollision(spaceship, rings[0]) && checkCollision(spaceship, rings[1])) {
        ((Ring)rings[0]).changeState(false);
        ((Ring)rings[1]).changeState(false);
        doubleCollision = true;
        score = score > 0 ? score - 50 : score;
      } else if (checkCollision(spaceship, rings[1]) && checkCollision(spaceship, rings[2])) {
        ((Ring)rings[1]).changeState(false);
        ((Ring)rings[2]).changeState(false);
        doubleCollision = true;
        score = score > 0 ? score - 50 : score;
      }
      
      //1 collision
      if (!doubleCollision) {
        for (Entity e : rings) {
          if (checkCollision(spaceship, e)) {
            ((Ring)e).changeState(((Ring)e).getValue() == question.getAnswer());
            score = ((Ring)e).getValue() == question.getAnswer() ? score + 100 : (score > 0 ? score - 50 : score);
            checkedCollision = true;
          }
        }
     }
  }


  for (Entity e : rings) {  
    e.drawSelf();
  }
  
  newSet = rings[0].getX() + rings[0].getW() == 0;
  port.clear();
}