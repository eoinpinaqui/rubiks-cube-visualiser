void keyPressed() {
  applyMove(key);
}

// Respond to a users command
void applyMove(char move) {
  if(currentMove != null || scrambling || solving) return;
  switch (move) {
    case 'f': 
      currentMove = new Move(0, 0, 1, -1, SPEED);
      movesMade.push(currentMove.copy());
      currentMove.start();
      break;
    case 'F': 
      currentMove = new Move(0, 0, 1, 1, SPEED);
      movesMade.push(currentMove.copy());
      currentMove.start();
      break;  
    case 'b': 
      currentMove = new Move(0, 0, -1, 1, SPEED);
      movesMade.push(currentMove.copy());
      currentMove.start();
      
      break;
    case 'B': 
      currentMove = new Move(0, 0, -1, -1, SPEED);
      movesMade.push(currentMove.copy());
      currentMove.start();
      break;
    case 'u': 
      currentMove = new Move(0, 1, 0, 1, SPEED);
      movesMade.push(currentMove.copy());
      currentMove.start();
      break;
    case 'U': 
      currentMove = new Move(0, 1, 0, -1, SPEED);
      movesMade.push(currentMove.copy());
      currentMove.start();
      break;
    case 'd': 
      currentMove = new Move(0, -1, 0, -1, SPEED);
      movesMade.push(currentMove.copy());
      currentMove.start();
      break;
    case 'D': 
      currentMove = new Move(0, -1, 0, 1, SPEED);
      movesMade.push(currentMove.copy());
      currentMove.start();
      break;
    case 'l': 
      currentMove = new Move(1, 0, 0, -1, SPEED);
      movesMade.push(currentMove.copy());
      currentMove.start();
      break;
    case 'L': 
      currentMove = new Move(1, 0, 0, 1, SPEED);
      movesMade.push(currentMove.copy());
      currentMove.start();
      break;
    case 'r': 
      currentMove = new Move(-1, 0, 0, 1, SPEED);
      movesMade.push(currentMove.copy());
      currentMove.start();
      break;
    case 'R': 
      currentMove = new Move(-1, 0, 0, -1, SPEED);
      movesMade.push(currentMove.copy());
      currentMove.start();
      break;
    case 'x':
      scrambling = true;
      scrambledMoves = getRandomMoves();
      break;
    case ' ':
      solving = true;
      break;
  }
}

// Get random moves for scrambling
Stack<Move> getRandomMoves() {
    Move[] possibleMoves = {
      new Move(0, 0, 1, -1, SPEED), new Move(0, 0, 1, 1, SPEED),
      new Move(0, 0, -1, 1, SPEED), new Move(0, 0, -1, -1, SPEED),
      new Move(0, 1, 0, 1, SPEED), new Move(0, 1, 0, -1, SPEED),
      new Move(0, -1, 0, -1, SPEED), new Move(0, -1, 0, 1, SPEED),
      new Move(1, 0, 0, -1, SPEED), new Move(1, 0, 0, 1, SPEED),
      new Move(-1, 0, 0, 1, SPEED), new Move(-1, 0, 0, -1, SPEED)
    };
    
    Stack<Move> randomMoves = new Stack<Move>();
    for(int i = 0; i < 20; i++) {
      randomMoves.push(possibleMoves[new Random().nextInt(possibleMoves.length - 1)]);
    }
  return randomMoves;
}
