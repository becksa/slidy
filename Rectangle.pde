public class Rectangle {
  public float x1, y1, x2, y2;

  public Rectangle(float x, float y, float w, float h) {
    this.x1 = x;
    this.y1 = y;
    this.x2 = w;
    this.y2 = h;
  }

  public void display() {
    rect(x1, y1, x2, y2);
  }
}