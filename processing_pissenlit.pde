void setup() {
  size(500,500);
  new MovableCamera();
  new Square(100);
}

void draw() {
  CameraManager.current.draw();
}

void keyPressed() {
  switch (keyCode) {
    case UP: Input.up = true;
    case RIGHT: Input.right = true;
    case DOWN: Input.down = true;
    case LEFT: Input.down = true;
  }
}

void keyReleased() {
  switch (keyCode) {
    case UP: Input.up = false;
    case RIGHT: Input.right = false;
    case DOWN: Input.down = false;
    case LEFT: Input.down = false;
  }
}
