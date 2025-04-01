Walker[] walkers = new Walker[10];  

PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.15, 0);

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
    walkers[i].mass = i + 1;                  // Mass from 1 to 10
    walkers[i].scale = walkers[i].mass * 15;    // Scale depends on mass
    walkers[i].position = new PVector(-500, 200);
    walkers[i].col = color(random(255), random(255), random(255));  // Random color
  }
}

void draw() {
  background(80);
  
  // For each walker, apply forces, update position, check edges, and render
  for (int i = 0; i < walkers.length; i++) {
    walkers[i].applyForce(gravity);
    walkers[i].applyForce(wind);
    walkers[i].update();
    
    // Bounce off vertical edges using a Newton's Third Law
    if (walkers[i].position.y <= Window.bottom || walkers[i].position.y >= Window.top) {
      walkers[i].velocity.y *= -1;
    }
    
    // Bounce off horizontal edges similarly
    if (walkers[i].position.x <= Window.left || walkers[i].position.x >= Window.right) {
      walkers[i].velocity.x *= -1;
    }
    
    walkers[i].render();
  }
}
