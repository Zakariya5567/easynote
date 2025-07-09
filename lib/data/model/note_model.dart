class Note {
  String? id;
  String title;
  String description;
  String dateTime;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dateTime: map['dateTime'],
    );
  }
}
