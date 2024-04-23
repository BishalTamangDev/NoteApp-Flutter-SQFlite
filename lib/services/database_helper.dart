import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/note_model.dart';

class DatabaseHelper {
  // - every functions are static future
  // - CRUD operations
  // - return database values
  static const _databaseName = "NoteDatabase.db";
  static const _version = 1;

  // create || return database
  static Future<Database> _getDatabase() async {
    return openDatabase(join(await getDatabasesPath(), _databaseName),
        onCreate: (db, _version) async => db.execute(
            "CREATE TABLE NoteTable(id INTEGER PRIMARY KEY, title STRING NOT NULL, description STRING NOT NULL)"),
        version: _version);
  }

  // insert note
  static Future<int> addNote(NoteModel note) async {
    final db = await _getDatabase();
    return await db.insert("NoteTable", note.toJson());
  }

  // update note
  static Future<int> updateNote(NoteModel note) async {
    final db = await _getDatabase();
    return await db.update("NoteTable", note.toJson(),
        where: "id = ?", whereArgs: [note.id]);
  }

  // delete table
  static Future<int> deleteNote(NoteModel note) async {
    final db = await _getDatabase();
    return await db.delete("NoteTable", where: "id = ?", whereArgs: [note.id]);
  }

  // fetch all values
  static Future<List<NoteModel>?> getAllNotes() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> dataMap = await db.query("NoteTable");
    if (dataMap.isEmpty) {
      return null;
    }
    return List.generate(
        dataMap.length, (index) => NoteModel.fromJson(dataMap[index]));
  }
}
