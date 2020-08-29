import peasy.*;
import java.util.*;

// Constants
final float SPEED = 0.05;
final int DIMENSIONS = 3;

// Global variables
PeasyCam cam;
Piece[] cube;
Move currentMove;
boolean scrambling, solving;
Stack<Move> scrambledMoves, movesMade;

// Setup function
void setup() {
  size(600, 600, P3D);
  
  // Initialise global variables
  cam = new PeasyCam(this, 400);
  cube = new Piece[DIMENSIONS * DIMENSIONS * DIMENSIONS];
  currentMove = null;
  scrambling = false;
  solving = false;
  movesMade = new Stack<Move>();
  
  int index = 0;
  for(int x = -1; x <= 1; x++) {
    for(int y = -1; y <= 1; y++) {
      for(int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index++] = new Piece(matrix, x, y, z);
      }
    }
  }
}

void draw() {
  scale(50);
  background(250);
  
  rotateX(- HALF_PI / 3);
  rotateY(- HALF_PI / 2);
  rotateZ(2 * HALF_PI);
  
  if(solving && currentMove == null && !movesMade.empty()) {
    currentMove = movesMade.pop();
    currentMove.dir = currentMove.dir * -1;
    currentMove.start();
  } else if(scrambling && currentMove == null) {
    currentMove = scrambledMoves.pop();
    movesMade.push(currentMove.copy());
    currentMove.start();
  }
  
  if(currentMove != null) {
    currentMove.update();
    if(currentMove.finished) {
      currentMove = null;
    }
  }
  
  if(solving && movesMade.empty()) {
    solving = false;
  } else if(scrambledMoves != null && scrambledMoves.empty()) {
      scrambling = false;
  }
  
  for (int i = 0; i < cube.length; i++) {
    push();
    if(currentMove != null) {
      if (abs(cube[i].z) > 0 && cube[i].z == currentMove.z) {
        rotateZ(currentMove.angle);
      } else if (abs(cube[i].x) > 0 && cube[i].x == currentMove.x) {
        rotateX(currentMove.angle);
      } else if (abs(cube[i].y) > 0 && cube[i].y == currentMove.y) {
        rotateY(-currentMove.angle);
      }  
    } 
    cube[i].show();
    pop();
  }
}
