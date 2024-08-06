import 'package:flutter/material.dart';
import 'package:todo/controller/todo_controller.dart';

class EditTodoScreen extends StatefulWidget {
  final String initialTitle;
  final String initialSubtitle;
  final Function(String, String) onEdit;

  EditTodoScreen({
    required this.initialTitle,
    required this.initialSubtitle,
    required this.onEdit,
  });

  @override
  _EditTodoScreenState createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  late TextEditingController _taskController;
  late TextEditingController _subTaskController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with initial values
    _taskController = TextEditingController(text: widget.initialTitle);
    _subTaskController = TextEditingController(text: widget.initialSubtitle);
  }

  @override
  void dispose() {
    _taskController.dispose();
    _subTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9395D3),
        title: Text(
          'Edit ToDo',
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
                  widget.onEdit(title, subtitle);
                  Navigator.pop(context); // Navigate back to the previous screen
                }
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
