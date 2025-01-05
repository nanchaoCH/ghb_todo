import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  void addTodo(
    String title,
    Priority priority,
    DateTime dueDate,
  ) {
    _todos.add(
      TodoModel(
        title: title,
        priority: priority,
        dueDate: dueDate,
        createdDate: DateTime.now(),
      ),
    );

    notifyListeners();
  }

  void updateTodo(
      int index, String title, Priority priority, DateTime dueDate) {
    _todos[index] = TodoModel(
      title: title,
      priority: priority,
      dueDate: dueDate,
      createdDate: _todos[index].createdDate,
    );

    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);

    notifyListeners();
  }
}
