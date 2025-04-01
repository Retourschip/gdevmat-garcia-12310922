void setup() {
  size(1280, 720, P3D);
  background(225);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
  perlinWalker.initializePosition();
}

Walker perlinWalker = new Walker();

void draw() {
  noStroke();
  perlinWalker.render();
  perlinWalker.perlinWalk();
}
