class ProgressHelper {
  static final ProgressHelper _singleton = new ProgressHelper._internal();

  factory ProgressHelper() {
    return _singleton;
  }

  ProgressHelper._internal();

  int cluesCount = 0;
  List cluesIDs = [];
  List cluesAnswered = [];
  int selectedSuspicious = 0;
  bool isCompleted = false;

  setCluesCount(int value) {
    cluesCount = value;
  }

  getCluesCount() {
    return cluesCount;
  }

  setCluesIDs(List newCluesIDs) {
    cluesIDs = newCluesIDs;
  }

  getCluesIDs() {
    return cluesIDs;
  }

  setCluesAnswered(List newCluesAnswered) {
    cluesAnswered = newCluesAnswered;
  }

  getCluesAnswered() {
    return cluesAnswered;
  }

  setSelectedSuspicious(int newSelectedSuspicious) {
    selectedSuspicious = newSelectedSuspicious;
  }

  getSelectedSuspicious() {
    return selectedSuspicious;
  }

  setIsCompleted(bool newIsCompleted){
    isCompleted = newIsCompleted;
  }

  getIsCompleted(){
    return isCompleted;
  }
}
