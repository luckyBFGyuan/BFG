float x = 310;   
float y1 = 150;    



float speed1 = 0; 



float gravity = 0.1;  


void setup() {
size(600, 500);

}

void draw() {
  background(255);


  fill(192,192,192);
  noStroke();
  ellipseMode(CENTER);
  strokeWeight(y1/8);

  ellipse(x, y1, 70, 70);




  y1 = y1 + speed1;
 

  speed1 = speed1 + gravity;


  if (y1 > height - 50) {
    speed1 = speed1 * -0.95;
    y1 = height - 50;
  }
  

 

  
}