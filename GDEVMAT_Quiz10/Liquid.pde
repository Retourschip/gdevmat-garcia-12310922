class Liquid {
  float x, y;
  float horizon, depth;
  float cd;
  
  Liquid(float x, float y, float horizon, float depth, float cd) {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.cd = cd;
  }
  
  public void render() {
    noStroke();
    fill(28, 120, 186);
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    endShape(CLOSE);
  }
  
  // Checks if a given walker is in contact or colliding with our Liquid
  public boolean isCollidingWith(Walker walker) {
    PVector pos = walker.position;
    return pos.x > (this.x - this.horizon) &&
           pos.x < (this.x + this.horizon) &&
           pos.y < this.y;
  }
  
  public PVector calculateDragForce(Walker walker) {
    // Drag magnitude is coefficient of drag * speed squared
    float speed = walker.velocity.mag();
    float dragMagnitude = this.cd * speed * speed;
    
    // Direction is inverse of velocity
    PVector dragForce = walker.velocity.copy();
    dragForce.mult(-1);
    
    // Scale according to magnitude
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }
}
