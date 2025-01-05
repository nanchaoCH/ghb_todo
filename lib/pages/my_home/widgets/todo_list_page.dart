import 'package:flutter/material.dart';
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
        initialDueDate: todo.dueDate,
        onSave: (title, priority, dueDate) {
          Provider.of<TodoProvider>(context, listen: false)
              .updateTodo(index, title, priority, dueDate);
        },
        isEdit: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoProvider>(context).todos;

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];

        return GestureDetector(
          onTap: () {
            _showEditTodoDialog(
              context,
              todo,
              index,
            );
          },
          child: ListTile(
            leading: const Icon(Icons.task),
            title: Text(todo.title),
            subtitle: Text(DateFormat('dd-MMM-yyyy').format(todo.createdDate)),
          ),
        );
      },
    );
  }
}
