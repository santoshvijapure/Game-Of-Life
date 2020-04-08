
class GOL {

  int w = 20;
  int columns, rows;

  // Game of life board
  int[][] board;


  GOL() {
    // Initialize rows, columns and set-up arrays
    columns = width/w;
    rows = height/w;
    board = new int[columns][rows];
    //next = new int[columns][rows];
    randomTest();
  }
  void randomTest(){
        int[][] blockPattern={ {0,0,0,0},
                               {0,1,1,0},
                               {0,1,1,0},
                               {0,0,0,0}};
        int[][] boatPattern={{0,0,0,0},
                             {0,1,1,0},
                             {0,1,0,1},
                             {0,0,1,0}};
         int[][] blinkerPattern={{0,0,0,0,0},
                                 {0,0,0,0,0},
                                 {0,1,1,1,0},
                                 {0,0,0,0,0}};
          
         int[][] toadPattern={   {0,0,0,0,0},
                                 {0,0,0,0,0},
                                 {0,1,1,1,0},
                                 {0,0,1,1,1}};
                                 
         int[][] loopPattern={   {0,0,0,0,0,0},
                                 {0,1,0,1,0,0},
                                 {0,0,1,1,0,0},
                                 {0,0,1,0,0,0}};
          

        int[][][] patterns={ blockPattern, boatPattern ,blinkerPattern ,toadPattern,loopPattern};
        
        fillRandom(patterns[int(random(5))]);
  }
  void fillRandom(int[][] pattern){
     for (int i =1;i < pattern.length;i++) {
      for (int j =1;j <pattern[0].length;j++) {
        board[i][j] = pattern[i][j];
      }
    }
  }
  
  //initialization with random pattern of whole board
  void init() {
    for (int i =1;i < columns-1;i++) {
      for (int j =1;j < rows-1;j++) {
        board[i][j] = int(random(2));
      }
    }
  }

  // calculation of next next board 
  void generate() {

    int[][] next = new int[columns][rows];

    // Loop through every spot in our 2D array and check spots neighbors
    for (int x = 1; x < columns-1; x++) {
      for (int y = 1; y < rows-1; y++) {

        // Add up all the states in a 3x3 surrounding grid
        int neighbors = 0;
        //for (int i = -1; i <= 1; i++) {
        //  for (int j = -1; j <= 1; j++) {
        //    
        //  }
        //}
        neighbors += board[x-1][y-1];
        neighbors += board[x-1][y];
        neighbors += board[x-1][y+1];
        neighbors += board[x][y-1];
        neighbors += board[x][y+1];
        neighbors += board[x+1][y-1];
        neighbors += board[x+1][y];
        neighbors += board[x+1][y+1];
        
        //neighbors -= board[x][y];

        // Rules of Life
        if      ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;           // loneliness
        else if ((board[x][y] == 1) && (neighbors >  3)) next[x][y] = 0;           // overcrowding
        else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;           // reborn
        else     next[x][y] = board[x][y];                                         // unchanged
      }
    }

    // Next is now our board
    board = next;
  }

  // just draw the cells
  void display() {
    for ( int i = 0; i < columns;i++) {
      for ( int j = 0; j < rows;j++) {
        if ((board[i][j] == 1)) fill(0);
        else fill(255); 
        stroke(100);
        rect(i*w, j*w, w, w);
      }
    }
  }
}
