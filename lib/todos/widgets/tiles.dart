// lib/todos/widgets/tiles.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/todos/todo_controller.dart';
import 'package:todolist/todos/todo_model.dart';

class ToDoTile extends StatelessWidget {
  final Todo todo; // Passer l'objet Todo à ce widget

  const ToDoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController =
        Get.find(); // Trouver l'instance de TodoController

    return Card(
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text('Ma description'),
        trailing: Checkbox(
          value: todo.isDone,
          onChanged: (bool? value) {
            var updatedTodo = Todo(
              id: todo.id,
              title: todo.title,
              description: todo.description,
              isDone: value ?? false,
            );
            todoController.updateTodo(updatedTodo); // Mettre à jour la tâche
          },
        ),
      ),
    );
  }
}
