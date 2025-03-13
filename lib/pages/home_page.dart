import 'package:flutter/material.dart';
import '../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do"),
        backgroundColor: Colors.yellow[300],
        centerTitle: true,
        elevation: 8, // Augmente l'effet d'ombre
        shadowColor: Colors.black54, // Assombrit l'ombre pour qu'elle soit plus visible
      ),
      body: ListView(
        children: [
          ToDoTile(taskName: "Task 1", taskCompleted: true, onChanged: (p0) {
            
          },),
          ToDoTile(taskName: "Task 2", taskCompleted: false, onChanged: (p0) {
            
          },),
        ],
      )
    );
  }
}