import 'package:flutter/material.dart';
import 'package:todolist/utils/dialog_box.dart';
import '../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ["Task 1", true],
    ["Task 2", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void editTask(int index) {
    TextEditingController editController = TextEditingController();
    editController.text =
        toDoList[index][0]; // Pré-remplit avec la tâche actuelle

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Modifier la tâche"),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Annuler"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  toDoList[index][0] =
                      editController.text; // Met à jour la tâche
                });
                Navigator.of(context).pop();
              },
              child: const Text("Enregistrer"),
            ),
          ],
        );
      },
    );
  }

  void showTaskDetails(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Détails de la tâche"),
          content: Text(
            "Nom de la tâche : ${toDoList[index][0]}\n"
            "Statut : ${toDoList[index][1] ? "Terminée" : "En cours"}",
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Fermer"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do"),
        backgroundColor: Colors.yellow[300],
        centerTitle: true,
        elevation: 8, // Augmente l'effet d'ombre
        shadowColor:
            Colors.black54, // Assombrit l'ombre pour qu'elle soit plus visible
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange[700],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            editFunction: (context) => editTask(index),
            detailsFunction: (context) => showTaskDetails(index),
          );
        },
      ),
    );
  }
}
