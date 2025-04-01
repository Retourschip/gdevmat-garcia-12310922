class Walker {
  PVector position, velocity, acceleration;
  float mass, scale;
  float r, g, b;
  float gravitationalConstant = 1;

  Walker(PVector pos, float m) {
    position = pos.copy();
    velocity = new PVector();
    acceleration = new PVector();
    mass = m;
    scale = mass * 5;
    r = random(255);
    g = random(255);
    b = random(255);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void render() {
    fill(r, g, b);
    noStroke();
    ellipse(position.x, position.y, scale, scale);
  }

  PVector calculateAttraction(Walker other) {
    PVector force = PVector.sub(position, other.position);
    float distance = constrain(force.mag(), 5, 25);
    force.normalize();
    float strength = (gravitationalConstant * mass * other.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
}
