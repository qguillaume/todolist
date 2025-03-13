import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(children: [
          Checkbox(value: taskCompleted, onChanged: onChanged),
          Text(taskName),
        ],
        ),
        
        
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );

  }
}