class Button {
  String value;
  float x, y, w, h; 
  color outline;

  Button(String _value, float _x, float _y, float _w, float _h, color out) {
    value = _value;
    x = _x;
    y = _y;
    w = _w;
    h = _h; 
    if (out == -1)
    outline = color(255, 255, 255);
    else 
    outline = out;
  }

  String getVal() {
    return value;
  }

  void render() {
    fill(255);
    stroke(outline);
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    text(value, x+(w/2), y+(h/2));
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

