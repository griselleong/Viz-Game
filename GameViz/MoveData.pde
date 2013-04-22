
class MoveData {


  String moveName;
  int missionNum;
  int[] values;
  String axisLabel;
  String description;


  public MoveData(String _moveName, int _missionNum, int[] _values, String _axisLabel, String _description) {
    this.moveName = _moveName;
    this.missionNum = _missionNum;
    this.values = new int[_values.length];
    for (int i=0; i<_values.length; i++)
      this.values[i] = _values[i];
    this.axisLabel = _axisLabel;
    this.description = _description;
  }
  
  
  
  
  
}

