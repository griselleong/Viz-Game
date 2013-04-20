void setup(){
  size(500, 500);
  frame.setResizable(true);
  background(255, 255, 255);
}

void draw(){
  background(255, 255, 255);
  
  float centerXCoord = width/2;
  float centerYCoord = height/2;
  float smallerDimension = 0;
  
  if (width < height){
    smallerDimension = width; 
  } else {
    smallerDimension = height;
  }
  
  //create new pie with percentages
  float [] percentages = {10, 2.5, 12.5, 25, 50};
  Pie p = new Pie(percentages, centerXCoord, centerYCoord, smallerDimension*0.8);
  p.drawPie();
  
}
