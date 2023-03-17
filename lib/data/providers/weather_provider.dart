import 'package:clima_meteoroligico/data/models/weather_location_model.dart';
import 'package:clima_meteoroligico/data/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weather;

  WeatherModel? get weather => _weather;
  List<WeatherLocationModel> _weatherLocations = [];
  List<WeatherLocationModel> get weatherLocations => _weatherLocations;

  setWeather({required WeatherModel weather}) {
    _weather = weather;
  }

  setWeatherLocations({required List<WeatherLocationModel> weatherLocations}) {
    _weatherLocations = weatherLocations;
  }

  deleteWeatherLocations({required int index}) {
    _weatherLocations.removeAt(index);
    notifyListeners();
  }
}
