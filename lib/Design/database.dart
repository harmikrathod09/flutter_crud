import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUser {
  static const ID = "id";
  static const NAME = "name";
  static const CITY = "city";
  static const DB = "user.db";
  static const TABLE = "user";

  static const VERSION = 1;

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(),DB);

    return openDatabase(
      path,
      version: VERSION,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $TABLE("
          "$ID INTEGER PRIMARY KEY AUTOINCREMENT,"
          "$NAME TEXT,"
          "$CITY TEXT"
          ")",
        );
      },
    );
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await initDatabase();
    return await db.insert(TABLE, user);
  }

  Future<List<Map<String, dynamic>>> getUser() async {
    final db = await initDatabase();
    return await db.query(TABLE);
  }

  Future<int> updateUser(user) async {
    final db = await initDatabase();
    return await db.update(TABLE, user, where: '$ID=?', whereArgs: [user[ID]]);
  }

  Future<int> deleteUser(id) async {
    final db = await initDatabase();
    return await db.delete(TABLE,where: '$ID=?',whereArgs: [id]);
  }
}
