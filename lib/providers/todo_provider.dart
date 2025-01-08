import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ghb_todo/services/api_services.dart';
import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final _apiService = ApiServices();

  List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  Future<void> getListAsync() async {
    var res = await _apiService.getTodoListAsync();

    if (res.statusCode != HttpStatus.ok) {
      _todos = [];
      return;
    }

    _todos =
        (res.data as List).map((item) => TodoModel.fromJson(item)).toList();

    notifyListeners();
  }

  void addTodo(
    String title,
    String priority,
    String status,
    DateTime dueDate,
  ) {
    _todos.add(
      TodoModel(
        id: '',
        title: title,
        priority: priority,
        status: status,
        dueDate: dueDate,
        createdAt: DateTime.now(),
        createdBy: 'user',
      ),
    );

    notifyListeners();
  }

  void updateTodo(
    int index,
    String title,
    String priority,
    String status,
    DateTime dueDate,
    TodoModel originModel,
  ) {
    _todos[index] = TodoModel(
      id: originModel.id,
      title: title,
      priority: priority,
      status: status,
      dueDate: dueDate,
      createdAt: originModel.createdAt,
      createdBy: originModel.createdBy,
      updatedAt: DateTime.now(),
      updatedBy: 'user',
    );

    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);

    notifyListeners();
  }
}
