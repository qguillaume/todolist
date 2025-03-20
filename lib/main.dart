import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'todos/todo_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ToDo App',
      home: TodoPage(), // Appelle directement la TodoPage
    );
  }
}
