import 'package:sqflite/sqflite.dart';
import 'package:task_management/database/tasks_database.dart';
import 'package:task_management/model/task_model.dart';

class TaskDao{
  //
  final dbProvider = DatabaseProvider.dbProvider;
  int id = 0;

  //Adds new Task records
  Future<int> createTodo(Task task) async {
    final db = await dbProvider.database;
    var result = db.insert(dbProvider.tableName, task.toJson());
    return result;
    }

  Future<List<Task>> getTodos({List<String>? columns, String? query}) async {
    final db = await dbProvider.database;

    var result;
    if (query != null) {
      if (query.isNotEmpty) {
        result = await db.query(dbProvider.tableName, orderBy: '$id ASC');
      }
    } else {
      result = await db.query(dbProvider.tableName, columns: columns);
    }

    List<Task> tasks = result.isNotEmpty
        ? result.map((item) => Task.fromDatabaseJson(item)).toList()
        : [];
    return tasks;
  }

  //Update task record
  Future<int> updateTodo(Task task) async {
    final db = await dbProvider.database;

    var result = await db.update('todoTABLE', task.toJson(),
        where: "id = ?", whereArgs: [task.id]);

    return result;
  }

  // Get number of task objects in database
  Future<int> getTaskAmount() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT COUNT (*) from tasks');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //Delete Task with id records
  Future<int> deleteTodo(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete('todoTABLE', where: 'id = ?', whereArgs: [id]);
    return result;
  }

}