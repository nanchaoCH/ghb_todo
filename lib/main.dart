import 'package:flutter/material.dart';
import 'package:ghb_todo/pages/login/login_page.dart';
import 'package:ghb_todo/pages/my_home/my_home_page.dart';
import 'package:provider/provider.dart';

import 'providers/todo_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GHB Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // home: const MyHomePage(),
      home: const LoginPage(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Todo App'),
      //     backgroundColor: Colors.greenAccent,
      //   ),
      //   body: const Center(
      //     child: Text('todo app'),
      //   ),
      // ),
    );
  }
}
