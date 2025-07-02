import 'package:flutter/material.dart';
import 'screens/notes_list_screen.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Notes',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: NotesListScreen(),
    );
  }
}
