import 'dart:convert';

class ChampionResponseModel {
  Map<String, dynamic>? data;

  ChampionResponseModel.fromJson(String jsonString) {
    Map<String, dynamic> decoder = jsonDecode(jsonString);
    data = decoder['data'];
  }

  String? getFirstChampionName() {
    return data?.keys.first; 
  }
}
