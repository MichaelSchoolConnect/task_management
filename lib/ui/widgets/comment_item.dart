import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/demo/comments_demo.dart';

class CommentItem extends StatelessWidget {
  final int id;
  final String comment;

  CommentItem({
    required this.id,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
      ),
      key: Key(comment + comment),
      onDismissed: (direction) {
        Provider.of<CommentsDemo>(context, listen: false)
            .deleteItemSwipped(id);
        Scaffold.of(context).showSnackBar(const SnackBar(
          content: Text("Task removed"),
          backgroundColor: Colors.red,
        ));
      },
      child: ListTile(
        title: Text(
          comment,
        ),
      ),
    );
  }
}
