import 'package:task_management/dao/task_dao.dart';
import 'package:task_management/model/task_model.dart';

class TaskRepository{

  final taskDao = TaskDao();

  Future getAllTodos({required String query}) => taskDao.getTasks();

  Future insertTodo(Task todo) => taskDao.createTask(todo);

  Future updateTodo(Task todo) => taskDao.updateTask(todo);

  Future deleteTodoById(int id) => taskDao.deleteTask(id);

  Future getTasksNumber() => taskDao.getTaskCount();

}