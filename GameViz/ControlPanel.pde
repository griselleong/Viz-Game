class ControlPanel {
  
  float startX, startY, xWidth, yHeight;
  Options xOpts;
  Options yOpts;
  
  public ControlPanel (float _startX, float _startY, Options _xOpts, Options _yOpts){
 //   this.startX = width*.75;
 //   this.startY = height*.65;
   // this.xWidth = width*.23;
   // this.yHeight = height*.32;
    this.xOpts = _xOpts;
    this.yOpts = _yOpts;
  }
  
  
  public void draw(){
   fill(255);
  rect(width*.75, height*.65, width*.23, height*.32);
  //fill(0);
   // yOpts.print_options();
    
    
  }
  
  
  
  
  
  
  
  
  
}
