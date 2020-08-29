/* 
A Face object is used to represent one face on a rubik's cube piece.
*/
class Face {
  
  // Face variables
  PVector normal;
  color colour;
  
  // Face constructor
  Face(PVector normal, color colour) {
    this.normal = normal;
    this.colour = colour;
  }
  
  // Turn in the x-axis
  void turnX(float angle) {
    PVector v2 = new PVector();
    v2.y = round((normal.y * cos(angle)) - (normal.z * sin(angle)));
    v2.z = round((normal.y * sin(angle)) + (normal.z * cos(angle)));
    v2.x = round(normal.x);
    this.normal = v2;
  }
  
  // Turin in the y-axis
  void turnY(float angle) {
    PVector v2 = new PVector();
    v2.x = round((normal.x * cos(angle)) - (normal.z * sin(angle)));
    v2.z = round((normal.x * sin(angle)) + (normal.z * cos(angle)));
    v2.y = round(normal.y);
    this.normal = v2;
  }
  
  // Turn in the z-axis
  void turnZ(float angle) {
    PVector v2 = new PVector();
    v2.x = round((normal.x * cos(angle)) - (normal.y * sin(angle)));
    v2.y = round((normal.x * sin(angle)) + (normal.y * cos(angle)));
    v2.z = round(normal.z);
    this.normal = v2;
  }
  
  // Draw the Face object to the screen
  void show() {
    pushMatrix();
    fill(colour);
    noStroke();
    rectMode(CENTER);
    translate(0.5 * normal.x, 0.5 * normal.y, 0.5 * normal.z);
    
    if(abs(normal.x) > 0) {
      rotateY(HALF_PI);
    } else if(abs(normal.y) > 0) {
      rotateX(HALF_PI);
    }
    square(0, 0, 1);
    popMatrix();
  }
}
