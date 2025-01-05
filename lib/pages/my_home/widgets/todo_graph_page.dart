import 'package:flutter/material.dart';

class TodoGraphPage extends StatefulWidget {
  const TodoGraphPage({super.key});

  @override
  State<TodoGraphPage> createState() => _TodoGraphPageState();
}

class _TodoGraphPageState extends State<TodoGraphPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.bar_chart,
        size: 100,
        color: Colors.green,
      ),
    );
  }
}
