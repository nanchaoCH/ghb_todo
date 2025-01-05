import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/todo_model.dart';

class TodoFormModalWidget extends StatefulWidget {
  final bool isEdit;
  final String? initialTitle;
  final Priority? initialPriority;
  final DateTime? initialDueDate;
  final Function(String, Priority, DateTime) onSave;

  const TodoFormModalWidget({
    super.key,
    required this.isEdit,
    required this.initialTitle,
    required this.initialPriority,
    required this.initialDueDate,
    required this.onSave,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TodoFormModalWidgetState createState() {
    return _TodoFormModalWidgetState();
  }
}

class _TodoFormModalWidgetState extends State<TodoFormModalWidget> {
  late TextEditingController _titleController;
  late Priority? _selectedPriority;
  late DateTime? _selectedDueDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle);
    _selectedPriority = widget.initialPriority ?? Priority.low;
    _selectedDueDate = widget.initialDueDate;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.isEdit ? const Text('Edit') : const Text('Add');
    final titleIcon = widget.isEdit ? Icons.edit : Icons.add;

    return AlertDialog(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              titleIcon,
              size: 20,
            ),
          ),
          title,
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: 'Enter a task',
              labelText: 'Task Title',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Priority:'),
          ),
          const SizedBox(height: 5),
          DropdownButton<Priority>(
            isExpanded: true,
            value: _selectedPriority,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedPriority = value;
                });
              }
            },
            items: Priority.values.map((priority) {
              return DropdownMenuItem(
                value: priority,
                child: Text(priority.name.toUpperCase()),
              );
            }).toList(),
          ),
          const SizedBox(height: 15),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Due Date:'),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: _selectedDueDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                setState(() {
                  _selectedDueDate = pickedDate;
                });
              }
            },
            child: Text(
              _selectedDueDate == null
                  ? 'Select Due Date'
                  : DateFormat('dd-MMM-yyyy')
                      .format(_selectedDueDate!.toLocal()),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (_titleController.text.isEmpty ||
                _selectedPriority == null ||
                _selectedDueDate == null) {
              return;
            }

            widget.onSave(
              _titleController.text,
              _selectedPriority!,
              _selectedDueDate!,
            );

            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
