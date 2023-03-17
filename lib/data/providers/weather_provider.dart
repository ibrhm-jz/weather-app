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

  Future convertToCelsius() async {
    switch (weather!.format) {
      case 'F':
        await _convertFarenheitToCelsius();
        break;
      case 'K':
        await _convertKelvinToCelsius();
        break;
    }
  }

  Future convertToFarenheit() async {
    switch (weather!.format) {
      case 'C':
        await _convertCelsiusToFarenheit();
        break;
      case 'K':
        await _convertKelvinToFarenheit();
        break;
    }
  }

  Future convertToKelvin() async {
    switch (weather!.format) {
      case 'C':
        await _convertCelsiusToKelvin();
        break;
      case 'F':
        await _convertFarenheitToKelvin();
        break;
    }
  }

  Future _convertFarenheitToCelsius() async {
    _weather!.tempMax = (_weather!.tempMax! - 32) * 5 / 9;
    _weather!.tempMin = (_weather!.tempMin! - 32) * 5 / 9;
    _weather!.temp = (_weather!.temp! - 32) * 5 / 9;
    _weather!.format = 'C';
    notifyListeners();
  }

  Future _convertKelvinToCelsius() async {
    _weather!.tempMax = _weather!.tempMax! - 273.15;
    _weather!.tempMin = _weather!.tempMin! - 273.15;
    _weather!.temp = _weather!.temp! - 273.15;
    _weather!.format = 'C';
    notifyListeners();
  }

  Future _convertCelsiusToFarenheit() async {
    _weather!.tempMax = ((_weather!.tempMax! * 9 / 5) + 32);
    _weather!.tempMin = ((_weather!.tempMin! * 9 / 5) + 32);
    _weather!.temp = ((_weather!.temp! * 9 / 5) + 32);
    _weather!.format = 'F';
    notifyListeners();
  }

  Future _convertKelvinToFarenheit() async {
    _weather!.tempMax = (_weather!.tempMax! - 273.15) * 9 / 5 + 32;
    _weather!.tempMin = (_weather!.tempMin! - 273.15) * 9 / 5 + 32;
    _weather!.temp = (_weather!.temp! - 273.15) * 9 / 5 + 32;
    _weather!.format = 'F';
    notifyListeners();
  }

  Future _convertCelsiusToKelvin() async {
    _weather!.tempMax = (_weather!.tempMax! + 273.15);
    _weather!.tempMin = _weather!.tempMin! + 273.15;
    _weather!.temp = _weather!.temp! + 273.15;
    _weather!.format = 'K';
    notifyListeners();
  }

  Future _convertFarenheitToKelvin() async {
    _weather!.tempMax = (_weather!.tempMax! - 32) * 5 / 9 + 273.15;
    _weather!.tempMin = (_weather!.tempMin! - 32) * 5 / 9 + 273.15;
    _weather!.temp = (_weather!.temp! - 32) * 5 / 9 + 273.15;
    _weather!.format = 'K';
    notifyListeners();
  }
}
