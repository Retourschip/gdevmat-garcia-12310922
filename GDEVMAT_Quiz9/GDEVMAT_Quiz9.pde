final int numWalkers = 8;
Walker[] walkers = new Walker[numWalkers];

void setup() {
  size(1600, 900, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < numWalkers; i++) {
    walkers[i] = new Walker();
    
    float posY = map(i, 0, numWalkers - 1, Window.top, Window.bottom);
    float startX = Window.left / 2.0;
    walkers[i].position = new PVector(startX, posY);
    
    // Set increasing mass from top (smallest) to bottom (largest)
    walkers[i].mass = i + 1;
    walkers[i].scale = walkers[i].mass * 15;
    
    // Random color
    float r = random(1, 255);
    float g = random(1, 255);
    float b = random(1, 255);
    float a = random(1, 255);
    walkers[i].col = color(r, g, b, a);
  }
}

void draw() {
  background(255);
  
  // Draw a vertical reference line at screen center (x = 0)
  stroke(0);
  strokeWeight(2);
  line(0, Window.top, 0, Window.bottom);
  
  noStroke();
  
  for (Walker w : walkers) {
    // Apply friction 
    // Use a friction coefficient of 0.01 until walker reaches mid-screen, then 0.4
    float mew = (w.position.x > Window.right / 2.0) ? 0.4f : 0.01f;
float frictionMagnitude = mew * w.mass;  

if (w.velocity.mag() > 0.1) {  // Only apply friction if the velocity is above 0.1
  PVector friction = w.velocity.copy();
  friction.mult(-1);
  friction.normalize(); 
  friction.mult(frictionMagnitude);
  w.applyForce(friction);
}

    
    // Apply constant acceleration force
    // This constant force is applied equally to all walkers
    // Division by mass in applyForce() ensures lighter walkers accelerate more
    PVector accelForce = new PVector(0.2, 0);
    w.applyForce(accelForce);
    
    w.update();
    w.render();
    
  }
}

// Reset all walkers when the mouse is clicked
void mousePressed() {
  for (int i = 0; i < numWalkers; i++) {
    float posY = map(i, 0, numWalkers - 1, Window.top, Window.bottom);
    float startX = Window.left / 2.0;
    walkers[i].position = new PVector(startX, posY);
    walkers[i].velocity = new PVector(0, 0);
    walkers[i].acceleration = new PVector(0, 0);
  }
}
