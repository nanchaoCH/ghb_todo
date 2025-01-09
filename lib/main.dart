import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/account_provider.dart';
import 'providers/todo_provider.dart';
import 'routes/route.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
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
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.initialRoute,
      // home: const HomeExamplePage(),
    );
  }
}
