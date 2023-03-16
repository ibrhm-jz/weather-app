import 'package:clima_meteoroligico/data/models/airlabs_countrys_model.dart';
import 'package:flutter/material.dart';

class AirLabsProvider with ChangeNotifier {
  List<AirLabsCountryModel> _countries = [];
}
