import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._internal();

  static DB get instance => DB._internal();
  Future<Database> openDb() async {
    return openDatabase(
      join(await getDatabasesPath(), 'weather_database.db'),
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE locations(id INTEGER PRIMARY KEY , name TEXT,lat TEXT, long TEXT)",
        );
      },
      version: 1,
    );
  }
}
