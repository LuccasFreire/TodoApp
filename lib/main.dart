import 'package:flutter/material.dart';
import 'todoliststate.dart';
void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List Exercise',
      home: TodoList()
    );
  }
}
