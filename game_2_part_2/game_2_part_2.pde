float ball_x, ball_y, speed_x, speed_y, a;
float block_x[] = new float[7], block_y[] = new float[7], block_width = 150, block_height = 20;
int bType[] = new int[7]; //0 normal, 1 jump, 2 slide left, 3 slide right, 4 kill
boolean GAME_OVER;
color[] c = {#5BA9FA, #30FA49, #BDA9BF, #A9ABBF, #E0020A};
int life, score;
long timer;

void setup() {
  size(600, 700);
  ball_x  = width/2;
  ball_y = 20;
  speed_y = .5;
  a = .5;
  life = 100;
  score =0;
  GAME_OVER = false;
  rectMode(CENTER);
  for (int i=0; i <=6; i++) {
    block_x[i] = random(0, width);
    block_y[i] = height - 10 + 100*i;
    bType[i] = int(random(0, 5));
  }
  textAlign(CENTER, CENTER);
  textSize(48);
}

void draw() {
  if (GAME_OVER == false) {
    background(#2A60E5);

    ball_y += speed_y;
    speed_y +=a;
    speed_y = constrain(speed_y, -15, 15);

    for (int i=0; i <=6; i++) {
      block_y[i] -= 4;

      fill(c[bType[i]]);
      rect(block_x[i], block_y[i], block_width, block_height);

      if (ball_x > block_x[i] - block_width/2 && ball_x < block_x[i] + block_width/2 && 
        ball_y > block_y[i] - block_height/2 - 20 && ball_y < block_y[i] + block_height/2 -20) {
        if (bType[i] == 0) { //normal
          ball_y = block_y[i] - 20;
          speed_y = 0;
        }
        else if (bType[i] == 1) { //jump
          //ball_y = block_y[i] - 20;
          speed_y = -12;
        }
         else if (bType[i] == 2) { //slide left
          ball_y = block_y[i] - 20;
          ball_x -=4;
          speed_y =0;
        }
         else if (bType[i] == 3) { //slide right
          ball_y = block_y[i] - 20;
          ball_x +=4;
          speed_y =0;
        }
         else if (bType[i] == 4) { //slide right
          ball_y = block_y[i] - 20;
          life -=2;
          speed_y =0;
        }
        
      }

      if (block_y[i] < 0) {
        block_x[i] = random(0, width);
        block_y[i] = height - 10;
        bType[i] = int(random(0, 5));
        score++;
      }
    }

    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT) ball_x -= 10;
        if (keyCode == RIGHT) ball_x +=10;
      }
    }
    
    if (millis() - timer >= 3000){
      life +=10;
     timer = millis(); 
    }
    
    ball_x = constrain(ball_x, 0, width);
    fill(#F9FF4D);
    ellipse(ball_x, ball_y, 20, 20);
    
    if (ball_y > height || life <=0 ) GAME_OVER = true;
    if (ball_y < 0) life-=4;
    
    textSize(24);
    fill(#98DB7C);
    text("score \n"+ score, width - 60, 40);
    life = constrain(life,0,100);
    text("Life \n"+life, 60,40);
  } else {
    textSize(48);
    fill(#FF0000);
    text("GAME OVER", width/2, height/2);
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') setup();
}