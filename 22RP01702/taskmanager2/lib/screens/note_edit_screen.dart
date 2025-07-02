import 'package:flutter/material.dart';
import '../models/note.dart';
import '../helpers/note_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NoteEditScreen extends StatefulWidget {
  final Note? note;
  NoteEditScreen({this.note});

  @override
  _NoteEditScreenState createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _content;
  DateTime? _reminder;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _title = widget.note?.title ?? '';
    _content = widget.note?.content ?? '';
    _reminder = widget.note?.reminder;
    _initNotifications();
  }

  void _initNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleNotification(DateTime scheduledTime, String noteTitle) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Note Reminder',
      noteTitle,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails('note_channel', 'Notes', importance: Importance.max),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  void _saveNote() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final note = Note(
        id: widget.note?.id,
        title: _title,
        content: _content,
        date: DateTime.now(),
        reminder: _reminder,
      );
      if (widget.note == null) {
        await NoteDatabase.instance.create(note);
      } else {
        await NoteDatabase.instance.update(note);
      }
      if (_reminder != null) {
        await _scheduleNotification(_reminder!, _title);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.note == null ? 'Add Note' : 'Edit Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Enter a title' : null,
                onSaved: (value) => _title = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _content,
                decoration: InputDecoration(labelText: 'Content'),
                maxLines: 8,
                validator: (value) => value!.isEmpty ? 'Enter content' : null,
                onSaved: (value) => _content = value!,
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text(_reminder == null
                    ? 'Set Reminder'
                    : 'Reminder: ${_reminder.toString()}'),
                trailing: Icon(Icons.alarm),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _reminder ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(_reminder ?? DateTime.now()),
                    );
                    if (time != null) {
                      setState(() {
                        _reminder = DateTime(
                          picked.year,
                          picked.month,
                          picked.day,
                          time.hour,
                          time.minute,
                        );
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveNote,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
