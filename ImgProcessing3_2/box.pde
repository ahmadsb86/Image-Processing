class BoundingBox {
  int minx = 0;
  int miny = 0;
  int maxx = 0;
  int maxy = 0;
  BoundingBox(int m_x, int m_y, int ma_x, int ma_y) {
    minx = m_x;
    miny = m_y;
    maxx = ma_x;
    maxy = ma_y;
  }
  void display() {
    noFill();
    stroke(255);
    rect(minx, miny, maxx-minx, maxy-miny);
  }
}
