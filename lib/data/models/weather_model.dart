class WeatherModel {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  double? pressure;
  double? humidity;
  String? weatherMain;
  String? weatherDescription;
  String? weatherIcon;
  double? speed;
  String? cityName;
  String? format;
  WeatherModel.fromJson(Map<String, dynamic> json) {
    temp = double.parse(json['main']['temp'].toString());
    feelsLike = double.parse(json['main']['feels_like'].toString());
    tempMin = double.parse(json['main']['temp_min'].toString());
    tempMax = double.parse(json['main']['temp_max'].toString());
    pressure = double.parse(json['main']['pressure'].toString());
    humidity = double.parse(json['main']['humidity'].toString());
    weatherMain = json.containsKey('weather') ? json['weather'][0]['main'] : '';
    weatherDescription =
        json.containsKey('weather') ? json['weather'][0]['description'] : '';
    weatherIcon = json.containsKey('weather') ? json['weather'][0]['icon'] : '';
    speed = json.containsKey('wind')
        ? double.parse(json['wind']['speed'].toString())
        : 0.0;
    cityName = json.containsKey('name') ? json['name'] : '';
    format = 'C';
  }
}
