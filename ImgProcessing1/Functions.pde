void ChangeColor(PImage toChange, color oldColor, color newColor){
  Shapes.loadPixels();
  for(int i = 0; i < toChange.pixels.length; i++){
    if(toChange.pixels[i] == oldColor){
      toChange.pixels[i] = newColor;
    }
  }
  Shapes.updatePixels();
}
