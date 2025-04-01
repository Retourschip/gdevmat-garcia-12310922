void setup() {
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw() {
  // Clear screen every 300 frames
  if (frameCount % 300 == 0) {
    background(0);
  }

  // Gaussian x-coordinates
  float xMean = width / 2; 
  float xSD = width / 4; 
  float x = randomGaussian() * xSD + xMean;

  // Random y-coordinates
  float y = random(height); 

  // Gaussian size
  float sizeMean = 30;
  float sizeSD = 10; 
  float size = abs(randomGaussian() * sizeSD + sizeMean); 

  // Color
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float alpha = random(10, 100);

  noStroke();
  fill(r, g, b, alpha);
  circle(x, y, size);
}
