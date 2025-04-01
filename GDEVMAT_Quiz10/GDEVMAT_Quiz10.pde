Liquid ocean;
Walker[] walkers = new Walker[10];  
PVector wind = new PVector(0, 0);

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  // Ocean
  ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

  // Walkers with mass 1 to 10, from left to right
  float spacing = Window.right * 2 / walkers.length;
  for (int i = 0; i < walkers.length; i++) {
    float xPos = Window.left + i * spacing + spacing / 2;
    float mass = i + 1;  // Mass from 1 to 10
    walkers[i] = new Walker(xPos, Window.top + 50, mass);
  }
}

void draw() {
  background(255);
  
  ocean.render();

  for (int i = 0; i < walkers.length; i++) {
    Walker w = walkers[i];

    // Apply gravity (scaled by mass)
    PVector gravity = new PVector(0, -0.15f * w.mass);
    w.applyForce(gravity);

    PVector wind = new PVector(0, 0);
    w.applyForce(wind);

    // Apply drag if in liquid
    if (ocean.isCollidingWith(w)) {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }

    w.update();
    w.checkEdges();
    w.render();
  }
}

// Reset on mouse press
void mousePressed() {
  setup();
}
