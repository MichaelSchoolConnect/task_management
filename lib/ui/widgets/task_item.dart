import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_management/demo/data.dart';

class TaskItem extends StatelessWidget {
  final String task;
  final DateTime date;
  final int idxToDelete;
  final GestureDetector gestureDetector;

  TaskItem({
    required this.task,
    required this.date,
    required this.idxToDelete,
    required this.gestureDetector
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Dismissible(
        background: Container(
          color: Colors.red,
        ),
        key: Key(task + task),
        onDismissed: (direction) {
          Provider.of<Data>(context, listen: false)
              .deleteItemSwipped(idxToDelete);
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Task removed"),
            backgroundColor: Colors.red,
          ));
        },
        child: ListTile(
          title: Text(
            task,
          ),
          subtitle: Text(
            (date == null)
                ? DateFormat.yMMMMEEEEd().format(DateTime.now())
                : DateFormat.yMMMMEEEEd().format(date),
          ),
        ),
      ),
    );
  }
}
