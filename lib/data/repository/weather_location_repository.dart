import 'package:clima_meteoroligico/data/models/weather_location_model.dart';
import 'package:clima_meteoroligico/data/utils/db.dart';

import 'package:sqflite/sqflite.dart';

class WeatherLocationRepository {
  DB db = DB.instance;
  Future<int> insertLocation(WeatherLocationModel weatherLocations) async {
    Database database = await db.openDb();
    return await database.insert("locations", weatherLocations.toMap());
  }

  Future<int> deleteLocation(WeatherLocationModel weatherLocations) async {
    Database database = await db.openDb();
    return await database
        .delete("locations", where: "id = ?", whereArgs: [weatherLocations.id]);
  }

  Future<List<WeatherLocationModel>> getLocations() async {
    Database database = await db.openDb();
    final List<Map<String, dynamic>> locations =
        await database.query('locations');
    return List.generate(
      locations.length,
      (i) => WeatherLocationModel(
        id: locations[i]['id'],
        name: locations[i]['name'],
        lat: locations[i]['lat'],
        long: locations[i]['long'],
      ),
    );
  }
}
