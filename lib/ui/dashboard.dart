import 'package:flutter/material.dart';
import 'package:task_management/bloc/task_bloc.dart';
import 'package:task_management/demo/data.dart';
import 'package:task_management/ui/widgets/comments_list.dart';
import 'package:task_management/ui/widgets/task_list.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key key}) : super(key: key);

  //We load our Task BLoC that is used to get
  //the stream of Task for StreamBuilder
  final TaskBloc _taskBlocBloc = TaskBloc();
  //late DatabaseProvider _provider;

  @override
  Widget build(BuildContext context) {
    var _taskNumber = _taskBlocBloc.getTaskNumber();
    var _totalComments = _taskBlocBloc.getTaskNumber();
    var data = Data();
    var allTasks = data.count();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            InkWell(
              child: Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      allTasks.toString() + " Tasks",
                      style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TasksList()),
                );
              },
            ),
            const SizedBox(
              height: 25.0,
            ),
            InkWell(
              child: Card(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      data.countComments().toString() + " Comments",
                      style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CommentsList()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
