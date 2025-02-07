import 'dart:convert';

RatesModel ratesModelFromJson(String str){
  return RatesModel.fromJson(json.decode(str));
}

class RatesModel {
  final String disclaimer;
  final String license;
  final int timestamp;
  final String base;
  final Map<String, double> rates;

  RatesModel({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  // Factory constructor to create an instance from JSON
  factory RatesModel.fromJson(Map<String, dynamic> json) {
    Map<String, double>rates = {};
    (json['rates'] as Map<String, dynamic>).forEach((k, v) {
      if(v is int){
        rates[k] = v.toDouble();
      }
      else if(v is double){
        rates[k] = v;
      }
      else {
        // Handle unexpected types if necessary
        throw FormatException('Unexpected type for rate value: $v');
      }
    },);

    return RatesModel(
      disclaimer: json['disclaimer'],
      license: json['license'],
      timestamp: json['timestamp'],
      base: json['base'],
      rates: rates,
    );
  }

  // Convert the Dart object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'disclaimer': disclaimer,
      'license': license,
      'timestamp': timestamp,
      'base': base,
      'rates': rates.map((k, v){
        return MapEntry<String, double>(k, v);
      }),
    };
  }
}
