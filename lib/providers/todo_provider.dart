import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  void addTodo(
    String title,
    ToDoPriority priority,
    ToDoStatus status,
    DateTime dueDate,
  ) {
    _todos.add(
      TodoModel(
        id: 'test_id',
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
    ToDoPriority priority,
    ToDoStatus status,
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
