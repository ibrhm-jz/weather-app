class AirLabsCitiesModel {
  String? cityCode;
  String? name;
  double? lat;
  double? long;
  AirLabsCitiesModel.fromJson(Map<String, dynamic> json) {
    cityCode = json.containsKey('cityCode') ? json['cityCode'] : '';
    name = json.containsKey('name') ? json['name'] : '';
    lat = double.parse(json['lat'].toString());
    long = double.parse(json['lng'].toString());
  }
}
