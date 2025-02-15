import 'package:flutter/material.dart';
import 'package:to_do_list/pages/todolist.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  List to_do_list = [];


  void checkBoxChanged(int index) {
    setState(() {
      to_do_list[index][1] = !to_do_list[index][1];
    });
  }

 
  void addNewtask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        to_do_list.add([_controller.text, false]);
        _controller.clear();
      });
    }
  }


  void deletetask(int index) {
    setState(() {
      to_do_list.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 6, 48),
      appBar: AppBar(
        title: Text("To Do List App"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 5, 160),
        foregroundColor: Color.fromARGB(238, 253, 253, 253),
      ),
      body: ListView.builder(
        itemCount: to_do_list.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskname: to_do_list[index][0],
            taskcompleted: to_do_list[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deletetask: () => deletetask(index), // Corrected function call
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Prevents full-width expansion
          children: [
            Expanded(
            
              child: TextField(
              
                controller: _controller,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Add more work to do....',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 0, 5, 160),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10), // Adds spacing between text field & button
            FloatingActionButton(
              splashColor: const Color.fromARGB(255, 59, 66, 204),
              backgroundColor: Color.fromARGB(255, 0, 5, 160),
              onPressed: addNewtask,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
