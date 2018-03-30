float moving_ball_x, moving_ball_y, moving_ball_size;
int number_of_bullet = 50;
boolean GAME_OVER;
bullet[] b = new bullet[number_of_bullet];
long timer;

void setup() {
  size(600, 600);
  moving_ball_size = 20;
  moving_ball_x = width/2;
  moving_ball_y = height/2;

  for (int i =0; i < b.length; i++) b[i] = new bullet();

  GAME_OVER = false;
  textAlign(CENTER, CENTER);
  textSize(48);
  timer = millis();
}

void draw() {
  if (!GAME_OVER) {
    background(#4097FF);
    moving_ball_x = mouseX;
    moving_ball_y = mouseY;
    fill(#FF2612);
    stroke(0);
    ellipse(moving_ball_x, moving_ball_y, moving_ball_size, moving_ball_size);
    
    for (int i =0; i < b.length; i++) b[i].update();
    
    if (millis() - timer >=6000){
      setup();
     timer = millis(); 
    }
    
  } else {
    textSize(48);
    fill(255, 0, 0);
    text("GAME OVER", width/2, height/2);
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') setup();
}