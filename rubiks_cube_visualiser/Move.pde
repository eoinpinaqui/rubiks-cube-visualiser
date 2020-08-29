/* 
A Move object represents a move that the cube can make.
*/
class Move {
  
  // Move variables
  float angle;
  int x, y, z, dir;
  float speed;
  boolean animating, finished;
  
  // Move constructor
  Move(int x, int y, int z, int dir, float speed) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
    this.speed = speed;
    animating = false;
    finished = false;
  }
  
  // Start the animation
  void start() {
    animating = true;
    finished = false;
    this.angle = 0;
  }
  
  Move copy() {
    return new Move(x, y, z, dir, speed);
  }
  
  // Update the animation
  void update() {
    if(animating) {
      angle += dir * speed;
      if(abs(angle) > HALF_PI) {
        angle = 0;
        animating = false;
        finished = true;
        if(abs(x) > 0)
          turnX(x, dir);
        else if(abs(y) > 0) 
          turnY(y, dir);
        else if(abs(z) > 0)
          turnZ(z, dir);
      }
    }
  }
}
