class TaskComment{
  // For deletion
  int id;

  String comment;

  // Constructor
  TaskComment({required this.id, required this.comment});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'comment': comment,
    };
  }

  factory TaskComment.fromJson(Map<String, dynamic> data) => TaskComment(
      id: data["id"],
      comment: data["comment"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "comment": comment
  };
}