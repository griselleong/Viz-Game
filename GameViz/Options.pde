class Options {
  String name;
  String selected;
  String[] optNames;
  Button[] options;
  int x, y;

  Options(String _name, int _x, int _y) {
    this.name = _name;
    this.optNames = new String[] {
      "S", "U-S", "U-C", "U-M", "U-G", "None", "M", "P", "D", "C", "A"
    };
    this.x = _x;
    this.y = _y;
    this.selected = "S";
    
    options = new Button[optNames.length];
    int w = 20;
    for(int i=0; i<optNames.length;i++){
     if(i >= 1 && i < 6){
      w = 40; 
     }
     else{
      w = 20; 
     }
     options[i] = new Button(optNames[i], x + i*50, y, w, 20); 
    }
  } 


  void print_options() {
    fill(0);
    text(name+":", x, y);
    for (int i=0; i<options.length;i++) {
      if(options[i].value == selected){
       options[i].outline = color(255,0,0); 
      }
      else{
       options[i].outline = color(0); 
      }
      options[i].render();
    }
  }
  
  /*returns null if there's no intersection with opt button*/
  String itest(){
    for(int i=0; i<options.length;i++){
     if(options[i].itest()){
      return options[i].getVal();
     } 
    }
    return null;
  }
  
}

