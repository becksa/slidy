public class Ellipse {
  public float x, y, r;

  public Ellipse(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r*2;
  }

  public void display() {
    ellipse(x, y, r, r);
  }
}