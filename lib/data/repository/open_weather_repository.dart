import 'dart:convert';

import 'package:clima_meteoroligico/constants/constants.dart';
import 'package:clima_meteoroligico/data/models/weather_model.dart';
import 'package:clima_meteoroligico/data/utils/api_utils.dart';
import 'package:http/http.dart' as http;
import 'package:clima_meteoroligico/data/routes/routes.dart';

class OpenWeatherRepository {
  Future<WeatherModel> getWeater({
    required String latitude,
    required String longitude,
    String unit = 'metric',
  }) async {
    Uri baseUri = buildUri(url: weatherUrl, API_WEATHER, params: {
      'lat': latitude,
      'lon': longitude,
      'appid': keyWeather,
      'units': unit,
    });
    http.Response response = await http.get(
      baseUri,
    );
    final data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
