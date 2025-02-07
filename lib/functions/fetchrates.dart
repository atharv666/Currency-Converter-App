import 'package:currency_convertor/models/allcurriences.dart';
import 'package:currency_convertor/models/rates.dart';
import 'package:currency_convertor/utils/apikey.dart';
import 'package:http/http.dart' as http;

Future<RatesModel>fetchrates()async{
  var response = await http.get(Uri.parse('https://openexchangerates.org/api/latest.json?app_id=' + key));
  final result = ratesModelFromJson(response.body);
  return result;
}

Future<Map>fetchcurriences()async{
  var response = await http.get(Uri.parse('https://openexchangerates.org/api/currencies.json?app_id=' + key));
  final allCurriences = allcurriencesFromJson(response.body);
  return allCurriences;
}


String convertUSD(Map exchangeRates, String usd, String currency){
  String output = ((exchangeRates[currency] * double.parse(usd)).toStringAsFixed(2)).toString();
  return output;
}

String convertANY(Map exchangeRates, String amount, String currency1, String currency2){
  double output1 = ((double.parse(amount) / exchangeRates[currency1]));
  String output2 = convertUSD(exchangeRates, output1.toString(), currency2);
  return output2;
}