class Note {
  int? id;
  String title;
  String content;
  DateTime date;
  DateTime? reminder;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.date,
    this.reminder,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
      'reminder': reminder?.toIso8601String(),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      date: DateTime.parse(map['date']),
      reminder: map['reminder'] != null ? DateTime.parse(map['reminder']) : null,
    );
  }
}

