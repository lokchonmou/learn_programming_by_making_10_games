class Spot {
    int w, h, x, y , i, j;
    Spot[] neighbors = new Spot[4];

    Spot(int _i, int _j){
        w = width/cols;
        h = height/rows;
        i = _i;
        j = _j;
        x = i*w+w/2;
        y = j*h+h/2;
    }

    void show(color c){
        fill(c);
        noStroke();
        rectMode(CENTER);
        rect(x, y ,w , h);
    }

    void addNeighbors(Spot[][] grid){
        //UP
        if (j > 0)
        neighbors[0]  = grid[i][j-1];
        if (j == 0)
        neighbors[0]  = grid[i][rows-1];
        //RIGHT
        if (i < cols -1)
        neighbors[1] = grid[i+1][j];
        if (i == cols -1)
        neighbors[1] = grid[0][j];
        //DOWN
        if (j < rows -1)
        neighbors[2] = grid[i][j+1];
        if (j == rows -1)
        neighbors[2] = grid[i][0];
        //LEFT
        if (i > 0)
        neighbors[3] = grid[i-1][j];
        if (i == 0)
        neighbors[3] = grid[cols -1][j];
    }
}
