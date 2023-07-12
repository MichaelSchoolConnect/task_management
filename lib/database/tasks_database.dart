import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_management/model/task_comment.dart';
import 'package:task_management/model/task_model.dart';

class TaskDatabase {
  static TaskDatabase dbProvider = TaskDatabase();
  // Singleton DatabaseHelper
  static TaskDatabase _databaseHelper;
  // Singleton Database
  static Database _database;

  String databaseName = 'tasks_db.db';
  String tableName = 'tasks';
  String taskComments = 'task_comments';

  //Testing
  int id = 0;
  String date = 'date';
  String time = 'time';

  // Named constructor to create instance of DatabaseHelper
  TaskDatabase._createInstance();

  factory TaskDatabase() {
    return _databaseHelper ??= TaskDatabase._createInstance();
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, databaseName);

    // Open/create the database at a given path
    var tasksDatabase =
        await openDatabase(dbPath, version: 1, onCreate: _createDb);
    return tasksDatabase;
  }

  // Create a database.
  void _createDb(Database db, int newVersion) async {
    //Create Tasks table.
    await db.execute(
      "CREATE TABLE $tableName(id INTEGER PRIMARY KEY, "
      "$date TEXT, $time TEXT)",
    );

    //Create Tasks count table.
    await db.execute(
      "CREATE TABLE $taskComments("
      "id INTEGER PRIMARY KEY, "
      "$date TEXT, "
      "$time TEXT, "
      "FOREIGN KEY($date) REFERENCES $tableName(id))",
    );
  }

  // Fetch Operation: Get all tasks objects from database
  Future<List<Map<String, dynamic>>> getTaskList() async {
    Database db = await database;

    var result = await db?.query(tableName, orderBy: '$id ASC');
    return result;
  }

  // Insert Operation: Insert a task object to database
  Future<int> insertTask(Task task) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the Task into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same trip is inserted
    // multiple times, it replaces the previous data.
    var result = await db.insert(
      tableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return result;
  }

  // Insert Operation: Insert a comment object to database
  Future<int> insertTaskComment(TaskComment observation) async {
    print('inserted comment');
    // Get a reference to the database.
    final Database db = await database;

    // Insert the comment into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same observation is inserted
    // multiple times, it replaces the previous data.
    var result = await db?.insert(
      taskComments,
      observation.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return result;
  }

  // Update Operation: Update a task object and save it to database
  Future<int> updateTask(Task task) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Task.
    var result = await db?.update(
      tableName,
      task.toMap(),
      // Ensure that the Task has a matching id.
      where: "id = ?",
      // Pass the Task's id as a whereArg to prevent SQL injection.
      whereArgs: [task.id],
    );

    return result;
  }

  Future<int> updateTaskComment(TaskComment taskComment) async {
    print('updated comment');
    // Get a reference to the database.
    final db = await database;

    // Update the given Comment.
    var result = await db?.update(
      taskComments,
      taskComment.toMap(),
      // Ensure that the comment has a matching id.
      where: "id = ?",
      // Pass the comment's id as a whereArg to prevent SQL injection.
      whereArgs: [taskComment.id],
    );

    return result;
  }

  // Delete Operation: Delete a task object from database
  Future<int> deleteTask(int id) async {
    var db = await database;
    int result = await db.rawDelete('DELETE FROM $tableName WHERE id = $id');
    return result;
  }

  // Delete Operation: Delete a comment object from database
  Future<int> deleteTaskComment(int id) async {
    var db = await database;
    int result = await db.rawDelete('DELETE FROM $taskComments WHERE id = $id');
    return result;
  }

  // Get number of task objects in database
  Future<int> getTaskAmount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $tableName');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get number of taskComment objects in database
  Future<int> getCommentsAmount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $taskComments');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<TaskComment>> getComments() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Comments.
    final List<Map<String, dynamic>> maps = await db.query(taskComments);

    // Convert the List<Map<String, dynamic> into a List<TaskComment>.
    return List.generate(maps.length, (i) {
      return TaskComment(id: maps[i]['id'], comment: maps[i]['comment']);
    });
  }

  Future<List<Task>> getTasks() async {
    // Get a reference to the database.
    final Database db = await database;

// Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        date: maps[i]['date'],
        taskName: maps[i]['description'],
        isDone: maps[i]['isDone'],
      );
    });
  }
}
