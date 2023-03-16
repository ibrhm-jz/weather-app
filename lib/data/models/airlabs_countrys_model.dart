class AirLabsCountryModel {
  String? code;
  String? code3;
  String? name;
  AirLabsCountryModel.fromJson(Map<String, dynamic> json) {
    code = json.containsKey('code') ? json['code'] : '';
    code3 = json.containsKey('code3') ? json['code3'] : '';
    name = json.containsKey('name') ? json['name'] : '';
  }
}
