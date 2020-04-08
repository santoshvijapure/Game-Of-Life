// Game Of Life
//Rules

//1. Any live cell with fewer than two live neighbours dies, as if by loneliness.
//2. Any live cell with more than three live neighbours dies, as if by overcrowding.
//3. Any live cell with two or three live neighbours lives, unchanged, to the next generation.
//4. Any dead cell with exactly three live neighbours comes to life.


GOL gol;

void setup() {
  size(500,500);
  gol = new GOL();
}

void draw() {
  
  background(255);

  gol.generate();
  
  gol.display();
  delay(100);
}

// reset and run random pattern when mouse is pressed
void mousePressed() {
  gol.init();
  //gol.generate();
  
  //gol.display();
  
}
