import 'dart:async';

import 'package:task_management/model/task_model.dart';
import 'package:task_management/repository/task_repository.dart';

class TaskBloc{
 /* //Get instance of the Repository
  final _todoRepository = TaskRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _todoController = StreamController<List<Task>>.broadcast();

  get todos => _todoController.stream;

  TaskBlocc() {
    getTodos(query: '');
  }

  getTodos({required String query}) async {
    //sink is a way of adding data reactively to the stream
    //by registering a new event
    _todoController.sink.add(await _todoRepository.getAllTodos(query: query));
  }

  addTodo(Task task) async {
    await _todoRepository.insertTodo(task);
    getTodos(query: '');
  }

  updateTodo(Task task) async {
    await _todoRepository.updateTodo(task);
    getTodos(query: '');
  }

  deleteTodoById(int id) async {
    _todoRepository.deleteTodoById(id);
    getTodos(query: '');
  }

  dispose() {
    _todoController.close();
  }*/
}