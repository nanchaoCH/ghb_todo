import 'package:flutter/material.dart';

class HomeExamplePage extends StatefulWidget {
  const HomeExamplePage({super.key});

  @override
  State<HomeExamplePage> createState() => _HomeExamplePageState();
}

class _HomeExamplePageState extends State<HomeExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Layout Widget Example'),
      ),
      body: const ThaiFlag(),
    );
  }
}

class ThaiFlag extends StatelessWidget {
  const ThaiFlag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
