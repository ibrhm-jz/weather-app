import 'package:flutter_dotenv/flutter_dotenv.dart';

final String imgUrl = dotenv.get('IMG_URL');
final String weatherUrl = dotenv.get('WEATHER_URL');
final String keyWeather = dotenv.get('API_KEY_WEATHER');
final String keyCityes = dotenv.get('API_KEY_CITYES');
