import 'package:flutter/cupertino.dart';
import 'package:task_management/model/task_comment.dart';

class CommentsDemo extends ChangeNotifier {

  List<TaskComment> commentsList = [
    TaskComment(id: 1, comment: "Please push the code to the vcs"),
    TaskComment(id: 1, comment: "Fix the two bugs in the main.dart class"),
    TaskComment(id: 1, comment: "Forwarded!")
  ];

  void addToList(String commentName) {
    commentsList.add( TaskComment(id: 1, comment: commentName));
    notifyListeners();
  }

  void deleteItemSwipped(int idx) {
    commentsList.removeAt(idx);
    notifyListeners();
  }

  List<TaskComment> allItems(){
    return commentsList;
  }

  int count(){
    return commentsList.length;
  }

  int countComments(){
    return commentsList.length + 2;
  }
}
