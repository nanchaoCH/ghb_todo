enum ToDoPriority {
  low,
  medium,
  high,
}

enum ToDoStatus {
  pending,
  inprogress,
  completed,
}

class TodoModel {
  final String id;
  final String title;
  final ToDoPriority priority;
  final ToDoStatus status;
  final DateTime dueDate;
  final String createdBy;
  final DateTime createdAt;
  final String? updatedBy;
  final DateTime? updatedAt;

  TodoModel({
    required this.id,
    required this.title,
    required this.priority,
    required this.status,
    required this.dueDate,
    required this.createdBy,
    required this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });
}
