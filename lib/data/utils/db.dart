import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  Future<Database> openDb() async {
    return openDatabase(
      join(await getDatabasesPath(), 'weather_database.db'),
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE cityes(id INTEGER PRIMARY KEY , name TEXT,lat TEXT, long TEXT)",
        );
      },
      version: 1,
    );
  }
}
