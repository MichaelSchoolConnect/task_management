import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/demo/data.dart';
import 'package:task_management/ui/widgeta/task_item.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (BuildContext context, Data provider, Widget child) {
        return ListView.builder(
          itemCount: provider.taskList.length,
          itemBuilder: (context, index) {
            final listItem = provider.taskList[index];
            return TaskItem(
              date: listItem.date,
              task: listItem.taskName,
              idxToDelete: index
            );
          },
        );
      },
    );
  }
}
