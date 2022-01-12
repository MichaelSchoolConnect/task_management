import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/demo/data.dart';
import 'package:task_management/ui/widgets/task_item.dart';

import 'comments_list.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<Data>(
          builder: (BuildContext context, Data provider, Widget? child) {
            return ListView.builder(
              itemCount: provider.taskList.length,
              itemBuilder: (context, index) {
                final listItem = provider.taskList[index];
                return TaskItem(
                  date: listItem.date,
                  task: listItem.taskName,
                  idxToDelete: index,
                  gestureDetector: GestureDetector(onTap: (){
                    if (kDebugMode) {
                      print('onTap');
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CommentsList()),
                    );
                  }
                 ,),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add'),
        icon: const Icon(
          Icons.add,
          size: 24.0,
        ),
        onPressed: (){
          var d = Data();
          d.addToList('New Task', DateTime.now(), true);
        },
      ),
    );
  }

}
