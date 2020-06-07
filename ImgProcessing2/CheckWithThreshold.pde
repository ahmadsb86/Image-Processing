//find out if a color is approximetly equal to another (a and b respectivly)
boolean CheckWithThreshold(color a, color b, int t){
  int threshold = t;
  
  if( red(a) > red (b) - threshold && red(a) < red(b) + threshold   &&  green(a) > green (b) - threshold && green(a) < green(b) + threshold  && blue(a) > blue (b) - threshold && blue(a) < blue(b) + threshold){
    return true;
  }
  return false;
}
