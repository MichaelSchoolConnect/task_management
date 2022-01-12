import 'package:flutter/cupertino.dart';
import 'package:task_management/model/task_model.dart';

class Data extends ChangeNotifier {

  List<Task> taskList = [
     Task(
       id: 0,
        date: DateTime.now(),
        taskName: "Take Fido for a walk"),
    Task(
      id: 1,
      date: DateTime.now(),
      taskName: "Watch United"
    ),
     Task(
      id: 2,
      date: DateTime.now(),
      taskName: "Update Fantasy Team",
    ),
  ];

  void addToList(String taskName, DateTime taskDate, bool isDone) {
    taskList.add( Task(
      id: null,
      taskName: taskName,
      date: taskDate,
    ));
    notifyListeners();
  }

  void deleteItemSwipped(int idx) {
    taskList.removeAt(idx);
    notifyListeners();
  }

  List<Task> allItems(){
    return taskList;
  }

  int count(){
    return taskList.length;
  }

  int countComments(){
    return taskList.length + 2;
  }
}
