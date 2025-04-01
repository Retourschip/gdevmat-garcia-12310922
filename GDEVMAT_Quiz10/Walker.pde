class Walker {
  PVector position, velocity, acceleration;
  float mass, scale;
  color col;

  // Constructor that accepts position and mass
  Walker(float x, float y, float m) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    mass = m;
    scale = mass * 15;
    col = color(random(255), random(255), random(255));  // Random color
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);  // Reset acceleration
  }

  void render() {
    fill(col);
    noStroke();
    ellipse(position.x, position.y, scale, scale);
  }

  void checkEdges() {
    if (position.x > Window.right) {
      position.x = Window.right;
      velocity.x *= -1;
    } else if (position.x < Window.left) {
      position.x = Window.left;
      velocity.x *= -1;
    }

    if (position.y > Window.top) {
      position.y = Window.top;
      velocity.y *= -1;
    } else if (position.y < Window.bottom) {
      position.y = Window.bottom;
      velocity.y *= -1;
    }
  }
}
