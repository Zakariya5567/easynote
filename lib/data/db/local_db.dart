import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'notes.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE notes(
            id TEXT PRIMARY KEY, 
            title TEXT,
            description TEXT,
            dateTime TEXT
          )
          ''',
        );
      },
      version: 1,
    );
  }

  Future<int> insertNote(Map<String, dynamic> note) async {
    final db = await database;
    return db.insert('notes', note);
  }

  Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await database;
    return db.query('notes', orderBy: 'id DESC');
  }

  Future<int> updateNote(Map<String, dynamic> note) async {
    final db = await database;
    return db.update('notes', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  Future<int> deleteNote(String id) async {
    final db = await database;
    return db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
