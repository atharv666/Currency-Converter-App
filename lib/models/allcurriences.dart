import 'dart:convert';

Map<String, String> allcurriencesFromJson(String str){
  return Map.from(json.decode(str)).map((k, v){
    return MapEntry<String, String>(k, v);
  });
}

