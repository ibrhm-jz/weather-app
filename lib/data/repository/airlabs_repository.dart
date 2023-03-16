import 'dart:convert';

import 'package:clima_meteoroligico/constants/constants.dart';
import 'package:clima_meteoroligico/data/models/airlabs_countrys_model.dart';
import 'package:clima_meteoroligico/data/utils/api_utils.dart';
import 'package:http/http.dart' as http;
import 'package:clima_meteoroligico/data/routes/routes.dart';

class AirLabsRepository {
  Future<List<AirLabsCountryModel>> getCountries() async {
    Uri baseUri = buildUri(url: airLabsUrl, countriesAPI, params: {
      'api_key': keyCityes,
    });
    http.Response response = await http.get(
      baseUri,
    );
    final data = jsonDecode(response.body);

    List<AirLabsCountryModel> countryes = [];
    for (var item in data['response']) {
      countryes.add(AirLabsCountryModel.fromJson(item));
    }
    return countryes;
  }
}
