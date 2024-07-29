// services/db_service.dart

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task/screen/model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'form_data.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE formData(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT,
            time TEXT,
            staff TEXT,
            participants TEXT,
            budget TEXT,
            choice TEXT,
            reason TEXT,
            activity TEXT,
            noactivity TEXT,
            obj TEXT,
            noobj TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertFormData(FormDataModel formData) async {
    final db = await database;
    await db.insert(
      'formData',
      formData.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<FormDataModel>> getFormData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('formData');

    return List.generate(maps.length, (i) {
      return FormDataModel.fromMap(maps[i]);
    });
  }

  Future<void> updateFormData(FormDataModel formData) async {
    final db = await database;
    await db.update(
      'formData',
      formData.toMap(),
      where: 'id = ?',
      whereArgs: [formData.id],
    );
  }

  Future<void> deleteFormData(int id) async {
    final db = await database;
    await db.delete(
      'formData',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
