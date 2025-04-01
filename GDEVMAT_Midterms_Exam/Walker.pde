public class Walker {
  public PVector position;
  public float scale;
  public float r, g, b, a;
  public float speed = 1;

  Walker() {
    position = new PVector();
    scale = 10;
    r = 255;
    g = 255;
    b = 255;
    a = 255;
  }
  
  Walker(float x, float y, float s) {
    position = new PVector(x, y);
    scale = s;
    r = 255;
    g = 255;
    b = 255;
    a = 255;
  }
  
  public void render() {
    noStroke();
    fill(r, g, b, a);
    ellipse(position.x, position.y, scale, scale);
  }
  
  // Color of the Walker
  public void setColor(float rr, float gg, float bb, float aa) {
    r = rr;
    g = gg;
    b = bb;
    a = aa;
  }
}
