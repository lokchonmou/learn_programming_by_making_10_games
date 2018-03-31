int cols = 20, rows = 20;
Spot[][] grid = new Spot[cols][rows];
ArrayList<Spot> Snake = new ArrayList<Spot>();
Spot current, next;
boolean GAME_OVER;

void setup() {
    size(600, 600);
    frameRate(10);
    GAME_OVER = false;
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
}

void draw() {
    if (GAME_OVER == false){
        for (int i=0; i < cols; i++){
            for (int j=0; j <rows; j++)
            grid[i][j].show(#29A9FC);
        }

        for (int i=0; i<Snake.size(); i++)  Snake.get(i).show(#00FF00);
        current.show(#00AA00);

        int id = 3;
        if (keyCode == UP) id = 0;
        if (keyCode == RIGHT) id = 1;
        if (keyCode == DOWN) id = 2;
        if (keyCode == LEFT) id = 3;

        next = current.neighbors[id];

        if (Snake.contains(next)) GAME_OVER = true;
        else{
            current = next;
            Snake.add(next);
            Snake.remove(0);
        }
    }
    else {
        fill(#FF0000);
        text("GAME OVER", width/2, height/2);
    }
}