float ball_x, ball_y;
float speed_x, speed_y;
boolean GAME_OVER = false;

void setup(){
 size(600,600);
 ball_x = random(0, width);
 ball_y = random(0, height/2);
 speed_x = random(-5,5);
 speed_y = random(0,5);
 //println(ball_x, ball_y);
 textAlign(CENTER, CENTER);
 textSize(24);
}

void draw(){
 if (GAME_OVER == false){
  background(#4373FF);
  ellipse(ball_x, ball_y, 20,20);
  
  if (ball_x > width || ball_x <0) speed_x = speed_x * -1;
  if ((ball_y > height-15 && ball_x < mouseX +50 && ball_x > mouseX -50) || ball_y < 0) speed_y = speed_y * -1;
  if (ball_y > height) GAME_OVER = true;
  
  rectMode(CENTER);
  rect(mouseX, height -10, 100, 10);
  
  ball_x = ball_x + speed_x;
  ball_y = ball_y + speed_y;
 }
 else{
   text("GAME OVER", width/2, height/2);
 }
}