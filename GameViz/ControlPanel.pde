class ControlPanel {

  float startX, startY, xWidth, yHeight;
  Options xOpts;
  Options yOpts;

  public ControlPanel (float _startX, float _startY, Options _xOpts, Options _yOpts) {
    this.xOpts = _xOpts;
    this.yOpts = _yOpts;
  }


  public void draw() {
    fill(255);
    rect(width*.75, height*.65, width*.23, height*.32);
  }
}

