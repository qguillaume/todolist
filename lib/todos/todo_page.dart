import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'todo_controller.dart';
import 'todo_model.dart';

class TodoPage extends StatelessWidget {
  final TodoController _todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    // La page qui affiche la liste des tâches
    return Scaffold(
      appBar: AppBar(title: Text("To-Do List")),
      body: Obx(() {
        // Obx permet de rendre la liste réactive
        if (_todoController.todos.isEmpty) {
          return Center(child: Text("Aucune tâche à afficher"));
        }

        return ListView.builder(
          itemCount: _todoController.todos.length,
          itemBuilder: (context, index) {
            final todo = _todoController.todos[index];
            return ListTile(
              title: Text(todo.title),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _todoController.remove(todo);
                },
              ),
              leading: IconButton(
                icon: Icon(
                  todo.isDone
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                ),
                onPressed: () {
                  _todoController.updateTodo(
                    Todo(
                      id: todo.id,
                      title: todo.title,
                      description: todo.description,
                      isDone: !todo.isDone,
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action pour ajouter une tâche
          _showAddTodoDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Fonction pour afficher un formulaire d'ajout de tâche
  void _showAddTodoDialog(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Ajouter une tâche"),
          content: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: "Nom de la tâche"),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: "Description de la tâche",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Annuler"),
            ),
            TextButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty) {
                  _todoController.add(
                    Todo(
                      id:
                          DateTime.now()
                              .toString(), // Utilisation d'un ID unique
                      title: _titleController.text,
                      description:
                          _descriptionController.text.isEmpty
                              ? "Aucune description" // Valeur par défaut si aucune description n'est fournie
                              : _descriptionController.text,
                      isDone: false,
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: Text("Ajouter"),
            ),
          ],
        );
      },
    );
  }
}
