public class Walker {
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  public Walker() {
    
  }
  
  public void update() {
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
    // Reset acceleration for the next frame
    acceleration.mult(0);
  }
  
  public void render() {
    noStroke();
    fill(255);
    ellipse(position.x, position.y, scale, scale);
  }
  
  public void checkEdges() {
    if (position.x > Window.right) {
      position.x = Window.left;
    } else if (position.x < Window.left) {
      position.x = Window.right;
    }
    
    if (position.y > Window.top) {
      position.y = Window.bottom;
    } else if (position.y < Window.bottom) {
      position.y = Window.top;
    }
  }
}
