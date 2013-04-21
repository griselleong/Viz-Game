/**
TAKE NOTE: translate and scale are bad if we want
to do any mouseover mouseX and mouseY do not translate or scale
**/


void setup(){
  size(500, 500);
  frame.setResizable(true);
  background(255, 255, 255);
}

void draw(){
  background(255, 255, 255);
 
 /**** Pie Testing Code ****/ 
 /**
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
 **/
 
 /**** Correlation Graph Testing Code ****/
 
 float [] xData = {0.0, 1.0, 2.0, 3.0, 4.0};
 float [] yData = {0.0, 1.0, 2.0, 3.0, 4.0};
 
 Correlation corr = new Correlation(xData, yData, 0, width, 0, height);
 corr.plot();
 
 
 
}
