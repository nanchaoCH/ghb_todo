class ToDoPriority {
  const ToDoPriority._();

  static const low = 'Low';
  static const medium = 'Medium';
  static const high = 'High';

  static const List<String> allStatuses = [
    low,
    medium,
    high,
  ];
}

class ToDoStatus {
  const ToDoStatus._();

  static const pending = 'Pending';
  static const inprogress = 'InProgress';
  static const completed = 'Completed';

  static const List<String> allStatuses = [
    pending,
    inprogress,
    completed,
  ];
}

class TodoModel {
  String id;
  String title;
  String priority;
  String status;
  DateTime dueDate;
  String createdBy;
  DateTime? createdAt;
  String? updatedBy;
  DateTime? updatedAt;

  TodoModel({
    required this.id,
    required this.title,
    required this.priority,
    required this.status,
    required this.dueDate,
    required this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      priority: json['priority'],
      status: json['status'],
      dueDate: DateTime.parse(json['dueDate']),
      createdBy: json['createdBy'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedBy: json['updatedBy'],
      updatedAt:
          json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt']),
    );
  }
}
