float ball_x, ball_y;
float speed_x, speed_y;
boolean GAME_OVER = false, YOU_WIN = false;
float slider_width = 100;
boolean[][] first_attack = new boolean[2][8];

void setup() {
  size(600, 600);
  ball_x = random(0, width);
  ball_y = random(0, height/2);
  speed_x = random(-5, 5);
  speed_y = random(4, 5);
  //println(ball_x, ball_y);
  textAlign(CENTER, CENTER);
  textSize(24);
  GAME_OVER = false;
  YOU_WIN = false;
  for (int j=0; j <= 1; j++)
    for (int i=0; i <= 7; i++) {
      first_attack[j][i] = false;
    }
}

void draw() {
  if (YOU_WIN == false) {
    if (GAME_OVER == false) {
      background(#4373FF);

      fill(#FFFE95);
      ellipse(ball_x, ball_y, 20, 20);

      fill(#FF0000);

      boolean temp = true;

      for (int j=0; j <= 1; j++)
        for (int i=0; i <= 7; i++) {
          float rect_center_x = 125+i*50;
          float rect_center_y =  125+j*50;
          if (ball_x < rect_center_x+25 && ball_x > rect_center_x-25 && ball_y < rect_center_y +25 && ball_y > rect_center_y-25)
            first_attack[j][i] = true;
          if (first_attack[j][i] == false) rect(rect_center_x, rect_center_y, 50, 50);

          temp = temp & first_attack[j][i];
        }

      if (temp == true) YOU_WIN = true;

      if (ball_x > width || ball_x < 0) speed_x *=  -1;
      if ((ball_y >height - 15 &&  ball_x < mouseX +slider_width/2 && ball_x > mouseX - slider_width/2 ) || ball_y < 0) speed_y = speed_y * -1;
      if (ball_y > height) GAME_OVER = true;

      fill(#21DCFF);
      rectMode(CENTER);
      rect(mouseX, height - 10, slider_width, 10);

      ball_x += speed_x;
      ball_y += speed_y;
    } else {
      text("GAME OVER", width/2, height/2);
    }
  } else {
    text("YOU WIN", width/2, height/2);
  }
}

void keyPressed(){
  if (key == 'r' || key == 'R'){
    //if (GAME_OVER == true || YOU_WIN == true)
      setup();
  }
}