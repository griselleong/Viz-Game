class Pie extends Graph {
  float [] percents;
  float centerXCoord;
  float centerYCoord;
  float diameter;

  //hardcoded color scheme
  color [] colors = {
    color(255, 57, 0),
    color(255, 152, 64),
    color(1, 147, 154),
    color(0, 117, 54),
    color(255, 107, 64),
    color(255, 118, 0),
    color(52, 198, 205),
    color(0, 180, 84),
    color(191, 80, 48),
    color(255, 180, 115),
    color(0, 96, 100),
    color(34, 135, 81)    
  };

  //  Pie(float [] p, float x, float y, float d){

  Pie(float [] p, float x, float y, float d, float xStart, float xEnd, float yStart, float yEnd) {
    super(xStart, xEnd, yStart, yEnd, false); 

    percents = p;
    centerXCoord = x;
    centerYCoord = y;
    diameter = d;
     
  }
  
  float percentToAngle(float percent) {
    return (percent/100)*360;
  }  

  float degToRadians(float degrees) {
    return degrees*(PI/180);
  }

  void drawLine(float radian, color c) {
    stroke(c);  
    float xCoord = centerXCoord + (diameter/2) * cos(radian);
    float yCoord = centerYCoord - (diameter/2) * sin(radian);
    line(centerXCoord, centerYCoord, xCoord, yCoord);
  }

  void drawSlice(float startRadian, float endRadian, color c) {
    for (float i = startRadian; i < endRadian; i += 0.001) {
      drawLine(i, c);
    }
  }

  void drawPie() {
    //draw circle
    super.draw();
    ellipse(centerXCoord, centerYCoord, diameter, diameter);

    float degSum = 0;

    //draw slices
    for (int i = 0; i < percents.length; i++) {
      float startAngle = degSum;
      degSum += percentToAngle(percents[i]);
      float endAngle = degSum;

      drawSlice(degToRadians(startAngle), degToRadians(endAngle), colors[i]);
    }
  }
  
  public color [] getColors(){
    return colors; 
  }
}



