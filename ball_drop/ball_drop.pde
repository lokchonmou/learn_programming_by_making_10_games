float ball_x, ball_y, speed_x=1.4, speed_y, a=1.;

void setup() {
  size(800, 600);
}

void draw() {
  fill(#FFFFFF, 3);
  rect(0,0, width, height);

  if (ball_x < width) {
    if (ball_y > height && speed_y >0) speed_y = -speed_y*.85;
    ball_x += speed_x;
    speed_y += a;
    ball_y += speed_y;


    fill(#0000AA);
    ellipse(ball_x, ball_y, 20, 20);
    println(ball_y, speed_y);
  } else noLoop();
}