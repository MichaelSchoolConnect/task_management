import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/demo/comments_demo.dart';

import 'comment_item.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CommentsDemo>(
          builder: (BuildContext context, CommentsDemo provider, Widget child) {
            return ListView.builder(
              itemCount: provider.commentsList.length,
              itemBuilder: (context, index) {
                final listItem = provider.commentsList[index];
                return CommentItem(
                  id: index,
                  comment: listItem.comment,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
