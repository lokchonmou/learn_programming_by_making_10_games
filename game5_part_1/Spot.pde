class Spot {
    int x, y, i, j, w, h;
    ArrayList<Spot> neighbors = new ArrayList<Spot>();
    long score;
    boolean wall;
    Spot(int _i, int _j) {
        w = width/cols;
        h = height/rows;
        i = _i;
        j = _j;
        x = i * w + w/2;
        y = j * h + h/2;
        score = 9999;
    }

    void addWall(){
        while(true){
            wall = random(1) <0.38?true:false;
            if (!start.wall && !end.wall) break;
        }
    }

    void show(color c) {
        rectMode(CENTER);
        //stroke(0);
        //strokeWeight(.3);
        noStroke();
        fill(c);
        
        rect(x, y, w, h);
        //if (score != 9999) {
        //    fill(0);
        //    textAlign(CENTER, CENTER);
        //    text(nf(score), x, y);
        //}
    }

    void addNeighbors(Spot[][] grid) {
        if (j > 0) neighbors.add(grid[i][j-1]);
        if (i < cols -1) neighbors.add(grid[i+1][j]);
        if (j < rows -1) neighbors.add(grid[i][j+1]);
        if (i > 0 ) neighbors.add(grid[i-1][j]);
    }
}
