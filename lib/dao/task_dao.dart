import 'package:task_management/database/tasks_database.dart';
import 'package:task_management/model/task_model.dart';

class TaskDao{
  //
/*  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Task records
  Future<int> createTodo(Task todo) async {
    final db = await dbProvider.database;
    var result = db.insert(todoTABLE, todo.toDatabaseJson());
    return result;
    }

  //Get All Task items
  //Searches if query string was passed
  Future<List<Task>> getTodos() async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty) {
        result = await db.query(todoTABLE,
            columns: columns,
            where: 'description LIKE ?',
            whereArgs: ["%$query%"]);
      }
    } else {
      result = await db.query(todoTABLE, columns: columns);
    }

    List<Task> todos = result.isNotEmpty ? result.map((item) => Task.fromDatabaseJson(item)).toList() : [];
    return todos;
  }

  //Update Todo record
  Future<int> updateTodo(Task todo) async {
    final db = await dbProvider.database;

    var result = await db.update(todoTABLE, todo.toDatabaseJson(),
        where: "id = ?", whereArgs: [todo.id]);

    return result;
  }

  //Delete Todo records
  Future<int> deleteTodo(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(todoTABLE, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  //We are not going to use this in the demo
  Future deleteAllTodos() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      todoTABLE,
    );

    return result;
  }*/
}