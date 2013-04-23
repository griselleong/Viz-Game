class Button {
  String value;
  int x, y, w, h; 
  color outline;

  Button(String _value, int _x, int _y, int _w, int _h) {
    value = _value;
    x = _x;
    y = _y;
    w = _w;
    h = _h; 
    outline = color(255, 255, 255);
  }

  String getVal() {
    return value;
  }

  void render() {
    fill(255);
    stroke(outline);
    rect(x, y, w, h);
    fill(0);
    text(value, x+5, y+15);
  }

  boolean itest() {
    if (mouseX < x + w && mouseX > x && mouseY > y && mouseY < y + h) {
      outline = color(255, 0, 0);
      return true;
    } 
    else {
      outline = color(0);
      return false;
    }
  }
}

