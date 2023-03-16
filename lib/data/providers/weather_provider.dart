import 'package:clima_meteoroligico/data/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weather;

  WeatherModel? get weather => _weather;

  setWeather({required WeatherModel weather}) {
    _weather = weather;
  }
}
