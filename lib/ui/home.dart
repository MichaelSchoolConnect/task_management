import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/demo/data.dart';
import 'package:task_management/ui/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5786FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 80, left: 30, right: 30, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.assignment,
                    color: Color(0xff5786FF),
                    size: 35,
                  ),
                  radius: 30,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("All Tasks"),
                Text(
                  "${Provider.of<Data>(context).taskList.length} tasks",
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: TasksList(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /* show modalbottomsheet and add items */
          /*showModalBottomSheet(
              context: context,
              builder: (context) {
                return NewTask();
              });*/
        },
        backgroundColor: const Color(0xff5786FF),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
