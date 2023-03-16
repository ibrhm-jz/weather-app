import 'package:clima_meteoroligico/data/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weather;

  bool _serviceEnabled = false;
  bool _permisionEnable = false;
  Position? _position;

  WeatherModel? get weather => _weather;
  bool get serviceEnable => _serviceEnabled;
  bool? get locationPermission => _permisionEnable;
  Position? get position => _position;
  setWeather({required WeatherModel weather}) {
    _weather = weather;
  }

  Future requestPermissions() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      // if (permission == LocationPermission.denied) {
      //   return Future.error('Location permissions are denied');
      // }
    }

    // if (permission == LocationPermission.deniedForever) {
    //   return Future.error(
    //       'Location permissions are permanently denied, we cannot request permissions.');
    // }
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future serviceLocation() async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    notifyListeners();
  }

  Future getPosition() async {
    _position = await Geolocator.getCurrentPosition();
  }
}
