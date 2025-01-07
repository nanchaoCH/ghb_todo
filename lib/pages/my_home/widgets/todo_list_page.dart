import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/todo_model.dart';
import '../../../providers/todo_provider.dart';
import 'todo_form_modal_widget.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  void _showEditTodoDialog(
    BuildContext context,
    TodoModel todo,
    int index,
  ) {
    showDialog(
      context: context,
      builder: (context) => TodoFormModalWidget(
        initialTitle: todo.title,
        initialPriority: todo.priority,
        initialStatus: todo.status,
        initialDueDate: todo.dueDate,
        onSave: (
          title,
          priority,
          status,
          dueDate,
        ) {
          Provider.of<TodoProvider>(
            context,
            listen: false,
          ).updateTodo(
            index,
            title,
            status,
            priority,
            dueDate,
            todo,
          );
        },
        isEdit: true,
      ),
    );
  }

  Future<bool> showConfirmDeleteModal(
    BuildContext context,
    int todoIndex,
  ) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
          TextButton(
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Provider.of<TodoProvider>(context, listen: false)
                  .removeTodo(todoIndex);

              Navigator.of(context).pop(false);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoProvider>(context).todos;

    final priorityOrder = [
      ToDoPriority.high.name,
      ToDoPriority.medium.name,
      ToDoPriority.low.name,
    ];

    todos.sort((a, b) {
      final priorityComparison =
          priorityOrder.indexOf(a.priority.name).compareTo(
                priorityOrder.indexOf(b.priority.name),
              );

      if (priorityComparison == 0) {
        return a.title.compareTo(b.title);
      }

      return priorityComparison;
    });

    Color getPriorityColor(ToDoPriority priority) {
      switch (priority) {
        case ToDoPriority.high:
          return Colors.red[300]!;
        case ToDoPriority.medium:
          return Colors.orange[300]!;
        case ToDoPriority.low:
          return Colors.green[300]!;
      }
    }

    Color getStatusColor(ToDoStatus status) {
      switch (status) {
        case ToDoStatus.pending:
          return Colors.grey[300]!;
        case ToDoStatus.inprogress:
          return Colors.blue[300]!;
        case ToDoStatus.completed:
          return Colors.green[300]!;
      }
    }

    Row buildBadgeColor({
      required String title,
      required String label,
      required Color color,
      required double width,
    }) {
      return Row(
        children: [
          Text(
            '$title: ',
          ),
          SizedBox(
            width: width,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(label),
              ),
            ),
          ),
        ],
      );
    }

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];

        return Card(
          child: Slidable(
            endActionPane: ActionPane(
              extentRatio: 0.25,
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  autoClose: true,
                  onPressed: (context) {
                    showConfirmDeleteModal(context, index);
                  },
                  backgroundColor: Colors.red[300]!,
                  icon: Icons.delete,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                _showEditTodoDialog(
                  context,
                  todo,
                  index,
                );
              },
              child: ListTile(
                leading: const Icon(
                  Icons.task,
                  color: Colors.grey,
                ),
                title: Text(
                  todo.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildBadgeColor(
                      title: 'status',
                      label: todo.status.name,
                      color: getStatusColor(todo.status),
                      width: 100,
                    ),
                    const SizedBox(height: 5),
                    buildBadgeColor(
                        title: 'prioriry',
                        label: todo.priority.name,
                        color: getPriorityColor(todo.priority),
                        width: 70),
                    const SizedBox(height: 5),
                    Text(
                        'due date: ${DateFormat('dd-MMM-yyyy').format(todo.dueDate)}'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
