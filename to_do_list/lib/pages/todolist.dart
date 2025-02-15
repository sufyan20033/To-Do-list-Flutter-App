import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key, 
    required this.taskname, 
    required this.taskcompleted, 
    this.onChanged, 
    this.deletetask,
  });

  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  final VoidCallback? deletetask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 1, 38, 101),
          borderRadius: BorderRadius.circular(15), 
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Checkbox
            Checkbox(
              value: taskcompleted, 
              onChanged: onChanged,
              activeColor: const Color.fromARGB(255, 244, 5, 5), // Checkbox fill color when checked
              checkColor: Colors.white,
              side: BorderSide(color: Colors.white),
            ),

            // Task Name
            Text(
              taskname,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Sans-serif', 
                fontSize: 15, 
                fontWeight: FontWeight.bold,
                decoration: taskcompleted 
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor: Colors.red,
                decorationThickness: 4,
              ),
            ),

            // Delete Button (Replaced FloatingActionButton with IconButton)
            FloatingActionButton(
              splashColor: const Color.fromARGB(255, 59, 66, 204),
              backgroundColor: Colors.black,
              onPressed: deletetask,
              child: Icon(Icons.delete, color: const Color.fromARGB(255, 247, 4, 4)),
            ),
          ],
        ),
      ),
    );
  }
}
