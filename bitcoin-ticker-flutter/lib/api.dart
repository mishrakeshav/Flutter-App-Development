import 'package:http/http.dart' as http;
import 'package:bitcoin_ticker/constants.dart';
import 'dart:convert';

Future<String> getBTCExchangeRate(String currency) async {
  http.Response response =
      await http.get('$baseURL/BTC/$currency?apikey=$apiKey');
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    return decodedData['rate'].toInt().toString();
  } else {
    return '?';
  }
}
