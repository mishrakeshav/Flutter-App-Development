import 'package:clima/services/networking.dart' as networking;
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/location.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getCityWeatherData(String cityName) async {
    Location location = Location();
    await location.getLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    print(latitude);
    print(longitude);
    networking.NetworkHelper networkHelper = networking.NetworkHelper(
      url: '$kOpenWeatherMapURL?q=$cityName&appid=$kApiKey&units=metric',
    );
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    print(latitude);
    print(longitude);
    networking.NetworkHelper networkHelper = networking.NetworkHelper(
      url:
          '$kOpenWeatherMapURL?lat=$latitude&lon=$longitude&appid=$kApiKey&units=metric',
    );
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
