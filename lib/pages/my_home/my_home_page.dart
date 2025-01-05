import 'package:flutter/material.dart';
import 'package:ghb_todo/pages/my_home/widgets/chat_page.dart';
import 'package:ghb_todo/pages/my_home/widgets/todo_graph_page.dart';
import 'package:ghb_todo/pages/my_home/widgets/todo_list_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // ตำแหน่งของ Tab ที่เลือก

  // หน้าต่างๆ ที่จะแสดงในแต่ละ Tab
  final List<Widget> _pages = [
    const TodoListPage(),
    const TodoGraphPage(),
    const ChatPage(),
  ];

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
