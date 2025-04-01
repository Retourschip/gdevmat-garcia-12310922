Walker blackHole;                      
ArrayList<Walker> matter = new ArrayList<Walker>(); 
int resetFrameCount = 300;               

void setup() {
  size(1000, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Initialize black hole at a random position
  float bhX = random(width);
  float bhY = random(height);
  blackHole = new Walker(bhX, bhY, 50);
  blackHole.setColor(255, 255, 255, 255);  // White 
  
  // Initialize matter objects
  for (int i = 0; i < 100; i++) {
    float x = random(width);
    float y = random(height);
    float s = random(5, 20);   // random scale for each matter
    Walker m = new Walker(x, y, s);
    m.setColor(random(255), random(255), random(255), 255);
    // Assign a random speed factor between 2 and 6 for each matter
    m.speed = random(2, 6);
    matter.add(m);
  }
}

void draw() {
  background(130);
  
  // Draw and update matter objects first
  for (int i = matter.size() - 1; i >= 0; i--) {
    Walker m = matter.get(i);
    // Compute the vector from the matter to the black hole
    PVector direction = PVector.sub(blackHole.position, m.position);
    // Perlin noise to modulate the movement speed
    float noiseFactor = noise(m.position.x * 0.01, m.position.y * 0.01);
    // Normalize the direction vector for consistent movement
    direction.normalize();
    // Multiply the direction by the matter's individual speed and noise
    direction.mult(m.speed * noiseFactor);
    // Move matter towards the black hole
    m.position.add(direction);
    
    // Check if matter is close enough to be sucked in
    if (PVector.dist(m.position, blackHole.position) < blackHole.scale / 2) {
      matter.remove(i); // remove matter if it is inside the black hole
    } else {
      m.render();
    }
  }
  
  // Black Hole
  // Follow the mouse
  PVector targetPos = new PVector(mouseX, mouseY);
  blackHole.position.lerp(targetPos, 0.05);
  
  // Draw the black hole last so it appears on top
  blackHole.render();
  
  // Reset on Timer
  if (frameCount % resetFrameCount == 0) {
    // Reset matter objects
    matter.clear();
    for (int i = 0; i < 100; i++) {
      float x = random(width);
      float y = random(height);
      float s = random(5, 20);
      Walker m = new Walker(x, y, s);
      m.setColor(random(255), random(255), random(255), 255);
      m.speed = random(2, 6);
      matter.add(m);
    }
    // Randomize black hole position
    float bhX = random(width);
    float bhY = random(height);
    blackHole.position.set(bhX, bhY);
  }
}
