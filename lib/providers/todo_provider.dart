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

  Future<TodoModel?> getByIdAsync({
    required String todoId,
  }) async {
    var res = await _apiService.getTodoByIdAsync(todoId: todoId);

    if (res.statusCode != HttpStatus.ok) {
      return null;
    }

    return TodoModel.fromJson(res.data);
  }

  Future<String?> createTodoAsync({
    required String title,
    required String priority,
    required String status,
    required DateTime dueDate,
  }) async {
    var res = await _apiService.createTodoAsync(
      title: title,
      priority: priority,
      status: status,
      dueDate: dueDate,
    );

    if (res.statusCode != HttpStatus.created) {
      return null;
    }

    return res.data['id'];
  }

  Future<bool> updateTodoAsync({
    required String id,
    required String title,
    required String priority,
    required String status,
    required DateTime dueDate,
  }) async {
    var res = await _apiService.updateTodoAsync(
      id: id,
      title: title,
      priority: priority,
      status: status,
      dueDate: dueDate,
    );

    if (res.statusCode != HttpStatus.noContent) {
      return false;
    }

    return true;
  }

  void removeTodo(int index) {
    // _todos.removeAt(index);

    notifyListeners();
  }
}
