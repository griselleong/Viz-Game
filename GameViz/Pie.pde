class Pie extends Graph {
  float [] counts;
  float centerXCoord;
  float centerYCoord;
  float diameter;
  float sum;

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


/* Note: Pie now takes in an array of 'counts' that it then figures out percentages from. 
Right now, I'm actually feeding it percentages - but it still works, and is generalizable!*/
  Pie(float [] c, float x, float y, float d, float xStart, float xEnd, float yStart, float yEnd) {
    super(xStart, xEnd, yStart, yEnd, false); 

    counts = new float[c.length];
    sum = 0;
    for (int i=0; i<c.length; i++) {
      counts[i] = c[i];
      println(c[i]);
      sum += c[i];
    }
    centerXCoord = x;
    centerYCoord = y;
    diameter = d;
  }


  float countToAngle(float c) {
    return (c/sum) * 360;
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
    int pieHighlighted = -1;
  
    //draw slices
    for (int i = 0; i < counts.length; i++) {
      float startAngle = degSum;
      degSum += countToAngle(counts[i]);
      float endAngle = degSum;
      
      color c = colors[i];
      
      if (mouseX != 0){
        //calculate angle of mouse location using polar coordinate geometry
        
        float mouseAngle = atan(abs(centerYCoord - mouseY)/abs(mouseX - centerXCoord));
        if (mouseX - centerXCoord < 0 && centerYCoord - mouseY > 0){ //2nd quadrant
          mouseAngle = (PI/2 - mouseAngle) + PI/2;
        } else if (mouseX - centerXCoord < 0 && centerYCoord - mouseY < 0){ //3rd quadrant
          mouseAngle = mouseAngle + PI; 
        } else if (mouseX - centerXCoord > 0 && centerYCoord - mouseY < 0){ //4th quadrant
          mouseAngle = (PI/2 - mouseAngle) + PI + PI/2;
        }
        
        float mouseRadius = sqrt(sq(mouseX - centerXCoord) + sq(centerYCoord - mouseY));

        if (mouseAngle > degToRadians(startAngle) && mouseAngle < degToRadians(endAngle)
          && mouseRadius > 0 && mouseRadius < diameter/2){
           c = color(0, 0, 0);
           pieHighlighted = i;
          } 
      }
      
      drawSlice(degToRadians(startAngle), degToRadians(endAngle), c);
    }
    if (pieHighlighted > -1){
      showPercent(pieHighlighted); 
    }
  }

  public color [] getColors() {
    return colors;
  }
  
  void showPercent(int loc){

    float percent = (counts[loc]/sum)*100;
    stroke(255);
    fill(255, 255, 255);
    rect(mouseX, mouseY, 70, 25);
    
  }
}

