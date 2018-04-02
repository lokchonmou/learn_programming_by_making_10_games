int cols = 20, rows = 20;
Spot[][] grid = new Spot[cols][rows];
ArrayList<Spot> Snake = new ArrayList<Spot>();
ArrayList<Spot> Food = new ArrayList<Spot>();
Spot current, next;
boolean GAME_OVER, foodadded;
long score;


void setup() {
    size(600, 600);
    frameRate(10);
    GAME_OVER = false;
    score = 0;
    foodadded = true;
    textAlign(CENTER, CENTER);
    textSize(56);
    for (int i=0; i < cols; i++){
        for (int j=0; j <rows; j++)
        grid[i][j] = new Spot(i, j);
    }

    for (int i=0; i < cols; i++){
        for (int j=0; j <rows; j++)
        grid[i][j].addNeighbors(grid);
    }

    Snake.clear();
    current = grid[cols/2][rows/2];
    for (int i = 3; i>=0; i--)
    Snake.add(grid[cols/2+i][rows/2]);

    Food.clear();
    addFood();
}

void draw() {
    if (GAME_OVER == false){
        for (int i=0; i < cols; i++){
            for (int j=0; j <rows; j++)
            grid[i][j].show(#29A9FC);
        }
        for (int i=0; i<Food.size(); i++) Food.get(i).show(#0000FF);
        for (int i=0; i<Snake.size(); i++)  Snake.get(i).show(#00FF00);
        current.show(#00AA00);

        int id = 3;
        if (keyCode == UP) id = 0;
        if (keyCode == RIGHT) id = 1;
        if (keyCode == DOWN) id = 2;
        if (keyCode == LEFT) id = 3;

        next = current.neighbors[id];

        if (Snake.contains(next)) GAME_OVER = true;
        else if (Food.contains(next)){
            score++;
            //add extra food every 5 mark
            if (score%5 == 0) foodadded = false;
            if (foodadded == false){
                    addFood();
                    foodadded = true;
                }
            
            //==========================
            current = next;
            Snake.add(next);
            addFood();
            Food.remove(next);
        }
        else{
            current = next;
            Snake.add(next);
            Snake.remove(0);
        }



        fill(#FFFF00);
        textSize(24);
        text(nf(score), width-30, 30);
    }
    else {
        fill(#FF0000);
        text("GAME OVER", width/2, height/2);
    }
}

void keyPressed(){
    if (key == 'r' || key == 'R') setup();
}

void addFood(){
    Spot temp;
    while (true){
        temp = grid[int(random(0, cols))][int(random(0, rows))];
        if (!Snake.contains(temp) && !Food.contains(temp)) {
            Food.add(temp);
            return;
        }
    }
}
