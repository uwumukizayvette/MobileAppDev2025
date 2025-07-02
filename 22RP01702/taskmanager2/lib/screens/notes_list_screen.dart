import 'package:flutter/material.dart';
import '../models/note.dart';
import '../helpers/note_database.dart';
import 'note_edit_screen.dart';

class NotesListScreen extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  late Future<List<Note>> _notesFuture;

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  void _refreshNotes() {
    setState(() {
      _notesFuture = NoteDatabase.instance.readAllNotes();
    });
  }

  void _deleteNote(int id) async {
    await NoteDatabase.instance.delete(id);
    _refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Notes')),
      body: FutureBuilder<List<Note>>(
        future: _notesFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final notes = snapshot.data!;
          if (notes.isEmpty) return Center(child: Text('No notes yet!'));
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content, maxLines: 1, overflow: TextOverflow.ellipsis),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteNote(note.id!),
                ),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => NoteEditScreen(note: note)),
                  );
                  _refreshNotes();
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => NoteEditScreen()),
          );
          _refreshNotes();
        },
      ),
    );
  }
}

