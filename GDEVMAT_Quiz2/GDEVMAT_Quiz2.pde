Walker walker1, walker2;

void setup() {
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
  walker1 = new Walker(width/3, height/2);  // Random Walker
  walker2 = new Walker(2 * width/3, height/2);  // Random Biased Walker
}

void draw() {
  walker1.randomWalk();
  walker1.render();

  walker2.randomWalkBiased();
  walker2.render();
}
