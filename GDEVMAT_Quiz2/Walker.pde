class Walker {
  float x, y;

  Walker(float startX, float startY) {
    x = startX;
    y = startY;
  }

  void render() {
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    int a = int(random(50, 101)); 

    fill(r, g, b, a);
    noStroke();
    circle(x, y, 30);
  }

  void randomWalk() {
    int rng = int(random(8));
    
    if (rng == 0)      y += 10;   // Down
    else if (rng == 1) y -= 10;   // Up
    else if (rng == 2) x += 10;   // Right
    else if (rng == 3) x -= 10;   // Left
    else if (rng == 4) { x += 10; y += 10; }  // Bottom-right
    else if (rng == 5) { x -= 10; y += 10; }  // Bottom-left
    else if (rng == 6) { x += 10; y -= 10; }  // Top-right
    else if (rng == 7) { x -= 10; y -= 10; }  // Top-left
  }

  void randomWalkBiased() {
    float chance = random(1); 

    if (chance < 0.40)      x += 10;  // 40% right
    else if (chance < 0.60) x -= 10;  // 20% left
    else if (chance < 0.80) y -= 10;  // 20% up
    else                    y += 10;  // 20% down
  }
}
