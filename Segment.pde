public class Segment {
  public float[] x;
  public float[] y;
  private float segLength = 10;
  private float R = random(255),G = random(255),B = random(255);

  public Segment() {
  }

  public Segment(float segLength,int numberNode) {
    this.segLength = segLength;
    x = new float[numberNode];
    y = new float[numberNode];
  }

  void display() {
    strokeWeight(height/50);
    stroke(R, G, B);
    dragSegment(0, mouseX, mouseY);
    for (int i=0; i<x.length-1; i++) {
      dragSegment(i+1, x[i], y[i]);
    }
  }

  void dragSegment(int i, float xin, float yin) {
    float dx = xin - x[i];
    float dy = yin - y[i];
    float angle = atan2(dy, dx);  
    x[i] = xin - cos(angle) * segLength;
    y[i] = yin - sin(angle) * segLength;
    segment(x[i], y[i], angle);
  }

  void segment(float x, float y, float a) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    line(0, 0, segLength, 0);
    popMatrix();
  }
}