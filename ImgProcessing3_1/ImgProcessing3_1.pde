PImage image;
color target = color(0, 0, 255);
void setup() {
  size(1000, 800);
  image = loadImage("my-Image.png");
  noLoop();
}
void draw() {
  image(image, 0, 0);
  image.loadPixels();
  int minX = width;
  int minY = height;
  int maxX = 0;
  int maxY = 0;
  for (int i = 0; i < image.pixels.length; i++) {
    int x = i%width;
    int y = int(i/width);
    if (image.pixels[i] == target) {
      minX = Min(minX, x);
      minY = Min(minY, y);
      maxX = Max(maxX, x);
      maxY = Max(maxY, y);
    }
    println(i);
  }
  noFill();
  stroke(255);
  rect(minX, minY, maxX-minX, maxY-minY);
}

int Min(int min, int num) {
  if (num<min) { 
    return num;
  }
  return min;
}
int Max(int max, int num) {
  if (num>max) { 
    return num;
  }
  return max;
}
void mousePressed(){
  target = get(mouseX,mouseY);
  redraw();
}
