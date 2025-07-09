import 'package:flutter/cupertino.dart';

import '../data/db/local_db.dart';
import '../data/model/note_model.dart';

class HomeProvider extends ChangeNotifier {
  // SignIn controller
  TextEditingController addTitleController = TextEditingController();
  TextEditingController addDescriptionController = TextEditingController();

  clearAddNoteFields() {
    addTitleController.clear();
    addDescriptionController.clear();
    notifyListeners();
  }

  // SignIn controller
  TextEditingController editTitleController = TextEditingController();
  TextEditingController editDescriptionController = TextEditingController();

  updateEditNoteFields(Note note) {
    editTitleController.text = note.title;
    editDescriptionController.text = note.description;
    notifyListeners();
  }

  clearEditNoteFields() {
    editTitleController.clear();
    editDescriptionController.clear();
    notifyListeners();
  }

  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Note> notes = [];

  // List<Note> notes = [
  //   Note(
  //     id: "1",
  //     title: "Peloponnesian War",
  //     description:
  //         "Chronicles the ancient conflict between Athens and Sparta. Highlights politics, strategy, and human nature. A foundational work of historical analysis.",
  //     dateTime: DateTime.now().toString(),
  //   ),
  //   Note(
  //     id: "2",
  //     title: "Roman Empire Fall",
  //     description:
  //         "Details the collapse of Rome over centuries. Explores invasions, politics, and Christianity’s role. A timeless study of societal decline.",
  //     dateTime: DateTime.now().toString(),
  //   ),
  //   Note(
  //     id: "3",
  //     title: "People’s History",
  //     description:
  //         "Retells U.S. history from marginalized perspectives. Focuses on workers, women, and Indigenous peoples. Challenges traditional historical narratives.",
  //     dateTime: DateTime.now().toString(),
  //   ),
  //   Note(
  //     id: "4",
  //     title: "Guns & Steel",
  //     description:
  //         "Links geography to societal development and power. Explores agriculture, technology, and conquest. A groundbreaking work on human history.",
  //     dateTime: DateTime.now().toString(),
  //   ),
  //   Note(
  //     id: "5",
  //     title: "The Silk Roads",
  //     description:
  //         "Tracks ancient trade routes connecting East and West. Shows their role in shaping cultures and economies. A global view of historical exchange.",
  //     dateTime: DateTime.now().toString(),
  //   ),
  //   Note(
  //     id: "6",
  //     title: "The Crusades",
  //     description:
  //         "Analyzes medieval holy wars between Christians and Muslims. Explores their religious, cultural, and political impacts. A key study of medieval conflicts.",
  //     dateTime: DateTime.now().toString(),
  //   ),
  //   Note(
  //     id: "7",
  //     title: "World War II",
  //     description:
  //         "Chronicles the causes, events, and aftermath of WWII. Highlights global conflict and transformative change. A pivotal moment in modern history.",
  //     dateTime: DateTime.now().toString(),
  //   ),
  //   Note(
  //     id: "8",
  //     title: "Civil War Era",
  //     description:
  //         "Explores the causes and effects of the U.S. Civil War. Focuses on slavery, politics, and national unity. A defining period in American history.",
  //     dateTime: DateTime.now().toString(),
  //   ),
  //   Note(
  //     id: "9",
  //     title: "The Great Plague",
  //     description:
  //         "Recounts the Black Death’s devastation in Europe. Examines its social, economic, and cultural impacts. A chilling account of medieval disease.",
  //     dateTime: DateTime.now().toString(),
  //   ),
  //   Note(
  //     id: "10",
  //     title: "Ancient Empires",
  //     description:
  //         "Explores the rise and fall of early civilizations. Highlights Egypt, Mesopotamia, and their legacies. A study of power, culture, and history.",
  //     dateTime: DateTime.now().toString(),
  //   ),
  // ];

  Future<void> fetchNotes() async {
    final notesList = await dbHelper.getNotes();
    notes = notesList.map((e) => Note.fromMap(e)).toList();
    notifyListeners();
  }

  Future<void> deleteNote(String id) async {
    await dbHelper.deleteNote(id);
    fetchNotes();
  }

  Future<void> addNote() async {
    final newNote = Note(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: addTitleController.text,
      description: addDescriptionController.text,
      dateTime: DateTime.now().toString(),
    );
    await dbHelper.insertNote(newNote.toMap());
    // await _dbHelper.updateNote(newNote.toMap());
    fetchNotes();
  }

  Future<void> updateNote(String id) async {
    final newNote = Note(
      id: id,
      title: editTitleController.text,
      description: editDescriptionController.text,
      dateTime: DateTime.now().toString(),
    );
    await dbHelper.updateNote(newNote.toMap());
    fetchNotes();
  }
}
