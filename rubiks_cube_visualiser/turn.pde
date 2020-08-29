// Turn a side in the x-axis
void turnX(int index, int dir) {
  for(int i = 0; i < cube.length; i++) {
    Piece piece = cube[i];
    if(piece.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir * HALF_PI);
      matrix.translate(piece.y, piece.z);
      piece.update(piece.x, round(matrix.m02), round(matrix.m12));
      piece.turnFacesX(dir);
    }
  }
}

// Turn a side in the y-axis
void turnY(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Piece piece = cube[i];
    if (piece.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(piece.x, piece.z);
      piece.update(round(matrix.m02), piece.y, round(matrix.m12));
      piece.turnFacesY(dir);
    }
  }
}

// Turn a side in the z-axis
void turnZ(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Piece piece = cube[i];
    if (piece.z == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(piece.x, piece.y);
      piece.update(round(matrix.m02), round(matrix.m12), round(piece.z));
      piece.turnFacesZ(dir);
    }
  }
}
