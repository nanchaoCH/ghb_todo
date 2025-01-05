import 'package:flutter/material.dart';
import 'package:ghb_todo/pages/my_home/widgets/chat_page.dart';
import 'package:ghb_todo/pages/my_home/widgets/todo_graph_page.dart';
import 'package:ghb_todo/pages/my_home/widgets/todo_list_page.dart';
import 'package:provider/provider.dart';

import '../../providers/todo_provider.dart';
import 'widgets/todo_form_modal_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final int _listPageIndex = 0;

  final List<Widget> _pages = [
    const TodoListPage(),
    const TodoGraphPage(),
    const ChatPage(),
  ];

  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => TodoFormModalWidget(
        initialTitle: null,
        initialPriority: null,
        initialDueDate: null,
        onSave: (title, priority, dueDate) {
          Provider.of<TodoProvider>(
            context,
            listen: false,
          ).addTodo(
            title,
            priority,
            dueDate,
          );
        },
        isEdit: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('GHB Todo'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButton: Visibility(
        visible: _currentIndex == _listPageIndex,
        child: FloatingActionButton(
          onPressed: () {
            _showAddTodoDialog(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        selectedFontSize: 15,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Graph',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
