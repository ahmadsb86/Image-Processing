PImage Shapes;
PImage colorWheel;
boolean ShowColorWheel;
color colorToChange;
color newColor;
void setup() {
  size(500, 250);
  //load images
  Shapes = loadImage("image 1.jpg");
  colorWheel = loadImage("colorWheel.jpg");
  colorWheel.resize(250, 250);
  
  colorToChange = get(0,0);
  newColor = get(0,0);
  
}
void draw() {
  //background(175);
  

  image(Shapes, 0, 0);
  if (ShowColorWheel) {
    image(colorWheel, 250, 0);
  }
  
  

}
void mouseClicked() {
  //if we are on the actual image then show the color wheel
  if (mouseX <= 250) {
    ShowColorWheel = true;
    colorToChange = get(mouseX, mouseY);
  }
  //else if we are on the color wheel then
  else if  (mouseX > 250) {

    ShowColorWheel = false;
    newColor = get(mouseX, mouseY);
    ChangeColor(Shapes, colorToChange, newColor);
    
  }
}
