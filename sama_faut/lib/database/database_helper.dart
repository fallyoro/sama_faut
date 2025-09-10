import 'package:path_provider/path_provider.dart';
import 'package:sama_faut/models/laundry.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import '../models/user.dart';

class DatabaseHelper {
  static Database? _database;

  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    return await initDB();
  }

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = p.join(databasePath, 'sama_faut.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await _createTable(db);
      },
    );
  }

  Future<void> _createTable(Database db) async {
    await db.execute(
      'CREATE TABLE users('
      'id INTEGER PRIMARY KEY,'
      ' name TEXT NOT NULL, '
      'last_name TEXT NOT NULL, '
      'phone_number TEXT NOT NULL,'
      ' email TEXT NOT NULL,'
      ')',
    );

    await db.execute(
      'CREATE TABLE laundry('
      'id INT PRIMARY KEY,'
      'name TEXT NOT NULL,'
      'adress TEXT NOT NULL,'
      'phone_number TEXT NOT NULL,'
      ' email TEXT NOT NULL,',
    );
  }

  Future<int> insertUser(User user) async {
    Database db = await instance.database;
    return await db.insert('users', user.toJson());
  }

  Future<int> deleteUser(int id) async {
    Database db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> insertLaundry(Laundry laundry) async {
    Database db = await instance.database;
    return await db.insert('laundry', laundry.toJson());
  }
}
