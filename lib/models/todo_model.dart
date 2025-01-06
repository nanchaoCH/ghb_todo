enum Priority { low, medium, high }

class TodoModel {
  final String title;
  final Priority priority;
  final DateTime dueDate;
  final DateTime createdDate;

  TodoModel({
    required this.title,
    required this.priority,
    required this.dueDate,
    required this.createdDate,
  });
}