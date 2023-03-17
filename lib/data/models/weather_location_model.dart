class WeatherLocationModel {
  int? id;
  String? name;
  String? lat;
  String? long;

  WeatherLocationModel({
    this.id,
    this.name,
    this.lat,
    this.long,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lat': lat,
      'long': long,
    };
  }
}
