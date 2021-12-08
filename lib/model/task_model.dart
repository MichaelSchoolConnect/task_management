class Task{
  // To ID the task
  int? id;

  DateTime date;

  // Task description
  String taskName;


  // To mark a finished task(for deletion purposes)
  bool isDone = false;

  // Constructor
  Task({required this.id, required DateTime this.date, required this.taskName, this.isDone = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'taskName': taskName,
      'isDone': isDone
    };
  }

  factory Task.fromJson(Map<String, dynamic> data) => Task(
    id: data["id"],
    date: data["date"],
    taskName: data["taskName"],
    isDone: data["isDone"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "taskName": taskName,
    "isDone": isDone
  };

}