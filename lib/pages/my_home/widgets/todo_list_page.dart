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

    Color getTaskIconColor(ToDoPriority priority) {
      switch (priority) {
        case ToDoPriority.high:
          return Colors.red;
        case ToDoPriority.medium:
          return Colors.orange;
        case ToDoPriority.low:
          return Colors.green;
      }
    }

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];

        return Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                autoClose: true,
                onPressed: (context) {
                  showConfirmDeleteModal(context, index);
                },
                backgroundColor: Colors.red,
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
              leading: Icon(
                Icons.task,
                color: getTaskIconColor(todo.priority),
              ),
              title: Text(
                todo.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'prioriry: ${todo.priority.name.toString()}',
                  ),
                  Text(
                      'due date: ${DateFormat('dd-MMM-yyyy').format(todo.dueDate)}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
