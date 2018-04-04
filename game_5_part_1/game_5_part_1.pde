int cols = 21, rows = 21;
Spot grid[][] = new Spot[cols][rows];
Spot start, end;
ArrayList<Spot> openSet = new ArrayList<Spot>();
ArrayList<Spot> closeSet = new ArrayList<Spot>();
ArrayList<Spot> path = new ArrayList<Spot>();
long step;

void setup() {
  size(630, 630);
  frameRate(10);
  pixelDensity(displayDensity());
  colorMode(HSB, 255);


  for (int i = 0; i< cols; i++) {
    for (int j =0; j< rows; j++)
      grid[i][j] = new Spot(i, j);
  }
  start = grid[0][0];
  end = grid[cols-1][rows-1];

  for (int i = 0; i< cols; i++) {
    for (int j =0; j< rows; j++)
      grid[i][j].addNeighbors(grid);
  }

  for (int i = 0; i< cols; i++) {
    for (int j =0; j< rows; j++)
      grid[i][j].addWall();
  }



  end.score = 0;
  openSet.add(end);
}

void draw() {
  step++;
  int loopSize = openSet.size();

  if (loopSize == 0) {
    println("no solution");
    noLoop();
  }

  for (int i =0; i < loopSize; i++) {
    Spot current = openSet.get(0);
    for (int j=0; j< current.neighbors.size(); j++) {
      Spot neighbor = current.neighbors.get(j);
      if (!closeSet.contains(neighbor) && !neighbor.wall) {
        if (neighbor == start) {
          println("arrived");
          findPath(start);

          for (int k = 0; k< cols; k++) {
            for (int l =0; l< rows; l++)
              if (grid[k][l].wall) grid[k][l].show(50);
              else grid[k][l].show(255);
          }

          for (int k=0; k<openSet.size(); k++) openSet.get(k).show(#00FF00);
          for (int k=0; k<closeSet.size(); k++) {
            float a=closeSet.get(k).score;
            a = map(a, 0, step, 0, 255);
            closeSet.get(k).show(color(a, 255, 255));
          }

          for (int k =0; k < path.size(); k++)
            path.get(k).show(#9999FF);

          start.show(#00FFFF);
          end.show(#FFFF00);

          noLoop();
          return;
        }
        neighbor.score = current.score+1;
        if (!openSet.contains(neighbor))
          openSet.add(neighbor);
      }
    }
    openSet.remove(current);
    closeSet.add(current);
  }


  for (int i = 0; i< cols; i++) {
    for (int j =0; j< rows; j++)
      if (grid[i][j].wall) grid[i][j].show(50);
      else grid[i][j].show(255);
  }

  for (int i=0; i<openSet.size(); i++) openSet.get(i).show(#00FF00);
  for (int i=0; i<closeSet.size(); i++) {
    float a=closeSet.get(i).score;
    a = map(a, 0, step, 0, 255);
    closeSet.get(i).show(color(a, 255, 255));
  }
  start.show(#00FFFF);
  end.show(#FFFF00);
}

void findPath(Spot a) {
  path.add(start);
  Spot winner = new Spot(0, 0);
  while (true) {
    for (int j=0; j< a.neighbors.size(); j++) {
      Spot neighbor = a.neighbors.get(j);
      if (neighbor.score < winner.score)
        winner = neighbor;
    }
    path.add(winner);
    if (winner == end) break;
    a = winner;
  }
}
