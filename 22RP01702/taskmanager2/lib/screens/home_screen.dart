import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> tasks = ['Buy groceries', 'Walk the dog', 'Read a book'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Tasks')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(tasks[index]),
          trailing: Icon(Icons.edit),
          onTap: () => Navigator.pushNamed(context, '/task-form'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/task-form'),
        child: Icon(Icons.add),
      ),
    );
  }
}
