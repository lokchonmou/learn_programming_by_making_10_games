float ball_x, ball_y, speed_x, speed_y, a;
float block_x[] = new float[7], block_y[] = new float[7], block_width = 150, block_height = 20;
boolean GAME_OVER;

void setup() {
  size(600, 700);
  ball_x  = width/2;
  ball_y = 20;
  speed_y = .5;
  a = .5;
  GAME_OVER = false;
  rectMode(CENTER);
  for (int i=0; i <=6; i++) {
    block_x[i] = random(0, width);
    block_y[i] = height - 10 + 100*i;
  }
  textAlign(CENTER, CENTER);
  textSize(48);
}

void draw() {
  if (GAME_OVER == false) {
    background(#2A60E5);

    ball_y += speed_y;
    speed_y +=a;
    speed_y = constrain(speed_y, -10, 10);

    for (int i=0; i <=6; i++) {
      block_y[i] -= 4;

      fill(#5BA9FA);
      rect(block_x[i], block_y[i], block_width, block_height);

      if (ball_x > block_x[i] - block_width/2 && ball_x < block_x[i] + block_width/2 && 
        ball_y > block_y[i] - block_height/2 - 20 && ball_y < block_y[i] + block_height/2 -20) {
        ball_y = block_y[i] - 20;
        speed_y = 0;
      }
      if (block_y[i] < 0) {
        block_x[i] = random(0, width);
        block_y[i] = height - 10;
      }
    }

    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT) ball_x -= 10;
        if (keyCode == RIGHT) ball_x +=10;
      }
    }

    ball_x = constrain(ball_x, 0, width);
    fill(#F9FF4D);
    ellipse(ball_x, ball_y, 20, 20);
    if (ball_y > height || ball_y <0) GAME_OVER = true;
  } else {
    fill(#FF0000);
    text("GAME OVER", width/2, height/2);
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') setup();
}