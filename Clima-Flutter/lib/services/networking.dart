import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/utilities/constants.dart';

class NetworkHelper {
  NetworkHelper({
    @required this.url,
  });
  final String url;
  void getData(longitude, latitude) async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kApiKey');

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print(decodedData);
    } else {
      print(response.statusCode);
    }
  }
}
