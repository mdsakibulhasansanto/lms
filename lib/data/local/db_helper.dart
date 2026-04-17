import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:lms/features/auth/data/model/user_model.dart';

class DatabaseHelper {

  DatabaseHelper._();

  // ============= Singleton instance ==============
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _db;

  //============= Database getter ==============
  Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }

  //============= Initialize the sqlite database ==============
  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'lms.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL UNIQUE,
            phone TEXT NOT NULL,
            password TEXT NOT NULL,
            is_logged_in INTEGER NOT NULL DEFAULT 0
          )
        ''');
      },
    );
  }

  // ============= User operations ==============
  Future<int> insertUser(UserModel user) async {
    final db = await database;
    return await db.insert('users', user.toMap()..remove('id'));
  }

  // ============= Get user by email ==============
  Future<UserModel?> getUserByEmail(String email) async {
    final db = await database;
    final result = await db.query('users', where: 'email = ?', whereArgs: [email]);
    if (result.isEmpty) return null;
    return UserModel.fromMap(result.first);
  }

  // ============= Get currently logged in user ==============
  Future<UserModel?> getLoggedInUser() async {
    final db = await database;
    final result = await db.query('users', where: 'is_logged_in = ?', whereArgs: [1], limit: 1);
    if (result.isEmpty) return null;
    return UserModel.fromMap(result.first);
  }

  // ============= Set user as logged in ==============
  Future<void> setLoggedIn(int userId) async {
    final db = await database;
    await db.update('users', {'is_logged_in': 1}, where: 'id = ?', whereArgs: [userId]);
  }

  // ============= Set user as logged out ==============
  Future<void> clearAllSessions() async {
    final db = await database;
    await db.update('users', {'is_logged_in': 0});
  }

  // ============= Check if email already exists ==============
  Future<bool> emailExists(String email) async {
    final user = await getUserByEmail(email);
    return user != null;
  }
}

