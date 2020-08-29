/*
A Piece object is used to represent one piece of a rubiks cube.
*/
class Piece {
  
  // Piece variables
  PMatrix3D matrix;
  int x, y, z;
  Face[] faces = new Face[6];
  
  // Piece constructor
  Piece(PMatrix3D matrix, int x, int y, int z) {
    this.matrix = matrix;
    this.x = x;
    this.y = y;
    this.z = z;
    
    faces[0] = new Face(new PVector(0, 0, -1), color(0, 0, 255));
    faces[1] = new Face(new PVector(0, 0, 1), color(0, 255, 0));
    faces[2] = new Face(new PVector(0, 1, 0), color(255, 255, 255));
    faces[3] = new Face(new PVector(0, -1, 0), color(255, 255, 0));
    faces[4] = new Face(new PVector(1, 0, 0), color(255, 150, 0));
    faces[5] = new Face(new PVector(-1, 0, 0), color(255, 0, 0));
  }
  
  // Turn in the x-axis
  void turnFacesX(int dir) {
    for(Face face : faces)
      face.turnX(dir * HALF_PI);
  }
  
  // Turn in the y-axis
  void turnFacesY(int dir) {
    for(Face face : faces)
      face.turnY(dir * HALF_PI);
  }
  
  // Turn in the z-axis
  void turnFacesZ(int dir) {
    for(Face face : faces)
      face.turnZ(dir * HALF_PI);
  }
  
  // Update the postition of the piece to the given parameters
  void update(int x, int y, int z) {
    matrix.reset();
    matrix.translate(x, y, z);
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  // Draw the Piece object on the screen
  void show() {
    noFill();
    stroke(0);
    strokeWeight(0.1);
    pushMatrix();
    applyMatrix(matrix);
    box(1);
    for(Face face : faces) 
      face.show();
    popMatrix();
  }
}
