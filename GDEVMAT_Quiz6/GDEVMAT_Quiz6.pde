void setup() {
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos() {
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw() {
  background(130);
  
  PVector mouse = mousePos();
  mouse.normalize().mult(300);
  
  // Endpoints
  PVector handleStart = mouse.copy().mult(-0.05);
  PVector handleEnd = mouse.copy().mult(0.05);

  // Draw the handle 
  strokeWeight(10);
  stroke(0);
  line(handleStart.x, handleStart.y, handleEnd.x, handleEnd.y);

  // Draw both blades
  for (int i = 0; i < 2; i++) {
    PVector bladeStart, bladeEnd;
    if (i == 0) {
      // Positive direction blade
      bladeStart = handleEnd;
      bladeEnd = mouse;
    } else {
      // Negative direction blade
      bladeStart = handleStart;
      bladeEnd = mouse.copy().mult(-1);
    }

    // Outer glow (red, high thickness)
    strokeWeight(20);
    stroke(255, 0, 0, 100);
    line(bladeStart.x, bladeStart.y, bladeEnd.x, bladeEnd.y);

    // Inner glow (white, low thickness)
    strokeWeight(5);
    stroke(255);
    line(bladeStart.x, bladeStart.y, bladeEnd.x, bladeEnd.y);
  }

  println(mouse.mag());
}
