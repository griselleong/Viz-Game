class Options {
  String name;
  String selected;
  String[] optNames;
  Button[] options;
  int x, y;

  Options(String _name, int _x, int _y, String default_selected) {
    println("in options construtor");
    this.name = _name;
    this.optNames = new String[] {
      "U-S", "U-C", "U-M", "U-G", "M", "S", "P", "D", "C", "A", "None"
    };
    this.x = _x;
    this.y = _y;
    this.selected = default_selected;

    options = new Button[optNames.length];
    int w = 20;
    for (int i=0; i<optNames.length;i++) {

      if ( i < 4 || i == optNames.length-1) {
        w = 40;
      }
      else {
        w = 20;
      }
 
      int c;
      if ( i < 4)
        c = 0;
      else
        c = 1;
      if (c == 0) {
        options[i] = new Button(optNames[i], x + 5 + (i%5)*50, int(y + width*.01 + c*30), w, 20, -1); 
        println("c is 0. i : " + i );
      }
      else {
        println("i: " + i + " optNames[i] : " + optNames[i] + " (i%(optNames.length-i))*30, is: " + (i%(optNames.length-i))*30);
        options[i] = new Button(optNames[i], x  + 5 + ((i-4) % (optNames.length-4))*30, int(y + width*.01 + c*30), w, 20,-1);
      }
    }
  } 


  void print_options() {
    fill(0);
    textAlign(LEFT, CENTER);
    text(name+" variable:", x+width*.02, y);
    for (int i=0; i<options.length;i++) {
      if (options[i].value == selected) {
        options[i].outline = color(255, 0, 0);
      }
      else {
        options[i].outline = color(0);
      }
      options[i].render();
    }
  }

  /*returns null if there's no intersection with opt button*/
  String itest() {
    for (int i=0; i<options.length;i++) {
      if (options[i].itest()) {
        return options[i].getVal();
      }
    }
    return null;
  }
}

