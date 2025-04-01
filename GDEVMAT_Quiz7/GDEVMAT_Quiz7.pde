Walker[] others = new Walker[100];
int resetFrameCount = 600;  // Reset after 600 frames

void setup() {
  size(1600, 900, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Initialize the 100 other matter instances with random positions and scales
  for (int i = 0; i < others.length; i++) {
    others[i] = new Walker();
    float x = random(Window.left, Window.right);
    float y = random(Window.bottom, Window.top);
    others[i].position = new PVector(x, y);
    others[i].scale = random(5, 20);
    // Give each an initial random velocity
    others[i].velocity = PVector.random2D().mult(random(1, 3));
  }
}

void draw() {
  background(80);
  
  // Use the mouse position as the black hole target
  PVector blackHole = new PVector(mouseX - width/2, -(mouseY - height/2));
  
  // Matter instance
  for (int i = 0; i < others.length; i++) {
    // Acceleration toward the mouse
    PVector direction = PVector.sub(blackHole, others[i].position);
    direction.normalize();
    direction.mult(0.2);  // constant acceleration factor
    others[i].acceleration = direction;
    
    others[i].update();
    others[i].render();
    others[i].checkEdges();
  }
  
  if (frameCount % resetFrameCount == 0) {
    for (int i = 0; i < others.length; i++) {
      float x = random(Window.left, Window.right);
      float y = random(Window.bottom, Window.top);
      others[i].position.set(x, y);
      others[i].scale = random(5, 20);
      // Reset the velocity to a new random value
      others[i].velocity = PVector.random2D().mult(random(1, 3));
    }
  }
}
