float amplitude = 50;
float frequency = 0.05;
float phase = 0;       

void setup() {
  size(1280, 720);
}

void draw() {
  background(0);
  
  translate(width / 2, height / 2);
  
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWave();
  
  phase += 0.05; // Increment of the sine wave
}

// Cartesian Plane
void drawCartesianPlane() {
  stroke(255);
  strokeWeight(1);
  
  line(-300, 0, 300, 0);
  line(0, -300, 0, 300);
  
  // Draw grid ticks every 20 pixels
  for (int i = -300; i <= 300; i += 20) {
    line(i, -3, i, 3); // X-axis
    line(-3, i, 3, i); // Y-axis
  }
}

// Linear function: f(x) = -5x + 30
void drawLinearFunction() {
  color purple = color(128, 0, 128);
  stroke(purple);
  strokeWeight(2);
  noFill();
  
  beginShape();
  for (int x = -200; x <= 200; x++) {
    float y = -5 * x + 30;
    vertex(x * 2, -y * 3);
  }
  endShape();
}

// Quadratic function: f(x) = x^2 - 15x - 3
void drawQuadraticFunction() {
  color yellow = color(255, 255, 0);
  stroke(yellow);
  strokeWeight(2);
  noFill();
  
  beginShape();
  for (float x = -30; x <= 30; x += 0.1) {
    float y = x * x - 15 * x - 3;
    vertex(x * 10, -y * 3);
  }
  endShape();
}

// Sine wave: y = amplitude * sin(frequency * x + phase)
void drawSineWave() {
  color orange = color(255, 165, 0);
  stroke(orange);
  strokeWeight(2);
  noFill();
  
  beginShape();
  for (int x = -300; x <= 300; x++) {
    float y = amplitude * sin(frequency * x + phase);
    vertex(x, -y * 3);
  }
  endShape();
}

// Key inputs for Sine Wave
void keyPressed() {
  if (key == 'W' || key == 'w') {
    amplitude += 5;
  } else if (key == 'S' || key == 's') {
    amplitude = max(5, amplitude - 5);
  } else if (key == 'D' || key == 'd') {
    frequency += 0.005;
  } else if (key == 'A' || key == 'a') {
    frequency = max(0.005, frequency - 0.005);
  }
}
