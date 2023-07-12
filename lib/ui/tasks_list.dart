import 'package:flutter/material.dart';
import 'package:task_management/bloc/task_bloc.dart';

class AllTasks extends StatelessWidget {
  AllTasks({Key key}) : super(key: key);

  final TaskBloc _taskBloc = TaskBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }

  //TODO: Get syntax from the fish app.
  /*Widget appendList(){
    return ListView.builder(
      itemCount: _taskBloc.getTaskNumber(),
      itemBuilder: (context, index) {
        final listItem = provider.taskList[index];
        return TaskItem(
            date: listItem.date,
            task: listItem.taskName,
            idxToDelete: index
        );
      },
    );
  }*/
}
