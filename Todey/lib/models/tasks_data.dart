import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [
    Task(title: 'Buy milk'),
    Task(title: 'Buy eggs'),
    Task(title: 'Buy ice cream'),

  ];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }


  void addTaskToList(String taskTitle){
    print(taskTitle);
    _tasks.add(Task(title: taskTitle));
    print(_tasks.length);
    notifyListeners();

  }
  void updateCheckBox(Task value){
    value.ToggleCheckBox();
    notifyListeners();
  }
  int get taskCount {
    return _tasks.length;
  }
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}