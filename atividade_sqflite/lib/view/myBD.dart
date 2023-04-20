import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

Future<Database> initDatabase() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'my_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT, login TEXT , senha TEXT)',
      );
    },
    version: 1,
  );
  return database;
}

Future<List<Map<String, dynamic>>> getUsers() async {
  final db = await initDatabase();
  return db.query('user');
}
