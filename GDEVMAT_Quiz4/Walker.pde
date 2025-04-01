public class Walker {
  public float x, y;
  public float tx = 0, ty = 10000;
  public float tSize = 20000;
  public float tRed = 30000, tGreen = 40000, tBlue = 50000;

  // Initialize the Walker's position using Perlin noise
  void initializePosition() {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
  }

  void render() {
    // Colors using Perlin noise
    float red = map(noise(tRed), 0, 1, 0, 255);
    float green = map(noise(tGreen), 0, 1, 0, 255);
    float blue = map(noise(tBlue), 0, 1, 0, 255);
    fill(red, green, blue);

    // Size using Perlin noise
    float size = map(noise(tSize), 0, 1, 5, 150);
    circle(x, y, size);
  }

  void perlinWalk() {
    // Update position using Perlin noise
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);

    tx += 0.01;
    ty += 0.01;
    tSize += 0.01;
    tRed += 0.01;
    tGreen += 0.01;
    tBlue += 0.01;
  }
}
