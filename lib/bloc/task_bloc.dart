import 'dart:async';

import 'package:task_management/model/task_model.dart';
import 'package:task_management/repository/task_repository.dart';

class TaskBloc{
  //Get instance of the Repository
  final _tasksRepository = TaskRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _tasksController = StreamController<List<Task>>.broadcast();

  get tasks => _tasksController.stream;

  TaskBlocc() {
    getTodos(query: '');
  }

  getTodos({ String? query}) async {
    //sink is a way of adding data reactively to the stream
    //by registering a new event
    _tasksController.sink.add(await _tasksRepository.getAllTodos(query: ''));
  }

  addTodo(Task task) async {
    //await _tasksRepository.insert(task);
    getTodos();
  }

  updateTodo(Task task) async {
    await _tasksRepository.updateTodo(task);
    getTodos();
  }

  deleteTodoById(int id) async {
    _tasksRepository.deleteTodoById(id);
    getTodos();
  }

  dispose() {
    _tasksController.close();
  }
}