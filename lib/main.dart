import 'package:colicoli_todo/screens/root.dart';
import 'package:flutter/material.dart';

import 'data/repositories/todo_repository.dart';
import 'data/services/todo_api.dart';

void main() {
  TodoApi todoApi = TodoApi();
  TodoRepository(todoApi).getAllTodos();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ThemeData(
        fontFamily: "Qanelas",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Root(),
    );
  }
}
