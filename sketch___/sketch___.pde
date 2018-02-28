float x = 200;   
float y = 500;    
float speed = 0; 
float gravity = 0.1;  
import java.util.*;
import processing.sound.*;
SoundFile someMusicFile;
ArrayList<Snow> snows;
void setup() {
  size(800, 640);
  textSize(24);
   someMusicFile = new SoundFile(this, "mu.mp3");
      someMusicFile.play();
  snows = new ArrayList<Snow>();
  loadSnow();
}

void draw() {
 fill(255);
 background(25, 151, 255);
  fill(255);
  rect(0,605,800,140);
   fill(#F57E23);
  ellipse(x-10,y+90,80,30);//foot
  ellipse(x+40,y+90,80,30);//foot
    fill(0);
  ellipse(x+10,y+30,120,140);//du
  ellipse(x+10,y-40,90,100);//tou 
    fill(0);
  triangle(x-80,y+50,x+20,y,x-20,y-30);
  triangle(x+25,y+50,x+100,y-20,x-20,y-30);
  fill(255);
  ellipse(x+10,y+30,80,80);//baidu
 ellipse(x-10,y-60,15,20);//yanjing
  ellipse(x+25,y-60,15,20);//yanjing
  fill(0);

 ellipse(x-10,y-60,10,10);//yuanquan
  ellipse(x+25,y-60,10,10);//yanquan
  fill(#F57E23);
  triangle(x-10,y-50,x+25,y-50,x+7,y-30);//zhui 
     y= y + speed;
 speed = speed + gravity;
 if (y > height - 140) {
    speed = speed * -0.95;
    y = height - 140;
 }
  translate(142,0);
   fill(#F57E23);
  ellipse(x-10,y+90,80,30);//foot
  ellipse(x+40,y+90,80,30);//foot
    fill(0);
  ellipse(x+10,y+30,120,140);//du
  ellipse(x+10,y-40,90,100);//tou 
    fill(0);
  triangle(x-80,y+50,x+20,y,x-20,y-30);
  triangle(x+25,y+50,x+100,y-20,x-20,y-30);
  fill(255);
  ellipse(x+10,y+30,80,80);//baidu
 ellipse(x-10,y-60,15,20);//yanjing
  ellipse(x+25,y-60,15,20);//yanjing
  fill(0);

 ellipse(x-10,y-60,10,10);//yuanquan
  ellipse(x+25,y-60,10,10);//yanquan
  fill(#F57E23);
  triangle(x-10,y-50,x+25,y-50,x+7,y-30);//zhui 
  
   y= y + speed;
 speed = speed + gravity;
 if (y > height - 130) {
    speed = speed * -0.95;
    y = height - 130;
  }
   if (mousePressed){
     fill(#F50707);
    text("Be sure to keep warm in the winter, happy",30,140);
   }
 
  if ((frameCount % 3) == 0) {
    addSnow();
  }
   
  drawSnow();
  for(int i = 0; i < snows.size(); i++){
    Snow s = snows.get(i);
    if(s.death){
      snows.remove(s);
    } 
  }
}


void loadSnow() {
  for (int i = 0; i < 1; i++) {
    snows.add(new Snow());
  }
}

void drawSnow() {
  for (Snow s: snows) {
    s.display();
  }
}

void addSnow() {
  snows.add(new Snow());
}
class Snow {
  PVector location;
  PVector acceleration;
  PVector velocity;
  PVector wind;
  PVector gravity;

  float snowHeight, snowWidth;
  float mass;

  boolean death = false;

  Snow() {
    snowHeight = random(5, 60);
    snowWidth  = snowHeight;
    location = new PVector(random(width), -snowHeight);
    velocity   = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    wind = new PVector(random(-0.004, 0.004), 0);

    mass = 100/snowWidth;
    gravity = new PVector(0, 0.05);
  }

  void display() {
    drawSnow();
    moveSnow();
    applyForce(gravity);
    applyForce(wind);
  }

  void drawSnow() {
    noStroke();
    fill(255, 200);
    ellipse(location.x, location.y, snowWidth, snowHeight);
     }
 void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void moveSnow() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    if (location.y > height+snowHeight) {
      death = true;
    
    }
  }
}