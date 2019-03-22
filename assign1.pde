PImage bg, soil;
PImage life;
PImage groundhog, robot, soldier;

int soldierX = 0;
int soldierY;
int robotX, robotY;
int laserX = 0;
int laserLength = 0;

void setup() {
	size(640, 480, P2D);
  
// background, soil
  bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  
//three lives
  life = loadImage("img/life.png");

//groundhog, robot, soldier
  groundhog = loadImage("img/groundhog.png");
  robot = loadImage("img/robot.png");
  soldier = loadImage("img/soldier.png");

  soldierY = floor(random(4)+2)*80; 
  robotX = floor(random(400))+160;
  robotY = floor(random(4)+2)*80;
  
}

void draw() {
  
  image (bg, 0, 0);
  image (soil, 0, 160);

//grass
  noStroke();
  fill(124, 204, 25);
  rect(0, 145, 640, 15);

//sun
  stroke(255, 255, 0);
  strokeWeight(5);
  fill(253, 184, 19);
  ellipse(590, 50, 120, 120);
  
  image (life, 10, 10);
  image (life, 80, 10);
  image (life, 150, 10);
  image (groundhog, 280, 80);
  image (soldier, soldierX-80, soldierY); 
  image (robot, robotX, robotY);
  
//Laser
  noStroke();
  fill(255, 0 ,0);
  ellipse(robotX+25-laserX, robotY+37, 10, 10);
  rect(robotX+25-laserX, robotY+32, laserLength, 10);
  ellipse(robotX+25-max(laserX-40, 0), robotY+37, 10, 10);
  
  soldierX += 2;
  soldierX %=720;
  laserX += 2;
  laserX %=180;
  laserLength = laserX-max(laserX-40,0);//the distance between two ellipses

}

