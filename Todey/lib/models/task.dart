class Task {
  final String title;
  bool isDone;
  final Function checkBoxToggleCallback;

  Task({this.title,this.checkBoxToggleCallback,this.isDone = false});

  void ToggleCheckBox(){
    isDone = ! isDone;
  }
}