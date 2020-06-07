PImage image;
ArrayList <SmartColor> target = new ArrayList<SmartColor>();
ArrayList <BoundingBox> boxes = new ArrayList<BoundingBox>();
boolean Disp = false;
void setup() {
  size(1000, 800);
  image = loadImage("myImage.tif");

  image.loadPixels();
  for (int i = 0; i < image.pixels.length; i++) {
    boolean found = false;
    for (int j = 0; j < target.size(); j++) {
      if (CheckWithThreshold(image.pixels[i], target.get(j).colour, 150 )) {
        target.get(j).tally += 1;
        found = true;
      }
    }
    if (found == false) {
      target.add(new SmartColor(color(image.pixels[i])));
      boxes.add(new BoundingBox(1000, 800, 0, 0));
    }
  }
  
  for(int i = 0; i < target.size(); i++){
    if(target.get(i).colour == color(0)){
      target.remove(i);
      boxes.remove(i);
    }
  }
  
  
  noLoop();


  println("Shapes: " + target.size());
}
void draw() {
  image(image, 0, 0);

  //for (int i = 0; i <5; i++) {
  //  fill(target.get(i).colour);  
  //  rect(0, i*50, 50, 50);
  //}

  for (int i = 0; i < image.pixels.length; i++) {
    for (int j = 0; j < target.size(); j++) {
      int x = i%width;
      int y = int(i/width);
      if (image.pixels[i] == target.get(j).colour) {
        boxes.get(j).minx = Min(boxes.get(j).minx, x);
        boxes.get(j).miny = Min(boxes.get(j).miny, y);
        boxes.get(j).maxx = Max(boxes.get(j).maxx, x);
        boxes.get(j).maxy = Max(boxes.get(j).maxy, y);
      }
    }
  }




  for (int j = 0; j < target.size(); j++) {
    if (CheckWithThreshold(get(mouseX, mouseY), target.get(j).colour, 150 ) ) {
      boxes.get(j).display();
      int boxX = (boxes.get(j).maxx - boxes.get(j).minx + 1);
      int boxY = ( boxes.get(j).maxy-boxes.get(j).miny + 1);
      println("width: " + boxX + "    Height: " + boxY);
      println("Area: " + target.get(j).tally);
      float ratio = float(target.get(j).tally) / (boxX*boxY);
      println("Filled Percentage: " + ratio*100);
      
      
      text("Aspect Ratio: "+ float(boxX)/boxY, 5, 16);
      text("Area: " + target.get(j).tally,5,32);
      text("Filled Percentage: " + nf(ratio*100,0,2)   ,5,48);
      
    }
  }
  
  
  
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
  redraw();
  println("-------X-------X-------X-------");
  println("-------X-------X-------X-------");
  println("-------X-------X-------X-------");
  println("-------X-------X-------X-------");
}
