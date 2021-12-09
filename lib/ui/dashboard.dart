import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/bloc/task_bloc.dart';
import 'package:task_management/database/tasks_database.dart';
import 'package:task_management/demo/data.dart';

class Dashboard extends StatelessWidget{
  Dashboard({Key? key}) : super(key: key);

  //We load our Task BLoC that is used to get
  //the stream of Task for StreamBuilder
  final TaskBloc _taskBlocBloc = TaskBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[
              Text('_taskBlocBloc.getTaskNumber()'),
          Text('data')
        ],
      ),
    );
  }
}