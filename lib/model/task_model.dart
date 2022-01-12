class Task{
  // To ID the task
  int? id;
 //
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

  factory Task.fromDatabaseJson(Map<String, dynamic> data) => Task(
    //Factory method will be used to convert JSON objects that
    //are coming from querying the database and converting
    //it into a Task object

    id: data['id'],
    date: data['date'],
    taskName: data['taskName'],

    //Since sqlite doesn't have boolean type for true/false,
    //we will use 0 to denote that it is false
    //and 1 for true
    isDone: data['is_done'] == 0 ? false : true,
  );

}