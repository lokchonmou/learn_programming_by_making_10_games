class bullet {
  float bullet_x, bullet_y, b_speed_x, b_speed_y;
  float bullet_size;
  int [][] bullet_dir = {{0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, -1}};

  bullet() {
    bullet_size = 10;

    int random_number = int(random(0, 8));
    bullet_x = bullet_dir[random_number][0]*width + random(0, width);
    bullet_y= bullet_dir[random_number][1]*height + random(0, height);
    b_speed_x = -bullet_dir[random_number][0]*random(3, 5);
    b_speed_y = -bullet_dir[random_number][1]*random(3, 5);
  }

  void update() {
    bullet_x += b_speed_x;
    bullet_y += b_speed_y;

    if (dist(moving_ball_x, moving_ball_y, bullet_x, bullet_y) <= moving_ball_size/2+ bullet_size/2) 
      GAME_OVER = true;
    fill(#FFFA5D);
    noStroke();
    ellipse(bullet_x, bullet_y, bullet_size, bullet_size);
  }

}