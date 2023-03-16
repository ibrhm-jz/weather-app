import 'package:clima_meteoroligico/data/models/airlabs_cities_model.dart';
import 'package:clima_meteoroligico/data/models/airlabs_countrys_model.dart';
import 'package:flutter/material.dart';

class AirLabsProvider with ChangeNotifier {
  List<AirLabsCountryModel> _countries = [];
  List<AirLabsCitiesModel> _cities = [];

  List<AirLabsCountryModel> get countries => _countries;
  List<AirLabsCitiesModel> get cities => _cities;

  setListCountris({required List<AirLabsCountryModel> countries}) {
    _countries = countries;
  }

  setListCities({required List<AirLabsCitiesModel> cities}) {
    _cities = cities;
  }
}
