import 'package:flutter/material.dart';
import 'package:todo/controller/todo_controller.dart';

class AddTodoScreen extends StatelessWidget {
  final Function(String, String) onAdd;

  AddTodoScreen({required this.onAdd});

  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _subTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xff9395D3),
        title: Text('Add ToDo',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Enter Title'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _subTaskController,
              decoration: InputDecoration(labelText: 'Enter Sub Title'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = _taskController.text;
                final subtitle = _subTaskController.text;

                if (title.isNotEmpty && subtitle.isNotEmpty) {
                  addtodo(title, subtitle);
                  Navigator.pop(context); // Navigate back to the previous screen

                }
              },
              child: Text('Add Task'),

            ),
          ],
        ),
      ),
    );
  }
}
