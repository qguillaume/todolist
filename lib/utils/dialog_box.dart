import 'package:flutter/material.dart';
import 'package:todolist/utils/custom_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task...",
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(text: "Save", onPressed: () {}),
                const SizedBox(width: 8),
                CustomButton(text: "Cancel", onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.yellow[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
