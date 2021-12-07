class Task{
  // To ID the task
  int id;

  // Task description
  String description;

  // To mark a finished task(for deletion purposes)
  bool isDone = false;

  // Constructor
  Task({required this.id, required this.description, this.isDone = false});

  factory Task.fromDatabaseJson(Map<String, dynamic> data) => Task(
    //Factory method will be used to convert JSON objects that
    //are coming from querying the database and converting
    //it into a Task object

    id: data['id'],
    description: data['description'],

    //Since sqlite doesn't have boolean type for true/false,
    //we will use 0 to denote that it is false
    //and 1 for true
    isDone: data['is_done'] == 0 ? false : true,
  );

  Map<String, dynamic> toDatabaseJson() => {
    //A method will be used to convert Task objects that
    //are to be stored into the datbase in a form of JSON

    "id": this.id,
    "description": this.description,
    "is_done": this.isDone == false ? 0 : 1,
  };

}