import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<void> _createDB(Database db, int version) async {
    /*
    await db.execute('''
      CREATE TABLE workouts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        category TEXT NOT NULL,
        duration_minutes INTEGER NOT NULL
      )
    '''); */

    await db.execute('''
  CREATE TABLE huespedes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    numero_documento TEXT NOT NULL,
    telefono TEXT NOT NULL,
    correo_electronico TEXT NOT NULL
  )
  ''');

  await db.execute('''
  CREATE TABLE rooms (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  number TEXT NOT NULL,
  description TEXT NOT NULL,
  price REAL NOT NULL,
  isAvailable INTEGER NOT NULL DEFAULT 1
)
  ''');
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('hotel_local.db');
    return _database!;
  }
}
