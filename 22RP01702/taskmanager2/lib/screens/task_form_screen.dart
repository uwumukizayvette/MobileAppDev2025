import 'package:flutter/material.dart';

class TaskFormScreen extends StatelessWidget {
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add/Edit Task')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: taskController, decoration: InputDecoration(labelText: 'Task')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}
