PImage image;
void setup() {
  size(1000, 800);
  image = loadImage("myImage.tif");

  image.loadPixels();

  noLoop();
}
void draw() {
  //image(image, 0, 0);
  background(0);
  for (int i = 0; i < image.pixels.length; i++) {
    int x = i/width;
    int y = i%width;
    if((isBlack(i-1)  ||   isBlack(i+1) || isBlack(i+width) || isBlack(i-width))  && image.pixels[i] != color(0)){
      fill(255);
      stroke(255);
      ellipse(x,y,1,1);
    }
    println(i);
  }
}



boolean isBlack(int i){
  if(i > -1 && i < image.pixels.length && image.pixels[i] ==  color(0)){
    return true;
  }
  return false;
}
