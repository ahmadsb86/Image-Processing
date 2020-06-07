//Image Processing Project 2
//Created by Ahmad Bilal

//Functions/Classes are camel-cased



//variables
ArrayList<SmartColor> colors = new ArrayList <SmartColor>();
ArrayList<SmartColor> reds = new ArrayList <SmartColor>();
ArrayList<SmartColor> greens = new ArrayList <SmartColor>();
ArrayList<SmartColor> blues = new ArrayList <SmartColor>();
PImage shapes;

void setup() {
  size(1000, 500);
  //load images and resize to fit screen
  shapes = loadImage("COLORFLOWER.jpeg");
  shapes.resize(500, 500);
  //add one color so we do ensure looping in CountColors()
  colors.add(new SmartColor(color(0, 0, 0)));

  for (int i = 0; i<255; i++) {
    reds.add(new SmartColor(color(i, 0, 0)));
    greens.add(new SmartColor(color(0, i, 0)));
    blues.add(new SmartColor(color(0, 0, i)));
  }
  rectMode(CENTER);
}

void draw() {
  noLoop();
  //draw shape
  image(shapes, 0, 0);
  noStroke();





  for (int i = 0; i < shapes.pixels.length; i++) {
    boolean found = false;
    for (int j = 0; j < colors.size(); j++) {
      if (CheckWithThreshold(shapes.pixels[i], colors.get(j).colour, 50 )) {
        colors.get(j).tally += 1;
        found = true;
      }
    }
    if (found == false) {
      colors.add(new SmartColor(color(shapes.pixels[i])));
    }
  }


  tally(reds);
  tally(greens);
  tally(blues);




  strokeWeight(3);
  stroke(0);
  line(500, height/4*3, width, height/4*3);
  line(500, height/2, width, height/2);
  line(500, height/4, width, height/4);
  
  
  noStroke();
  displayGraph(colors, maxTally(colors), height);
  displayGraph(reds, 50, height/4*3);
  displayGraph(greens, 50, height/2);
  displayGraph(blues, 50, height/4);

  strokeWeight(10);
  stroke(255, 255, 255);
  line(495, 0, 495, height);
  
  
  
  println(reds.size());
}






void tally(ArrayList<SmartColor> array) {
  for (int i = 0; i < shapes.pixels.length; i++) {
    for (int j = 0; j < array.size(); j++) {
      if (CheckWithThreshold(shapes.pixels[i], array.get(j).colour, 2 )) {
        array.get(j).tally += 1;
      }
    }
  }
}




void displayGraph(ArrayList<SmartColor> array, int maxY, float Height) {
  float barX = 500/array.size();

  for (int i = 0; i < array.size(); i++) {
    float barY = map(array.get(i).tally, 0, maxY, 3, 500/4);
    barY = constrain(barY, 0, 500/4);
    fill(array.get(i).colour);
    rect(500 + i*(barX+1), Height - (barY/2), barX, barY );
  }
}


int maxTally(ArrayList<SmartColor> array) {
  int maxBarY = 0;
  for (int i = 0; i < array.size(); i++) {
    if (array.get(i).tally > maxBarY) {
      maxBarY = array.get(i).tally;
    }
  }
  return maxBarY;
}
